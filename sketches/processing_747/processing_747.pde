
/**
 * HTTP Client. 
 * 
 * Starts a network client that connects to a server on port 80,
 * sends an HTTP 1.1 GET request, and prints the results. 
 */


import processing.net.*;
import java.lang.StringBuilder;
import java.applet.Applet;

Client c;
StringBuilder data;
PFont font;
String host, file;
PVector start, change;

void setup() {
  start = new PVector(0,0);
  change = new PVector(0,0);
  Applet thisApplet = (Applet)this;
  try{
  host = thisApplet.getDocumentBase().getHost();
  file = thisApplet.getDocumentBase().getFile();
  } catch ( NullPointerException e )
  {
     println( "Normally I don't catch exceptions, but this is"
      + "\na special cercumstance" );
  }
  size(600, 600);
  background(50);
  fill(200);
  textFont( createFont( "arial", 18 ) );
  data = new StringBuilder();
  c = new Client(this, host, 80); // Connect to server on port 80
  c.write("GET / HTTP/1.1\n"); // Use the HTTP "GET" command to ask for a Web page
  c.write("Host: " + host + "\n\n"); // Be polite and say who we are
}

void draw() {
  translate( change.x, change.y );
  scale( 2, 2 );
  cursor(MOVE);
  background( 50 );
  fill( 200 );
  if (c.available() > 0) { // If there's incoming data from the client...
    data.append( c.readString() ); // ...then grab it and print it
  }
  text( data.toString(), 10, 10 );
}

void mouseDragged()
{
  change.x += mouseX - pmouseX;
  change.y += mouseY - pmouseY;  
}

