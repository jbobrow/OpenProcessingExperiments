
// This is a test to get an array of balls bouncing. 
// It works, except that the bounce effect (radius expands when ball hits either edge) doesn't work.
// BELOW this attempt is code using fuctions (not working at the moment)

// BALL VARIABLES (GLOBAL)

int ballRadius = 15;

// DECLARE AND INITIALIZE ARRAY

float [] manyBallsX = new float[30];
float [] manyBallsY = new float[30];
float [] ballSpeed = new float [30]; 

// SETUP

void setup() {
  size(600,400); 
  smooth();
  frameRate(30); 
  
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
  ballSpeed[i] = random(5,11); // initialize ballSpeed array with random speed between 5 and 10
  }
}

// DRAW

void draw() {
  background(200);   
  ellipseMode(RADIUS);
  
  for (int i = 0; i < manyBallsX.length; i++) {
  ellipse(manyBallsX[i], manyBallsY[i], ballRadius, ballRadius); // draw ball
//constrain (manyBallsX[i], 0, width);
  ballRadius = constrain(ballRadius-1,15,22);
   }
 
  for (int i = 0; i < manyBallsX.length; i++) {
    if ((manyBallsX[i] >= width) || (manyBallsX[i] <= 0)) { // reverse direction (bounce balls back)
  ballSpeed[i] = ballSpeed[i] * -1; // change direction
  ballRadius = 30; // increase size when ball reaches end (wall) to give illusion of bouncing
    }
   manyBallsX[i] = manyBallsX[i] + ballSpeed[i]; // give speed along X   

  }



}

/*
// NOT WORKING Version attempting to use functions

// BALL VARIABLES (GLOBAL)

int ballRadius = 15;

// DECLARE AND INITIALIZE ARRAY

float [] manyBallsX = new float[30];
float [] manyBallsY = new float[30];
float [] ballSpeed = new float [30]; 
// SETUP

void setup() {
  size(600,400); 
  smooth();
  frameRate(30); 
  
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
  ballSpeed[i] = random(5,11); // initialize ballSpeed array with random speed between 5 and 10
}
}
// DRAW

void draw() {
  background(200);   
  ellipseMode(RADIUS);
  displayBall();
  bounceBall();
}

void displayBall() {
  
  for (int i = 0; i < manyBallsX.length; i++) {
  ellipse(manyBallsX[i], manyBallsY[i], ballRadius, ballRadius); // draw ball
  constrain (manyBallsX[i], 0, width);
  ballRadius = constrain(ballRadius-1,15,22);
  
 manyBallsX[i] = manyBallsX[i] + ballSpeed[i]; // give speed along X   
 }
}

void bounceBall() {
 
  for (int i = 0; i < manyBallsX.length; i++) {
  if ((manyBallsX[i] >= width) || (manyBallsX[i] <= 0)) { // reverse direction (bounce balls back)
  ballSpeed[i] = ballSpeed[i] * -1; // change direction
  ballRadius = 30; // increase size when ball reaches end (wall) to give illusion of bouncing
    }
  }

}

*/

