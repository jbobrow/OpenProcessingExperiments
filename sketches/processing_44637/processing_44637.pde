
/* This sketch colours a pattern of random bouncing balls from a live video image 
AND allows ball speed to be controlled by a potentiometer

* This version (v1_1) also allows ball radius to be controlled by the same pot.

STATUS: PARTIALLY WORKING: 1) Ball speed is controlled by the pot. 
2) The colour of each ball is being drawn from the corresponding video pixel BUT it seems as if
it's only working along the Y-axis: move a coloured pen (or any small object) up and down and then from side to 
side to see evidence of this.

Title: Bouncing Balls/Video Pixels with Pot Control (for Ball Speed)
Excercise: Week 8: Merging Arduino and Processing 
By: David Oppenheim
Date: October 27, 2011
Modified:
Attribution: this sketch draws on Examples 16-9 and 16-10 in Learning Processing by Daniel Shiffman, and assistance from Dustin 
The bouncing balls are from an early exercise I completed, filename: Week03_Ex_FinalProject_Test_ManyBalls_Arrays_v3_1
 
*/

import processing.video.*;
import processing.serial.*;
Serial myPort; // The serial port
int speedAdjust; // Variable to control speed from pot

// BALL VARIABLES (GLOBAL)

int ballRadius = 8;
int radiusAdjust; 

// DECLARE AND INITIALIZE ARRAYS

float [] manyBallsX = new float[1000];
float [] manyBallsY = new float[1000];
float [] ballSpeed = new float [1000]; 

// Variable to hold onto Capture object
Capture video;

// SETUP

void setup() {
  size(640,480); 
  smooth();
  frameRate(25);
  
// Start the capture process
  video = new Capture(this,width,height,15); 

// List all the available serial ports
println(Serial.list());
String portName = Serial.list()[0];
myPort = new Serial(this, portName, 9600);
 
// For LOOP giving ball random STARTING X location (initialize manyBallsX array / assign the first value in the array manyBallsX)

for (int i = 0; i < manyBallsX.length; i++) {
  manyBallsX[i] = random(0, 50); // give the X location a random variable between 0 and 50
  }

// For LOOP giving ball random STARTING Y location (initialize manyBallsY array / assign the first value in the array manyBallsYs)

for (int i = 0; i < manyBallsY.length; i++) {
  manyBallsY[i] = random(479); // random Y location between 0 and 480 (height of sketch window)
  }

// For LOOP giving ballSpeed random value

for (int i = 0; i < ballSpeed.length; i++) {
  ballSpeed[i] = random(1,7); // initialize ballSpeed array with random speed between 1 and 7
  }
}

// DRAW

void draw() {
  background(255);  
  
 // image(video,0,0);
  
  // Ellipse mode
  ellipseMode(RADIUS);
  
  // Read image from the camera
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  displayBall();
  bounceBalls();


} 

// BRING IN POT VALUE

void serialEvent (Serial myPort) {
// get the byte:
int inByte = myPort.read();
// print it:
println(inByte);
speedAdjust=inByte;
radiusAdjust=inByte/15;
}

void displayBall() {  
  
  for (int i = 0; i < manyBallsX.length; i++) {
  
   // Pick the color from the video, reversing x (creating mirror)
  // color c = video.pixels[(width - i - 1) + i*video.width]; // OLD COLOR CODE THAT DREW color from video image but didn't map to ball position (ManyBallsX)
  color c = video.pixels[int (manyBallsX [i] )  + int(manyBallsY [i] * width)];

   
   // Draw the balls, filling them with colours captured by the video feed
   fill(c);
   ellipse(manyBallsX[i], manyBallsY[i], radiusAdjust, radiusAdjust); 
// ballRadius = constrain(ballRadius-1,15,22); // constrain formula to give illusion of "bounce" when hits wall
   }
}


void bounceBalls() {
  
    // Bounce balls
   for (int i = 0; i < manyBallsX.length; i++) {
     
     manyBallsX[i] = manyBallsX[i] + ballSpeed[i]*speedAdjust/20; // give speed along X   
     
     if ((manyBallsX[i] >= width) || (manyBallsX[i] <= 0)) { // reverse direction (bounce balls back)
     ballSpeed[i] = ballSpeed[i] * -1; // change direction
 //  ballRadius = 22; // increase size when ball reaches end (wall) to give illusion of bouncing
    }
   
   
  }
}

