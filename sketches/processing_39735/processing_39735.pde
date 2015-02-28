
/* 

Title: Week 03 Final Project, Arrays
Version: Week03_Ex_FinalProject_FunctionsArraysMotionBlur_v1_3_Wking

Notes: added random motion to creature (working); added circle follow mouse (using array) 
and blur effect (both working)

Course: DIFG 60B2, Creative Computation
Name: David Oppenheim
Date: September 27, 2011

Attribution: This code incorporates/modifies ideas in examples from Casy Reas and Ben Fry's 
"Getting Started with Processing"

*/

// CREATURE VARIABLES

float mainBodyX = 0;
float mainBodyY = 75;
float mainBodyW = 100; // Main body (rect) size
float mainBodyH = 140;
float bodyStripeW = 100; // Body stripe
float bodyStripeH = 5; 
float rollerBallW = 25; // Roller ball
float rollerBallH = 25;
int   neckColour = 162; // Neck
float neckW = 25; 
float neckH = 75; 
float collarW = 25; // Collar
float collarH = 5; 
int   headColour = 162; // Head
float headW = 35;
float headH = 35;
float eyeColour = 255; // Eye
float eyeW = 10;
float eyeH = 10;
int   pupilColour = 162;
float pupilW = 5;
float pupilH = 5;
int   mouthColour = 200; // Mouth
float mouthW = 20;
float mouthH = 20; 

// BALL VARIABLES

int ballX = 600; // Ball starting position (right side of screen)
int ballRadius = 15;
int ballSpeed = 5; // ?? I tried to move ballSpeed from  a global variable to a parameter passed to the bounceBall function but the ball didn't even display (let alone move)

// GRAVITY (CREATURE) VARIABLES

float speed = 0; // speed of Creature
float gravity = 0.1; // gravity variable

// ANGLE FOR MOTION (CREATURE)

float angle = 0.0;

// ARRAY FOR CIRCLE TRACK MOUSE: DECLARE AND INITIALIZE 

int num = 300; 

int [] x = new int[num];
int [] y = new int[num];

// SETUP

void setup() {
  size(600,400); 
  smooth();
  frameRate(30); 
}

// DRAW

void draw() {
  // background(200);   // IF you comment IN the background, you can get rid of the paint/blur effects
  ellipseMode(RADIUS);
  displayCreature();
  displayBall();
  bounceBall();
  gravityCreature();

// RANDOMIZE CREATURE POSITION 

mainBodyX += random(-4,4);
mainBodyY += random(-1,1);

// CHANGE CREATURE NECK HEIGHT

neckH = 80 + sin(angle) * 30;
angle += 0.025;

 // ARRAY CIRCLE TRACK MOUSE: Copy circle array values from back to front to make circle track to last mouse position 
  for (int i = x.length-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }

  x[0] = mouseX; // Set the first element
  y[0] = mouseY; // Set the first element
  for (int i = 0; i < x.length; i++) {
    fill (234,80,80); // Fill circle with same red colour as bouncing ball
    ellipse(x[i], y[i], 20, 20); // display circle which tracks to mouse position
  }

}

// FUNCTIONS (METHODS)

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

// gravityCreature

void gravityCreature() {
  mainBodyY = mainBodyY + speed; // add speed to creature
  speed = speed + gravity; // add gravity to speed
 
  if (mainBodyY > height -125) { // reverse speed when creature reaches ground
    speed = speed * -0.95;  
  }
}
// displayCreature

void displayCreature() {
  // BODY 
  noStroke();
  fill(mainBodyX,162,mainBodyY); // roller ball fill det. by position
  ellipse(mainBodyX+50,mainBodyY+140,rollerBallW,rollerBallH); // roller ball
  rect(mainBodyX,mainBodyY,mainBodyW,mainBodyH); // main body rect
  fill(162); // fill gray
  rect(mainBodyX,mainBodyY+100,bodyStripeW,bodyStripeH); // body stripe

// NECK
   noStroke();
   fill(neckColour);
   rect(mainBodyX+50,mainBodyY-50,neckW,neckH); // main neck
   fill(mainBodyX,162,mainBodyY); // collar fill determined by position
   rect(mainBodyX+50,mainBodyY+30,collarW,collarH); // neck collar
   strokeWeight(2);
   stroke(0); // set stroke for neck lines to black
   line(mainBodyX+75,mainBodyY-45,mainBodyX+125,mainBodyY-45); // top line
   line(mainBodyX+75,mainBodyY-40,mainBodyX+125,mainBodyY-40); // middle line
   line(mainBodyX+75,mainBodyY-25,mainBodyX+125,mainBodyY-25); // bottom line
    
// HEAD
   noStroke();
   fill(headColour);
   ellipse(mainBodyX+155,mainBodyY-35,headW,headH); // head

   fill(eyeColour);
   ellipse(mainBodyX+125,mainBodyY-35,eyeW,eyeH); // eye 
   fill(pupilColour);
   ellipse(mainBodyX+125,mainBodyY-35,pupilW,pupilH); // pupil 
   fill(mouthColour);
   ellipse(mainBodyX+185,mainBodyY-45,mouthW,mouthH); // mouth 

}  


  


