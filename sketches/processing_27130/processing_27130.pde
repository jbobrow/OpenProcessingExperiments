
int amount = 8;
int circleWidth= 300;
int a = 1;

class Ball {
  int w=16;
  int h=16;
  float xPos;
  float yPos;
  float ySpeed;
  float xSpeed;
  float gravityX = 0.1;
  float gravityY = 0.1;
}

Ball[] ballContainer;


void setup() {
  size(500,500);
  ballContainer = new Ball[amount];
  for(int i = 0; i < amount; i++) {
    ballContainer[i] = new Ball();
    ballContainer[i].xPos = mouseX;
  }
}
void drawball(Ball myball) {
  fill(255,0,0);
  stroke(255,0,0);
  ellipse(myball.xPos, myball.yPos, myball.w, myball.h);
  myball.ySpeed +=myball.gravityY;
  myball.yPos += myball.ySpeed;
  //myball.ySpeed += 1;
  myball.xSpeed += myball.gravityX;
  myball.xPos += myball.xSpeed;
  //myball.xSpeed += 1;
  if (dist(myball.xPos,myball.yPos,width/2,height/2)<=(circleWidth/2)+10) {
    //myball.yPos = height;
    myball.ySpeed = -myball.ySpeed-random(-5,5);
    circleWidth += -a;
  }
  if (dist(myball.xPos,myball.yPos,width/2,height/2)>=(circleWidth/2)+230) {
    //myball.yPos = height;
    myball.ySpeed = -myball.ySpeed-random(-5,5);
  }
  if (dist(myball.xPos,myball.yPos,width/2,height/2)>=(circleWidth/2)+230) {
    //myball.yPos = height;
    myball.xSpeed = -myball.xSpeed-random(-5,5);
  }
  if (dist(myball.xPos,myball.yPos,width/2,height/2)<=(circleWidth/2)-10) {
    myball.xPos=width-10;
    myball.yPos=height/2-10;
  }
  if (dist(myball.xPos,myball.yPos,width/2,height/2)>=(circleWidth/2)+255) {
    myball.xPos=width/2+circleWidth/2-10;
    myball.yPos=height/2+circleWidth/2-10;
  }
  if ( myball.yPos > height) {
    //myball.yPos = height;
    myball.ySpeed = -random(10,15);
  }
  if (dist(myball.xPos,myball.yPos,width/2,height/2)<=(circleWidth/2)+10) {
    //myball.xPos = width;
    myball.xSpeed = -myball.xSpeed-random(-5,5);
    circleWidth += -a;
  }
  if ( myball.xPos > width) {
    //myball.xPos = width;
    myball.xSpeed = -random(10,15);
  }
  if ( myball.xPos < 0) {
    //myball.xPos = width;
    myball.xSpeed = random(10,15);
  }
  if ( myball.yPos < 0) {
    //myball.xPos = width;
    myball.ySpeed = random(10,15);
  }
  if(circleWidth<5){
    a=-1;
  }
  if(circleWidth>500){
    a=1;
  }
}

void draw() {
  background(0);
  stroke(0);
  fill(255);
  ellipse(width/2,height/2,circleWidth+500,circleWidth+500);
  fill(0);
  ellipse(width/2,height/2,circleWidth,circleWidth);
  for(int i = 0; i < amount; i++) {
    drawball(ballContainer[i]);
  }
}


