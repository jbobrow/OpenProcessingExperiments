
//triangle
int x = 0;
int y = 0;
int xspeed = 1;
int yspeed = 2;
//ball
int ballX = 0;
int ballSpeed = 5;
int ballRadius = 25;
 
void setup() {
  size(600,600);
  smooth();
  frameRate(600);
}
 
void draw() {
  background(255);
  displayBall();
  bounceBall();
 
  // Add the current speed to the x location.
  x = x + xspeed;
  y = y + yspeed;
   
  if ((x > width) || (x < 0)) {
       xspeed = xspeed * +1;
  }
   if ((y > height) || (y < 0)) {
       yspeed = yspeed * +1;
  }
 
 
  stroke(0);
  fill(175);
  quad(x*39,y,width-x,0,0,height-y,width-x,height-y);
  fill(y,0,x,178);
  quad(width-x,0,0,height-y,x,0,0,y);
  fill(x,y,x,200);
  rect(0,height+y,width,0,x,y,width,height);
}
 
void displayBall() {
  noFill();
  fill(0, 120, random(255));
  ellipse(ballX, 50, ballRadius+30, ballRadius+30);
  ballRadius = constrain(ballRadius-1, 25, 36);
}
 void bounceBall() {
  ballX = ballX + ballSpeed;
  
  if ((ballX > width) || (ballX < 0)) {
    ballSpeed = ballSpeed * -1;
    ballRadius = 36;
  }
 }

