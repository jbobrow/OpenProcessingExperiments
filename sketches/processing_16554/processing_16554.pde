
float zoogX;
float zoogY;
 
float eyeR;
float eyeG;
float eyeB;
int circleX = 100;
int circleY = 0;
 
void setup() {
  size(600,800);        // Set the size of the window
  // Feature #1.  zoogX and zoogY are initialized based on the size of the window. 
  // Note we cannot initialize these variables before the size() function is called
  // since we are using the built-in variables width and height.
  zoogX = width/2;      // Zoog always starts in the middle
  zoogY = height +50; // Zoog starts below the screen
background (0);
 
 
  smooth();
}
 
void draw() {
  boolean stars = true;
frameRate(200);
  //background(255);  // Draw a white background
   
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
   
  // Draw Zoog's body
  stroke(0);
  fill(150);
  // Feature #1.  zoogX and zoogY are used for the shape locations.
  rect(zoogX,zoogY,20,100);
 
  // Draw Zoog's head
  stroke(0);
  fill(255);
  ellipse(zoogX,zoogY-30,60,70);
triangle(zoogX,zoogY-90,zoogX-19,zoogY-30,zoogX+19,zoogY-30);
  // Draw Zoog's eyes
  // Feature #2.  eyeR, eyeG, and eyeB are given random values and used in the fill() function.
  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR,eyeG,eyeB);
   
  ellipse(zoogX-19,zoogY-30,32,32);
  ellipse(zoogX+19,zoogY-30,32,32);
 
fill (255);
  ellipse(zoogX-19,zoogY-30,20,20);
  ellipse(zoogX+19,zoogY-30,20,20);
 
 
// Draw zoog's mouth
fill (0);
  ellipse(zoogX,zoogY-10,13,13);
fill(random(255),random(255),random(255),random(255));
noStroke();
  rect(zoogX,zoogY+50,13,13);
 
float smoke=25;
 
 
ellipse(zoogX-20,zoogY+65,smoke,smoke); 
 
ellipse(zoogX+20,zoogY+65,smoke,smoke); 
 
ellipse(zoogX-5,zoogY+65,smoke,smoke);
 
ellipse(zoogX+5,zoogY+65,smoke,smoke);
 
fill(0,0,0,50);
rect (zoogX,zoogY+150,smoke+50,smoke+40);
fill (255,255,255,random (255));
 
 float oye;
 if(stars=true)
 {
   
   if (zoogY>600){
oye=random(4);
   ellipse (random (width),random (height), oye,oye);
 
 }
 }


if (zoogY+150==0)
{
  background(0);
  zoogY= height+50; 
;
}

 
 
 
  // Zoog moves up
  zoogY = zoogY - 1;
   
   
   

 
  
 }
