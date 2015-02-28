
/* This version creates a pattern mirror using a pattern of random bouncing balls
that maps onto a live video image

Title: Bouncing Balls Video Pattern Mirror
Excercise: Ex.16-4 in Learning Processing
Date: October 4, 2011
By: David Oppenheim
Attribution: this sketch draws on Examples 16-9 and 16-10 in Learning Processing by Daniel Shiffman
The bouncing balls are from an early exercise I completed, filename: Week03_Ex_FinalProject_Test_ManyBalls_Arrays_v3_1
*/

import processing.video.*;


// BALL VARIABLES (GLOBAL)

int ballRadius = 15;

// DECLARE AND INITIALIZE ARRAYS

float [] manyBallsX = new float[320];
float [] manyBallsY = new float[320];
float [] ballSpeed = new float [320]; 

// Variable to hold onto Capture object
Capture video;

// SETUP

void setup() {
  size(600,400); 
  smooth();
  frameRate(25);
  
// Start the capture process
  video = new Capture(this,width,height,15); 
  
// For LOOP giving ball random STARTING X location (initialize manyBallsX array / assign the first value in the array manyBallsX)

for (int i = 0; i < manyBallsX.length; i++) {
  manyBallsX[i] = random(0, 50); // give the X location a random variable between -100 and 50
  }

// For LOOP giving ball random STARTING Y location (initialize manyBallsY array / assign the first value in the array manyBallsYs)

for (int i = 0; i < manyBallsY.length; i++) {
  manyBallsY[i] = random(400); // random Y location between 0 and 400 (height of sketch window)
  }

// For LOOP giving ballSpeed random value

for (int i = 0; i < ballSpeed.length; i++) {
  ballSpeed[i] = random(1,7); // initialize ballSpeed array with random speed between 1 and 7
  }
}

// DRAW

void draw() {
  background(255);  
  
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

void displayBall() {  
  
  for (int i = 0; i < manyBallsX.length; i++) {
  
   // Pick the color from the video, reversing x (creating mirror)
   color c = video.pixels[(width - i - 1) + i*video.width];
   
   // Draw the balls, filling them with colours captured by the video feed
   fill(c);
   ellipse(manyBallsX[i], manyBallsY[i], ballRadius, ballRadius); 
   ballRadius = constrain(ballRadius-1,15,22); // constrain formula to give illusion of "bounce" when hits wall
   }
}

void bounceBalls() {
  
   // Bounce balls
   for (int i = 0; i < manyBallsX.length; i++) {
   if ((manyBallsX[i] >= width) || (manyBallsX[i] <= 0)) { // reverse direction (bounce balls back)
   ballSpeed[i] = ballSpeed[i] * -1; // change direction
   ballRadius = 22; // increase size when ball reaches end (wall) to give illusion of bouncing
    }
   manyBallsX[i] = manyBallsX[i] + ballSpeed[i]; // give speed along X   
   
  }
}

