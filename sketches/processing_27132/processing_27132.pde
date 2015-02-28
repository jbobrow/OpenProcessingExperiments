
int amount = 0;
int circleWidth= 100;
int a = 1;
float v = 5;

class Ball {
  int w=16;
  int h=16;
  float xPos;
  float yPos;
  float rSpeed;
  float xGrav;
  float yGrav;
  float rGravity;
  float r;
  float theta;
  
  Ball(float x, float y) {
    theta = atan(y/x);
    r = dist(x+250, y+250, width/2.0, height/2.0);
  }
}

Set<Ball> ballContainer = new HashSet<Ball>();
  float gravityXmult = 0.5;
  float gravityYmult = 0.5;
  float maxSpeed = 10;
  
color from = color(204, 2, 2);
color to = color(255, 230, 0);


void setup() {
  size(500,500);
}

void drawball(Ball myball) {
//  float maxx = dist(0,0,width/2,height/2);
//  float redd = dist(myball.xPos,myball.yPos,width/2.0,height/2.0);
//  fill(lerpColor(from, to, redd/(maxx+0.0)));
  fill(255,0,0);
  noStroke();
  myball.xPos = (myball.r * cos(myball.theta))+250;
  myball.yPos = (myball.r * sin(myball.theta))+250;
  ellipse(myball.xPos, myball.yPos, myball.w, myball.h);
  myball.xGrav = ((width/2)-myball.xPos)/(width/2.0)*gravityXmult;
  myball.yGrav = ((height/2)-myball.yPos)/(height/2.0)*gravityYmult;
  myball.rGravity = -sqrt(myball.xGrav*myball.xGrav+myball.yGrav*myball.yGrav);
  myball.rSpeed += myball.rGravity;
  myball.r += myball.rSpeed;
  
  
  
 
  }


void draw() {
  background(0);
  for(Ball ball : ballContainer) {
    drawball(ball);
  }
}


void mousePressed(){
  if (mouseButton == LEFT){
  ballContainer.add(new Ball(mouseX-250.0, mouseY-250.0));
//  ballContainer.add(new Ball(mouseX, mouseY));
//  ballContainer.add(new Ball(mouseX, mouseY));
//  ballContainer.add(new Ball(mouseX, mouseY));
//  ballContainer.add(new Ball(mouseX, mouseY));
  }
  
}


