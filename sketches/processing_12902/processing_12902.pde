
import hypermedia.net.*;    // import UDP library


UDP udp;  // define the UDP object (sets up)

/**
 * init
 */
void setup() {
 size(480,640);
 background(0);
 smooth();
  // create a new datagram connection on port 6000
  // and wait for incoming message
  udp = new UDP( this, 6000 );  
udp.log( true ); 		// <-- printout the connection activity
  udp.listen( true );
}

// void receive( byte[] data ) { 			// <-- default handler
void receive( byte[] data, String ip, int port ) {	// <-- extended handler
  
  
  // get the "real" message =
  String message = new String( data );
  String[] parts = split(message, "&");
  int sentX = int(parts[0]);
  int sentY = int(parts[1]);    //"24" -> 24
  
  
  line(width-sentX , sentY , random(0, 480), 0);
  stroke (random(0, 150));

  
  // print the result
  println( "receive: x = \""+sentX+"\" y = \""+sentY+"\"");
}


void draw() {}


