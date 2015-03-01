
// Markús S.
float zoogX;
float zoogY;
float zoorX;
float zoorY;
float zoodX;
float zoodY;
 
float eyeR;
float eyeG;
float eyeB;
 
void setup() {
  size(200,200);        // Set the size of the window
  // Feature #1.  zoogX and zoogY are initialized based on the size of the window.
  // Note we cannot initialize these variables before the size() function is called
  // since we are using the built-in variables width and height.
  zoogX = width/2;      // Zoog always starts in the middle
  zoogY = height + 100; // Zoog starts below the screen
  zoorX = width/2 + 65;      
  zoorY = height + 100;
  zoodX = width/2 - 65;      
  zoodY = height + 100;
  smooth();
}
 
void draw() {
 
  background(255);  // Draw a white background
 
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
 
  // Draw Zoog's body
  stroke(0);
  fill(150);
  // Feature #1.  zoogX and zoogY are used for the shape locations.
  rect(zoogX,zoogY,20,100);
  rect(zoorX,zoorY,20,100);
  rect(zoodX,zoodY,20,50);
 
  // Draw Zoog's head
  stroke(0);
  fill(255);
  ellipse(zoogX,zoogY-30,60,60);
  ellipse(zoorX,zoorY-30,60,60);
  ellipse(zoodX,zoodY-30,60,50);
 
  // Draw Zoog's eyes
  // Feature #2.  eyeR, eyeG, and eyeB are given random values and used in the fill() function.
  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR,eyeG,eyeB);
 
  ellipse(zoogX-19,zoogY-30,16,32);
  ellipse(zoogX+19,zoogY-30,16,32);
  ellipse(zoorX-19,zoorY-30,14,18);
  ellipse(zoorX+19,zoorY-30,14,18);
  ellipse(zoodX+19,zoodY-30,14,18);
  ellipse(zoodX-19,zoodY-30,14,18);
 
  // Draw Zoog's legs
  stroke(150);
  line(zoogX-10,zoogY+50,zoogX-10,height);
  line(zoogX+10,zoogY+50,zoogX+10,height);
  line(zoorX-10,zoorY+50,zoorX-10,height);
  line(zoorX+10,zoorY+50,zoorX+10,height);
  line(zoodX,zoodY,zoodX,height);
 
  // Zoog moves up
  zoogY = zoogY - 1.2;
  zoorY = zoorY - 1;
  zoodY = zoodY - 1.5;
}
