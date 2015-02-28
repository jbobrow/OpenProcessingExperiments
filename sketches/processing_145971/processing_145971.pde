

//triangle
int x = 0;
int y = 0;
int xspeed = 4;
int yspeed = 4;
//ball
int ballX = 0;
int bally = 0;
int ballSpeed = 15;
int ballRadius = 15;
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

  
  // Add the current speed to the x location.
  x = x + xspeed;
  y = y + yspeed;
   
  if ((x > width/2) || (x < 0)) {
       xspeed = xspeed * -1; }
   if ((y > height/2) || (y < 0)) {
       yspeed = yspeed * -1;  }
 
  
  stroke(255);
  strokeWeight(2);
  fill(0,255,255,50);
  quad(x,y,600,0,0,600,width-x,height-y);
  
  stroke(255,255,255);
  translate(width/2, height/2);
  for (int i=0; i<360; i++) {
    pushMatrix();
    rotate(radians(i));
    ellipse( mouseX, mouseY, 0, PI);
     rotate(radians(i/2));
    ellipse( mouseX/2, mouseY/2, 0, PI);
    ellipse( mouseX/3, mouseY/3, 0, PI);
    ellipse( mouseX/25, mouseY/25, 0, PI);
    ellipse( mouseX/5, mouseY/5, 0, PI);
    ellipse( mouseX/50, mouseY/50, 0, PI);
    popMatrix();}
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
  strokeWeight(20);
  noFill();
   strokeWeight(20);
 rectMode(CENTER); // draws 
 rect(width/2,height/2,a,a);
}
 
void displayBall() {
  noStroke();
  noFill();
  fill(random(255), x,y, 255);
  for(int come = 0; come <= height; come = come +50){
  ellipse(ballX, come, ballRadius, ballRadius);
  }
  for(int come2 = 0; come2 <= width; come2 = come2 +50){
  ellipse(come2, bally, ballRadius, ballRadius);
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
