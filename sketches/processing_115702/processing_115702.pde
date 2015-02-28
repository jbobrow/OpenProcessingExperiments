
int ballOneX = 100;
int ballOneY = 100;
int ballTwoX = 80;
int ballTwoY = 80;
boolean ballOneReverseX = false;
boolean ballOneReverseY = false;
boolean ballTwoReverseX = false;
boolean ballTwoReverseY = false;

void setup() {
  size(500, 500);
  frameRate(30);
}
 
void draw() {
  background(255);
 
  noStroke();
  fill(182, 234, 233);
  for(int i = 0; i < 30; i++ ) { //make 40 things x-axis 
    for(int j = 0; j < 30; j++ ) { //make 40 things on the y axis
      rect(i*52, j*52, 40, 40, 7);
    }
  }
  
 //ballOne
  fill(647, 83, 222);
  rect(ballOneX, ballOneY, 70, 70, 7);
  //here we check if it has gone too far
  if (ballOneX >= 475) {
    ballOneReverseX = true;
  }
  else if ( ballOneX <= 25) {
    ballOneReverseX = false;
  }
  if (ballOneY >= 475) {
    ballOneReverseY = true;
  }
  else if ( ballOneY <= 25) {
    ballOneReverseY = false;
  }
 
 
  //here we see what direction to go(pixels every frame)
  if (ballOneReverseX) {
    ballOneX-=4;
  }
  else {
    ballOneX+=4;
  }
  if (ballOneReverseY) {
    ballOneY-=5;
  }
  else {
    ballOneY+=5;
  }


//ballTwo
fill(237, 129, 57);
  rect(ballTwoX, ballTwoY, 50, 50, 7);
  //here we check if it has gone too far
  if (ballTwoX >= 475) {
    ballTwoReverseX = true;
  }
  else if ( ballTwoX <= 25) {
    ballTwoReverseX = false;
  }
  if (ballTwoY >= 475) {
    ballTwoReverseY = true;
  }
  else if ( ballTwoY <= 25) {
    ballTwoReverseY = false;
  }
 
 
  //here we see what direction to go
  if (ballTwoReverseX) {
    ballTwoX-=10;
  }
  else {
    ballTwoX+=10;
  }
  if (ballTwoReverseY) {
    ballTwoY-=5;
  }
  else {
    ballTwoY+=5;
  }
}
