
import processing.net.*;
import codeanticode.eliza.*;

int curTime;
int prevTime;
float deltaTime;

final int MODE_INIT = 0;
final int MODE_SERVER = 1;
final int MODE_CLIENT = 2;
final int MODE_SERVER_WAITING = 3;
final int MODE_HANDSHAKE = 4;

final int MSG_HANDSHAKE = 0;
final int MSG_HEARTBEAT = 1;
final int MSG_READY = 2;
final int MSG_STRINGMESSAGE = 3;

final float HEARTBEAT_INTERVAL = 1.0;
final float HEARTBEAT_TIMEOUT = 10.0;

String string;
String input;
Eliza eliza;

Server server;
Client client;

int mode;
int port;
float timer;
float heartbeatTimer;



void setup() {
  size( 800, 600 );
  
  curTime = 0;
  prevTime = 0;
  deltaTime = 0;
  
  textAlign( LEFT, BOTTOM );
  
  string = "";
  input = "";
  
  mode = MODE_INIT;
  port = 0;
  timer = 0.0;
  heartbeatTimer = 0.0;
  
  PrintHelp( "all" );
}


void draw() {
  Update();
  
  String cursor = "|";
  if( (millis()/1000)%2 == 1 )
    cursor = "";
    
  background( 150 );
  fill( 200 );
  stroke( 0 );
  rect( 5, 5, 790, 550 );
  rect( 5, 560, 790, 35 );
  
  noStroke();
  fill( 0 );
  textAlign( LEFT, BOTTOM );
  text( string, 10, 10, 780, 545 );
  textAlign( LEFT, TOP );
  text( input + cursor, 10, 560, 780, 35 );
  
  fill( 175 );
  stroke( 0 );
  rect( 600, 5, 195, 25 );
  
  noStroke();
  fill( 0 );
  textAlign( CENTER, CENTER );
  switch( mode ) {
    case MODE_INIT:
      text( "MODE_INIT", 600, 5, 195, 25 );
      break;
    
    case MODE_SERVER:
      text( "MODE_SERVER", 600, 5, 195, 25 );
      break;
    
    case MODE_CLIENT:
      text( "MODE_CLIENT", 600, 5, 195, 25 );
      break;
    
    case MODE_SERVER_WAITING:
      text( "MODE_SERVER_WAITING", 600, 5, 195, 25 );
      break;
    
    case MODE_HANDSHAKE:
      text( "MODE_HANDSHAKE", 600, 5, 195, 25 );
      break;
  }
}

void Update() {
  prevTime = curTime;
  curTime = millis();
  deltaTime = ( curTime - prevTime ) / 1000.0f;
  
  switch( mode ) {
    
    case MODE_SERVER:
      timer += deltaTime;
      heartbeatTimer += deltaTime;
      
      Heartbeat();
      
      if( timer > HEARTBEAT_TIMEOUT ) {
        string += "\nCLIENT TIMED OUT";
        string += "\nDisconnecting client.";
        for( int i = 0; i < server.clientCount; i++ )
          server.disconnect( server.clients[i] );
        
        timer = 0.0;
        heartbeatTimer = 0.0;
        mode = MODE_SERVER_WAITING;
      }
      
      PollClients();
      break;
      
    case MODE_SERVER_WAITING:
      PollClients();
      return;
    
    case MODE_CLIENT:
      timer += deltaTime;
      heartbeatTimer += deltaTime;
      
      Heartbeat();
      
      if( timer > HEARTBEAT_TIMEOUT ) {
        string += "\nSERVER TIMED OUT";
        string += "\nDisconnecting from server.";
        client.stop();
        client = null;
        
        timer = 0.0;
        heartbeatTimer = 0.0;
        mode = MODE_INIT;
      }
      break;
    
    case MODE_HANDSHAKE:
      timer += deltaTime;
      
      if( timer > 5.0 ) {
        string += "\nCONNECTION TO SERVER ON PORT " + port + " FAILED";
        string += "\nTimed out while waiting for handshake.";
        client = null;
        timer = 0.0;
        mode = MODE_INIT;
      }
      break;
  }
  
  TrimText();
}
  


void keyPressed() {
  if( key != CODED ) {
    switch( key ) {
    case BACKSPACE:
      input = input.substring( 0, max(0, input.length()-1) );
      break;
    case TAB:
      input += "    ";
      break;
    case ENTER:
    case RETURN:
      ParseInput();
      break;
    case ESC:
    case DELETE:
      break;
    default:
      input += key;
    }
  }
}

void ParseInput() {
  switch( mode ) {
    case MODE_INIT:
      string += "\n" + input;
      String[] tokenized = splitTokens( trim( input ).toLowerCase() );
      
      if( tokenized[0].equals( "server" ) ) {
        if( tokenized.length < 2 ) {
          PrintHelp( "server" );
          break;
        }
          
        port = int( tokenized[1] );
        if( port == 0 )
          PrintHelp( "server" );
        else {
          mode = MODE_SERVER_WAITING;
          string += "\nSERVER MODE ACTIVATED ON PORT " + port;
          string += "\nWaiting for a client...";
          server = new Server( this, port );
        }
      }
      
      else if( tokenized[0].equals( "client" ) ) {
        if( tokenized.length < 2 ) {
          PrintHelp( "server" );
          break;
        }
          
        port = int( tokenized[1] );
        if( port == 0 )
          PrintHelp( "client" );
        else {
          mode = MODE_HANDSHAKE;
          string += "\nCLIENT MODE ACTIVATED ON PORT " + port;
          string += "\nWaiting for handshake...";
          client = new Client( this, "127.0.0.1", port );
        }
      }
      
      else
        PrintHelp( "all" );
      
      break;
    
    case MODE_CLIENT:
      string += "\nYOU: " + input;
      byte[] data = new byte[ input.length() + 1 ];
      byte[] dataString = input.getBytes();
      data[0] = MSG_STRINGMESSAGE;
      for( int i = 0; i < input.length(); i++ )
        data[i+1] = dataString[i];
      client.write( data );
      break;
    
    default:
      string += "\n" + input;
      break;
  }
  
  input = "";
}

void PrintHelp( String command ) {
  if( command.equals( "server" ) ) {
    string += "\n\"server <port>\" - initialize a local chat server on specified port";
  }
  else if( command.equals( "client" ) ) {
    string += "\n\"client <port>\" - connect to a local chat on specified port";
  }
  else {
    string += "\nUse the commands \"server <port>\" or \"client <port>\" to start or join a chat server.";
  }
}

void TrimText() {
  String[] splitLines = splitTokens( string, "\n\r\f" );
  float fontHeight = textAscent() + textDescent();
  float textHeight = fontHeight * splitLines.length;
  int maxLineCount = int( 545.0 / fontHeight );
  
  if( splitLines.length > maxLineCount ) {
    string = "";
    for( int i = splitLines.length - maxLineCount; i < splitLines.length; i++ ) {
      string += splitLines[i];
      if( i != splitLines.length - 1 )
        string += "\n";
    }
  }
}




void serverEvent( Server self, Client connectedClient ) {
  string += "\nClient connected!";
  self.write( MSG_HANDSHAKE );
}

void PollClients() {
  Client received = server.available();
  
  while( received != null ) {
    int bytesAvailable = received.available();
    
    if( bytesAvailable == 0 )
      continue;
    
    int messageType = received.read();
    bytesAvailable--;
    
    if( bytesAvailable == 0 )
      HandleMessage( messageType, "" );
    else
      HandleMessage( messageType, received.readString() );
    
    received = server.available();
  }
}

void clientEvent( Client received ) {
  int bytesAvailable = received.available();
  
  if( bytesAvailable == 0 )
    return;
  
  int messageType = received.read();
  bytesAvailable--;
  
  if( bytesAvailable == 0 )
    HandleMessage( messageType, "" );
  else
    HandleMessage( messageType, received.readString() );
}


void HandleMessage( int messageType, String message ) {
  switch( messageType ) {
    case MSG_HANDSHAKE:
      if( mode == MODE_HANDSHAKE ) {
        mode = MODE_CLIENT;
        timer = 0.0;
        client.write( MSG_HANDSHAKE );
      }
      else if( mode == MODE_SERVER_WAITING ) {
        string += "\nStarting chat session...";
        mode = MODE_SERVER;
        eliza = new Eliza( this );
        string += "\nBeginning chat with Eliza.";
        server.write( MSG_READY );
      }
      else if( mode == MODE_SERVER )
        string += "\nAdditonal client attempted to join, ignoring...";
      
      break;
    
    case MSG_HEARTBEAT:
      timer = 0.0;
      break;
    
    case MSG_READY:
      if( mode == MODE_CLIENT )
        string += "\nEliza is ready!  You may begin your chat.";
      break;
    
    case MSG_STRINGMESSAGE:
      if( mode == MODE_SERVER ) {
        string += "\nCLIENT: " + message;
        String output = eliza.processInput( message );
        string += "\nELIZA: " + output;
        
        byte[] data = new byte[ output.length() + 1 ];
        byte[] dataString = output.getBytes();
        data[0] = MSG_STRINGMESSAGE;
        for( int i = 0; i < output.length(); i++ )
          data[i+1] = dataString[i];
        server.write( data );
      }
      if( mode == MODE_CLIENT ) {
        string += "\nELIZA: " + message;
      }
      break;
  }
}

void Heartbeat() {
  if( heartbeatTimer < HEARTBEAT_INTERVAL )
    return;
  
  if( mode == MODE_CLIENT )
    client.write( MSG_HEARTBEAT );
  
  if( mode == MODE_SERVER )
    server.write( MSG_HEARTBEAT );
  
  heartbeatTimer = 0.0f;
}



