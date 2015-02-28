
//triangle
int x = 0;
int y = 0;
int xspeed = 1;
int yspeed = 2;
//ball
int ballX = 0;
int bally = 0;
int ballSpeed = 30;
int ballRadius = 25;
//
float a=300;

 
void setup() {
  size(600,600);
  smooth();
  frameRate(600);
 
}
 
void draw() {
  displayBall();
  bounceBall();
  
  if (mousePressed) rectRandom();
  else rectMoving();
  
  // Add the current speed to the x location.
  x = x + xspeed;
  y = y + yspeed;
   
  if ((x > width/2) || (x < 0)) {
       xspeed = xspeed * -1;
  }
   if ((y > height/2) || (y < 0)) {
       yspeed = yspeed * -1;
  }
 
 
  noStroke();
  fill(210,0,y,223);
  quad(x,y,600,0,0,600,width-x,height-y);
  
 
}
void rectRandom()
{

  noStroke();
  fill(#000000,150);
  rectMode(LEFT); // draws the rect from the center
  rect(0,0,width,height);
   
  // random number for a for the width
  float a=random(width);
     
  stroke(255);
  strokeWeight(25);
  noFill();
  rectMode(CENTER); // draws the rect from the center
  rect(width/3,height/3,a,a);
}
 
void rectMoving()
{
  frameRate(30);
  noStroke();
  fill(0,50);
  rectMode(LEFT); // draws the rect from the center
  rect(0,0,width,height);
   
  // counter decreasing the size of rect
  a-=24;
  noStroke();   
  stroke(100,y,0,100);
  strokeWeight(25);
  noFill();
  rectMode(CENTER); // draws the rect from the center
  rect(width/2,height/2,a,a);
 
  stroke(200,155,0);
  strokeWeight(20);
  noFill();
  rectMode(CENTER); // draws the rect from the center
  rect(width/2,height/2,a,a);
 
  stroke(200,255,0);
  strokeWeight(15);
  noFill();
  rectMode(CENTER); 
  rect(width,height,a+600,a+600); 
   
  // re-setting the a value to origin
  if (a<-600) a=600;
} 
 
 //
void displayBall() {
  noStroke();
  noFill();
  fill(255, 255, 255);
  for(int come = 0; come <= height; come = come +50){
  ellipse(ballX, come, ballRadius+30, ballRadius+30);
  }
  for(int come2 = 0; come2 <= width; come2 = come2 +50){
  ellipse(come2, bally, ballRadius+30, ballRadius+30);
  }
  
  ballRadius = constrain(ballRadius-1, 20, 36);
}
 void bounceBall() {
  ballX = ballX + ballSpeed;
  bally = bally + ballSpeed;
  if ((ballX > width) || (ballX < 0)) {
    ballSpeed = ballSpeed * -1;
    ballRadius = 36;
  }
 }

