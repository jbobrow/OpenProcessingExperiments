
import processing.serial.*;
 
 Serial myPort;        // The serial port
 int xPos = 1;         // horizontal position of the graph
 
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
 inByte = map(inByte, 0, 1023, 0, height);//map incomming value to height of screen
 
 line(xPos, height, xPos, height - inByte);
 stroke(255, 0, 0 );// draw the line:
 
 
 
 // at the edge of the screen, go back to the beginning:
 if (xPos >= width) {
 xPos = 0;
 background(0, 0, 0);
 }
 else {
 // increment the horizontal position:
 xPos++;
 }
 }
 }
