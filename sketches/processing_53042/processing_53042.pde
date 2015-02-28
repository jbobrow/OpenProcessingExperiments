
float ballx = 600.10;
float bally = 200.0;
float angle = random(1,6);
float speed = 2.0;
int bswitch = 0;
int direction = 1; //1 represents down to up, 0 is up to down
float bgr = 255;
float bgg = 255;
float bgb = 255;
float or = 0;
float og = 0;
float ob = 0;


void setup() {
  size(600,400);
  stroke(0);
  frameRate(60);
}
void draw() {
  background(bgr,bgg,bgb);
  fill(or,og,ob);
  
  //Draw the ball which bounces off paddle and walls
  rect(ballx,bally,10,10);
  //Draw the Paddle which follows mouse vertically
  rect(10,mouseY,10,60);
  
  //bswitch 0 means going up and left
  if (bswitch == 0) {
    bally = bally - angle;
    ballx = ballx - speed;
  }
  //bswitch 1 means going down and left
  else if (bswitch == 1) {
    bally = bally + angle;
    ballx = ballx - speed;
  }
  //bswitch 2 means it has hit the paddle and is going down right
  else if (bswitch == 2) {
    bally = bally + angle;
    ballx = ballx + speed;
  }
  //bswitch 3 means it has hit the paddle and is going up right
  else if (bswitch == 3) {
    bally = bally - angle;
    ballx = ballx + speed;
  }
  
  
  
  //ball hits top of screen while bswitch is 0(moving left),go down and left
  if (bally < 2 && bswitch == 0) {
    bswitch = 1;
  }
  //Ball hits top of screen while bswitch is 3(moving right), go up and right
  if (bally < 2 && bswitch == 3) {
    bswitch = 2;
  }
 
 //ball hits bottom of screen while bswitch is 1(moving left), go up and left
 if (bally > 390 && bswitch == 1) {
   bswitch = 0;
 }
 //ball hits bottom of screen while bswitch is 2(moving right), go up and right
 if (bally > 390 && bswitch == 2) {
   bswitch = 3;
 }
 
 //If ball hits paddle while bswitch is 1, it will go down and right
 if (bally > mouseY-10 && bally < mouseY+60 && ballx < 24 && ballx > 16 && bswitch == 1) {
   angle = random(1,5);
   or = random(1,255);
   og = random(1,255);
   ob = random(1,200);
   bswitch = 2;
 }
 
 //If ball hits paddle while bswitch is 0, it will go up and right
 if (bally > mouseY-10 && bally < mouseY+60 && ballx < 24 && ballx > 16 && bswitch == 0) {
   angle = random(1,5);
   or = random(1,255);
   og = random(1,255);
   ob = random(1,200);
   bswitch = 3; 
 }
 
 //Ball hits right border while bswitch is 2, will go down left
 if (ballx > 590 && bswitch == 2) {
   angle = random(1,5);
   speed = speed + 0.5;
   bgr = random(1,255);
   bgg = random(1,255);
   bgb = random(1,255);
   bswitch = 1;
 }
 
 //Ball hits right border while bswitch is 3, will go up left
 if (ballx > 590 && bswitch == 3) {
   angle = random(1,5);
   speed = speed + 0.5;
   bgr = random(1,255);
   bgg = random(1,255);
   bgb = random(1,255);
   bswitch = 0;
 }
}
 

 
  




