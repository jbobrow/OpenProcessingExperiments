
// Processing code for this example

 
 // This program takes ASCII-encoded strings
 // from the serial port at 9600 baud and graphs them. It expects values in the
 // range 0 to 1023, followed by a newline, or newline and carriage return
 
 // Created 20 Apr 2005
 // Updated 18 Jan 2008
 // by Tom Igoe
 // This example code is in the public domain.
 
 import processing.serial.*;
 
 Serial myPort;        // The serial port
 int xPos = 1;         // horizontal position of the graph
 int x = 0;
 int y = 100;
 boolean xV = true; //store x's motion, if true then going right, if false going left
 boolean yV = true; //store y's motion, if true then going down, if false going up


 
 
 
 void setup () {
 // set the window size:
 size(800, 150);  
 frameRate(200); 
 
 
 // List all the available serial ports
 println(Serial.list());
 // I know that the first port in the serial list on my mac
 // is always my  Arduino, so I open Serial.list()[0].
 // Open whatever port is the one you're using.
 myPort = new Serial(this, Serial.list()[0], 9600);
 // don't generate a serialEvent() unless you get a newline character:
 myPort.bufferUntil('\n');
 // set inital background:
 
 }
 
 
 void draw () {
 // everything happens in the serialEvent()

 
 }
 
 void serialEvent (Serial myPort) {
 // get the ASCII string:
 String inString = myPort.readStringUntil('\n');
 

 
 if (inString != null) {
 // trim off any whitespace:
 inString = trim(inString);
 // convert to an int and map to the screen height:
 float inByte = float(inString); 

 println(inByte);

  background(255);
  stroke(0);
  strokeWeight(3);
  smooth();
  fill(255, 200, 0);
  ellipse(x, y, 30, 30);
 
 
//X direction
  if (xV) {
    x+=3;
  } else {
    x-=3;
  }
  
  if(x >= width) {
     xV = false;  
  }
  if(x <= 0) {
     xV = true;
  }


//Y direction
  if (yV) {
    y++;
  } else {
    y--;
  }
  
  if(y >= height) {
     yV = false;  
  }
  if(y <= 0) {
     yV = true;
  }
 
 println(inByte);
 if(inByte <= 500 || inByte >= 550) {
   xV = !xV;
 }
 
 
 }
 }
 

