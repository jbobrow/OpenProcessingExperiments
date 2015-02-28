
int ballOneX = 100;
int ballOneY = 100;
int ballTwoX = 80;
int ballTwoY = 80;
boolean ballOneReverseX = false;
boolean ballOneReverseY = false;
boolean ballTwoReverseX = false;
boolean ballTwoReverseY = false;
float smallSquareSize = 20;
float sizeChanger = 1;
float ball1VelX = 5;
float ball1VelY = 4;
float ball2VelX = 10;
float ball2VelY = 4;
float frames = 0;
 
void setup() {
  size(500, 500);
  frameRate(30);
  rectMode (CENTER);
}
  
void draw() {
  background(255);
  
  noStroke();
/*  if(smallSquareSize > 30 || smallSquareSize < 20) {
    sizeChanger *= -1;
  }
  smallSquareSize += sizeChanger;
*/

 smallSquareSize = sin(frames)*10+20;
 frames += .1;

  for(int i = 0; i < 30; i++ ) { //make 40 things x-axis
    for(int j = 0; j < 30; j++ ) { //make 40 things on the y axis
      fill(smallSquareSize*10, smallSquareSize*10, 203);
      rect(i*52+20, j*52+20, 40, 40, 7);
      fill(random(100, 250), random(100, 250), random(100, 250));
      rect(i*52+20, j*52+20, smallSquareSize, smallSquareSize, 3);
    }
  }
   
 //ballOne
  fill(647, 83, 222);
  rect(ballOneX, ballOneY, 70, 70, 7);
 
//ballTwo
fill(237, 129, 57);
  rect(ballTwoX, ballTwoY, 50, 50, 7);


//check if we hit the walls with ball 1 and reverse the velocity
  if(ballOneX > 475 || ballOneX < 25) {
    ball1VelX *= -.9;
  }
  ballOneX+=ball1VelX;
  
  if(ballOneY > 475 || ballOneY < 25) {
    ball1VelY *= -.9;
  }
  ballOneY+=ball1VelY;
  
//check if we hit the walls with ball 2 and reverse the velocity
  if(ballTwoX > 475 || ballTwoX < 25) {
    ball2VelX *= -.9;
  }
  ballTwoX+=ball2VelX;
  if(ballTwoY > 475 || ballTwoY < 25) {
    ball2VelY *= -.9;
  }
  ballTwoY+=ball2VelY;
  
  
}

void mousePressed() {
  ballOneX = mouseX;
  ballOneY = mouseY;
  ball1VelX = random(-10,10);
  ball1VelY = random(-10,10);
  ballTwoX = mouseX;
  ballTwoY = mouseY;
  ball2VelX = random(-10,10);
  ball2VelY = random(-10,10);
}
