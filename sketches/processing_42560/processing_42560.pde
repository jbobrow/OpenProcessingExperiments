

float backR;
float backG;
float backB;

float eyeR;
float eyeG;
float eyeB;

float a;
float b;
float c;
float d;

float centerPotX; // Center X coordinate of W.W.
float centerPotY; // Center Y coordinate of W.W.

float moveSpeed1; // Moving speed1 of W.W.
float moveSpeed2; // Moving speed2 of W.W.
float moveSpeed3; // Moving speed3 of W.W.
float moveSpeed4; // Moving speed4 of W.W.

void setup () {
  // Set the size of the window
  size (800, 800);
  centerPotX = 500;
  centerPotY = 500;
  frameRate (200);
  smooth ();
}

void draw () {
  // Draw a randomly changed background
  moveSpeed1 = 0.2*random (200)-0.2*random(200);
  moveSpeed3 = 0.2*random (200)-0.2*random(200);
  moveSpeed2 = 0.2*random (200)-0.2*random(200);
  moveSpeed4 = 0.2*random (200)-0.2*random(200);
  centerPotX = 0.9998*centerPotX + 0.065*moveSpeed1 - 0.065*moveSpeed3 + 0.3*random (20) - 0.3*random (20);
  centerPotY = 0.9998*centerPotY - 0.065*moveSpeed2 + 0.065*moveSpeed4 + 0.3*random (20) - 0.3*random (20);
  if (centerPotX < 200) {
    centerPotX = 400 -centerPotX;
  } else if (centerPotX > 600) {
    centerPotX = 1200 - centerPotX;
  }
  if (centerPotY < 200) {
    centerPotY = 400-centerPotY;
  } else if (centerPotY > 600) {
    centerPotY = 1200 - centerPotY;
  }
  backR = backR + 0.03*random (400) - 0.03*random (400);
  backG = backG + 0.03*random (400) - 0.03*random (400);
  backB = backB + 0.03*random (400) - 0.03*random (400);
  background (40+centerPotX*0.015-centerPotY*0.015+0.5*backR,40+centerPotY*0.015-centerPotX*0.015+0.5*backG,40+centerPotX*0.015-centerPotY*0.015+0.5*backB);
  
  
  // Set CENTER mode
  ellipseMode (CENTER);
  rectMode (CENTER);
  
  // Draw W.W.'s cycle
 stroke (255);
 noFill ();
 ellipse (centerPotX,centerPotY,270-centerPotX*0.005-centerPotY*0.005,270-centerPotX*0.005-centerPotY*0.005);
 noStroke ();
 fill (centerPotX*0.05+centerPotY*0.02+50, centerPotY*0.02+centerPotX*0.02+80, centerPotX*0.03+centerPotY*0.04+90,15);
 ellipse (centerPotX,centerPotY,260-centerPotX*0.005-centerPotY*0.005,260-centerPotX*0.005-centerPotY*0.005);
  
  // Draw W.W.'s body
  stroke (255);
  fill (255);
  triangle (centerPotX/1.005,centerPotY/1.005-35,centerPotX/1.005-40,centerPotY/1.005+30,centerPotX/1.005+40,centerPotY/1.005+30);
  
  // Draw W.W.'s head
  stroke (255);
  fill (255);
  rect (centerPotX,centerPotY-70,80,40);
  
  // Draw W.W.'s eyes
  noStroke ();
  eyeR = random (255);
  eyeG = random (255);
  eyeB = random (255);
 fill (eyeR*0.04+eyeG*0.03+80, eyeR*0.02+eyeB*0.02+30, eyeG*0.04+eyeB*0.05+20);
 rect (centerPotX-30,centerPotY-70,15,30);
 rect (centerPotX+30,centerPotY-70,15,30);

 // Draw W.W.'s leg
 stroke (255);
 fill (255);
 triangle (centerPotX/1.01-20,centerPotY/1.01+45,centerPotX/1.01+20,centerPotY/1.01+45,centerPotX/1.01,centerPotY/1.01+75);
 
 // Draw W.W.'S pot
 stroke (255);
 fill (150, centerPotX*0.02+120, centerPotY*0.01+30);
 ellipse (centerPotX/1.005,centerPotY/1.005,10+centerPotX*0.005+centerPotY*0.005,10+centerPotX*0.005+centerPotY*0.005);
 
 // Draw W.W.'s trace
 noStroke ();
 a = random (255);
 b = random (50);
 c = random (100);
 d = random (150);
 fill (eyeR, eyeG, eyeB, a);
 ellipse (random(width),random(height), b, b);
 fill (eyeB, eyeR, eyeG, a);
 ellipse (random(width),random(height), c, c);
 fill (eyeG, eyeR, eyeB, a);
 ellipse (random(width),random(height), d, d);
} 

