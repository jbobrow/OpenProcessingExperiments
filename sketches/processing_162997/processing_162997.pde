
import processing.serial.*;
 
 Serial myPort;        // The serial port
 
 void setup () {
 // set the window size:
 size(1000, 300);        
 
 
 println(Serial.list());// List all the available serial ports
 myPort = new Serial(this, Serial.list()[0], 9600); // don't generate a serialEvent() unless you get a newline character:
 myPort.bufferUntil('\n');

 background(0); // set inital background:
 }
 void draw () {

 }
 
 void serialEvent (Serial myPort) {// get the ASCII string:

 String inString = myPort.readString();
 
 if (inString != null) { // trim off any whitespace:

 inString = trim(inString);// convert to an int and map to the screen height:
 float inByte = float(inString);
 inByte = map(inByte, 0, 1023, 0, width);//map incomming value to height of screen
 
 
 ellipse(inByte, 150, 100, 100);
 stroke(255, 255 ,255 );// draw the line:
 fill(255,0,0);
 

 
 // increment the horizontal position:

 }
 }

 


