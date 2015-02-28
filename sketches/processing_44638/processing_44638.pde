
/* This sketch colours a pattern of random bouncing balls from a live video image 
AND allows ball speed to be controlled by a potentiometer

STATUS: WORKING: 1) Ball speed is controlled by the pot. 
2) The colour of each ball is being drawn from the corresponding video pixel 

Title: Bouncing Balls/Video Pixels with Pot Control (for Ball Speed)
Exercise: Week 8: Merging Arduino and Processing 
By: David Oppenheim
Filename: Week08_Ex_ProcessingArduino_PatternVideo_v2_1
Date created: October 27, 2011
Modified: November 1, 2011
Wiring: Potentiometer to AO (and one side to +5V, other side to grnd)

Attribution: this sketch draws on Examples 16-9 and 16-10 in Learning Processing 
by Daniel Shiffman. The bouncing balls are partially from an earlier exercise I completed 
(filename: Week03_Ex_FinalProject_Test_ManyBalls_Arrays_v3_1).
With assistance from Dustin Freeman and Jim Ruxton. 
 
*/

import processing.video.*;
import processing.serial.*;
Serial myPort; // The serial port
int speedAdjust; // Variable to control speed from pot

// BALL VARIABLES (GLOBAL)

int ballRadius = 7;

// DECLARE AND INITIALIZE ARRAYS

int [] manyBallsX = new int [4250];
int [] manyBallsY = new int [4250];
float [] ballSpeed = new float [4250]; 

// VARIABLE TO HOLD ONTO CAPTURE OBJECT

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
    manyBallsX[i] = int(random(0, 50)); // give the X location a random variable between 0 and 50
  }

// For LOOP giving ball random STARTING Y location (initialize manyBallsY array / assign the first value in the array manyBallsYs)

  for (int i = 0; i < manyBallsY.length; i++) {
    manyBallsY[i] = int(random(479)); // random Y location between 0 and 480 (height of sketch window)
  }

// For LOOP giving ballSpeed random value

  for (int i = 0; i < ballSpeed.length; i++) {
    ballSpeed[i] =(random(1,7)); // initialize ballSpeed array with random speed between 1 and 7
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
//  image(video,0,0);
  }
  
  video.loadPixels();
  displayBall();
  bounceBalls();

} 

void displayBall() {  
  
  for (int i = 0; i < manyBallsX.length; i++) {
      
 // COLOR VARIABLE (C) 
    // Draws colour from video pixels
    int pixelIndex = int (manyBallsX [i] )  + int(manyBallsY [i] * width);
    pixelIndex=constrain (pixelIndex, 0, 640*480-1); // constrain to within video window
    color c = video.pixels[pixelIndex];
    
   // Draw the balls, filling them with colour value from video pixel (video feed)
   fill(c);
   ellipse(manyBallsX[i], manyBallsY[i], ballRadius, ballRadius); 
// ballRadius = constrain(ballRadius-1,7,10); // constrain formula to give illusion of "bounce" when hits wall
   }
}

// BRING IN POT VALUE

void serialEvent (Serial myPort) {
// get the byte:
int inByte = myPort.read();
// print it:
println(inByte);
speedAdjust=inByte;
}

void bounceBalls() {
  
    // Bounce balls
   for (int i = 0; i < manyBallsX.length; i++) {
     
     manyBallsX[i] = manyBallsX[i] + int(ballSpeed[i] * speedAdjust/12); // give speed along X
     
  //   manyBallsX[i] = manyBallsX[i] + ballSpeed[i]*(speedAdjust-128)/12; // give speed along X  // CODE THAT allows you to reverse balls (midpoint being when pot value is 128) 
     
     if ((manyBallsX[i] >= width) || (manyBallsX[i] <= 0)) { // reverse direction (bounce balls back)
     ballSpeed[i] = ballSpeed[i] * -1; // change direction
 //  ballRadius = 10; // increase size when ball reaches end (wall) to give illusion of bouncing
    }
   
   
  }
}

