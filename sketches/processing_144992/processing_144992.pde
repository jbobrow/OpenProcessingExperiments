
/*
Konkuk University
SOS iDesign

Name: Gwang il Lee
ID: 201420094

*/
int x = 0;
int y = 0;
int xspeed = 1;
int yspeed = 2;

int ballX = 0;
int bally = 0;
int ballSpeed = 5;
int ballRadius = 25;
 
 
 
void setup() {
  size(600,600);
  smooth();
  frameRate(600);
}
 
void draw() {
  background(0);
  displayBall();
  bounceBall();
 
 
  x = x + xspeed;
  y = y + yspeed;
   
  if ((x > width) || (x < 0)) {
       xspeed = xspeed * -1;
  }
   if ((y > height) || (y < 0)) {
       yspeed = yspeed * -1;
  }
 
 
  noStroke();
  fill(x+y,0,x*y);
  quad(x,y,0,0,0,0,width+x,height+y);
  fill(x*4,x*2,0);
  quad(0,y,width-x,x,0,height-y,width-x,height-y);
  
  fill(255,random(255),200);
  quad(width-x,0,0,height-y,x,0,0,y);
  fill(x,y,y*x,100);
  quad(0,height+y,width,0,x,y,width,height);
 
}


 
void displayBall() {
  noStroke();
  noFill();
  fill(random(255), 120, random(255));
  for(int come = 0; come <= height; come = come +50){
  ellipse(ballX, come, ballRadius+70, ballRadius+300);
  }
  for(int come2 = 0; come2 <= width; come2 = come2 +500){
  ellipse(come2, bally, ballRadius+10, ballRadius+450);
  }
  
  ballRadius = constrain(ballRadius-1, 50, 36);
}
 void bounceBall() {
  ballX = ballX + ballSpeed;
  bally = bally + ballSpeed;
  if ((ballX > width) || (ballX < 0)) {
    ballSpeed = ballSpeed * -1;
    ballRadius = 36;
  }
 }
 
 

