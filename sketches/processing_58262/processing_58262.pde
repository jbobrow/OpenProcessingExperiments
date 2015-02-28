
/*
  Bitmask + bitshifting demo
 
 This demo will cycle though 0 to 256 and use the 
 binary representation of the current value to 
 change the colors of an array of 8 squares  
 
 Resources: 
 http://arduino.cc/en/Tutorial/BitMask
 http://www.arduino.cc/playground/Code/BitMath#bit_shift
 
 April 7, 2012
 http://machinevisions.tumblr.com
 */

// sketch canvas size
int canvasHeight = 50;
int canvasWidth = 400;
int squareSize = 50;
// the number of squares to draw to the screen
int numSquares = 8;
// this is the current value that is getting drawn to the screen
int currentValue = 4;

void setup() {
  size(canvasWidth, canvasHeight);
  // black backgrounds are the sex
  background(0);
  // make every shape have a white outline
  stroke(255);
  // slow the frame rate of the animation to 10 frames/sec
  frameRate(10);
}

void draw() {
  // Set the background to black
  background(0);   
  // increment currentValue
  incrementValue();
  // draw the value of currentValue to the screen
  drawPattern(currentValue);
}

void drawPattern(int pattern) {
  // this variable represents the state of a square, 1 = on - 0 = off
  int state;

  // iterate though the 8bit pattern value and set the bit values to the squares on the screen
  for (int j = 0; j < 8; j++) {
    // get the value of the last (lowest) bit
    state = pattern & 1;
    // set the color of te square: off = black,  grey
    fill(state * 200);
    // draw the square to the canvs, using the globals to scale them to the canvas size
    rect( j * (canvasWidth/numSquares), 0, squareSize, squareSize);
    // shift the value of pattern by one bit to the right (m = 8 >> 3; In binary: 1000 to 1)
    pattern = pattern >> 1;
  }
}

// this controls the incrementing of the value of the variable that will get drawn to te screen
// it will cycle the global variable currentValue from 0 to 255 to get all bitpatterns for an 8 bit number
void incrementValue() {
  if (currentValue <= 256) {
    //iterate currentValue
    currentValue++;
  }
  // if the value exceeds 256, reset it!
  else {
    currentValue = 0;
  }
}

