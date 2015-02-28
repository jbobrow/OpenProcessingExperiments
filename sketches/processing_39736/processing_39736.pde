
/* 

Title: Test for Week 03 Final Project, Arrays
Version: Week03_Ex_FinalProject_Test_JustBalls_Arrays

Notes: this was a test to see if I could use arrays to create many circles. I wanted to create many circles
that would move (bounce) from side to side (a motion I succesfully implemented last week), and then bring
them in to my creature sketch. See below for errors.

Course: DIFG 60B2, Creative Computation
Name: David Oppenheim
Date: September 28, 2011

Attribution: This code incorporates/modifies ideas in examples from Casy Reas and Ben Fry's 
"Getting Started with Processing"
*/

// BALL VARIABLES


//int ballX = 600; // Ball starting position (right side of screen)
int ballRadius = 15;
int ballSpeed = 5; 


// DECLARE AND INITIALIZE ARRAY

float [] manyBalls = new float[2000];

// SETUP

void setup() {
  size(600,400); 
  smooth();
  frameRate(30); 

// For LOOP giving ball random locations

for (int i = 0; i < manyBalls.length; i++) {
  manyBalls[i] = random(-1000, 100);
  }
}

// DRAW

void draw() {
  background(200);   
  ellipseMode(RADIUS);
//  displayBall();
//  bounceBall();
 
 for (int i = 0; i < manyBalls.length; i++) {
 manyBalls[i] += 1.5;
 float y = i * 0.4;
 ellipse(manyBalls[i],y,ballRadius,ballRadius);

  }
}
/*
// ADD MOVEMENT TO BALLS ?? INTRODUCES ERROR "Cannot find anything named "i"

 manyBalls[i] = manyBalls[i] + ballSpeed; // move ball (add current speed to ball x position)
  
  if ((manyBalls[i] > width) || (manyBalls[i] < 0)) {
    ballSpeed = ballSpeed * -1; // change direction
    ballRadius = 22;
  }

}
*/



/* 
// MY ORIGINAL FUNCTIONS (METHODS) FROM LAST WEEK THAT DISPLAYED ONE BALL AND BOUNCED IT AGAINST EACH SIDE OF 
THE SKETCH, MOVING SIDE TO SIDE

// displayBall

void displayBall() {
  fill(234,80,80); 
  ellipse(ballX,50,ballRadius,ballRadius);
  ballRadius = constrain(ballRadius-1,15,22);

}

// bounceBall

void bounceBall() { // Tried to introduce argument here "int ballSpeed" and pass in value 5 from up in the draw() section of code, specifically, bounceBall(5)
  ballX = ballX + ballSpeed; // move ball (add current speed to ball x position)
  
  if ((ballX > width) || (ballX < 0)) {
    ballSpeed = ballSpeed * -1; // change direction
    ballRadius = 22;
  }

}

*/

