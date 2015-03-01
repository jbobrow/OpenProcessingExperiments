
// Graph TWO values in Processing - modified
 
// Takes ASCII-encoded strings from serial port at 9600 baud and graphs them.
// Expects COMMA-SEPARATED values in the range 0 to 1023, followed by a newline, or newline and carriage return
 
// Created 30 Apr 2012, Modified Oct 2013
// by Eric Forman
// (based on Virtual Color Mixer and Graph examples by Tom Igoe)

 
int numValues = 2;    // number of input values or sensors
 
// rename these variables for your input:
float A = 0;          // red value
int Amin = 0;
int Amax = 1023;
 
float B = 0;          // green value
int Bmin = 0;
int Bmax = 1023;
 
float partH;          // partial screen height
 
int xPos = 1;         // horizontal position of the graph
 
 
void setup() {
  size(800, 600);
  partH = height / numValues;    // to divide screen up to draw the number of sensors
  

  background(0);
}
 
void draw() {
   // in this example, everything happens inside serialEvent()
   // but you can also do stuff in every frame if you wish
     // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
  //println(inString);        // < - uncomment this to debug serial input from Arduino
  
  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // split the string on the commas and convert the resulting substrings into an integer array:
    int[] values = int(split(inString, ","));
    // if the array has at least the # of elements as your # of sensors, you know
    // you got the whole data packet.  Map the numbers and put into the variables:
    if (values.length >= numValues) {
      // map them to the range of partial screen height:
      A = map(values[0], Amin, Amax, 0, partH);
      B = map(values[1], Bmin, Bmax, 0, partH);
      //println(A + "\t" + B);   // < - uncomment this to debug mapped values
      
      // draw lines:
      stroke(255, 0, 0);  // red
      line(xPos, partH,   xPos, partH    - A);
      stroke(0, 255, 0);  // green
      line(xPos, partH*2, xPos, partH*2  - B);
      
      // draw dividing lines:
      stroke(255);
      line(0, partH,   width, partH);
      line(0, partH*2, width, partH*2);
 
      // if at the edge of the screen, go back to the beginning:
      if (xPos >= width) {
        xPos = 0;
        background(0);   // erase screen with black
      } 
      else {
        xPos++;          // increment the graph's horizontal position
      }
    }
  }
}
 
 

