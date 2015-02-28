
/**
  A bouncing ball animation made by Cym - http://cymspace.net/
  My homework for this week's processing class ;-)
  Friday, October 09, 2009
  
  This sketch is just a simple bouncing ball animation.
  Each time the ball hits a side, a loop of circles appears.
  A transparent background is used to create the fading effect.
 */

int xPos;
int yPos;
int speed;
boolean xDir;
boolean yDir;

float xHit;
float yHit;
float xTotal;
float yTotal;

color ballColor;
int ballR;
int ballG;
int ballB;
int ballSize;

void setup() {
  frameRate(30);
  size(320,240);
  smooth();
  background(42,0,67);
  xPos = 1;
  yPos = 1;
  speed = 1;
  xDir = true;
  yDir = true;
  ballSize = 10;
  xTotal = (width/10) + 10;
  yTotal = (height/10) + 10;
}

void draw() {
  
  noStroke();
  fill(42,0,67,10);
  rect(0,0,width,height);
  
  ballR = 255 - constrain(xPos,0,255);
  ballG = 255 - constrain(yPos,0,255);
  ballB = constrain(yPos,0,255);
  
  ballColor = color(ballR,ballG,ballB);  
  fill(ballColor);
  ellipse(xPos,yPos,ballSize,ballSize);
  
  if (xDir) {
    xPos = xPos + speed+2;
  } else {
    xPos = xPos - speed-2;
  }
  
  if (yDir) {
    yPos = yPos + speed+1;
  } else {
    yPos = yPos - speed-1;
  }
  
  if (xPos > (width-(ballSize/2))) {
    xDir = false;
    xHit = xTotal;
  } else if (xPos < (ballSize/2)) {
    xDir = true;
    xHit = xTotal;
  }
  
  if (yPos > (height-(ballSize/2))) {
    yDir = false;
    yHit = yTotal;
  } else if (yPos < (ballSize/2)) {
    yDir = true;
    yHit = yTotal;
  }
  
  if (xHit>0) {
    strokeWeight(5);
    stroke(255,255,255,255-(xHit*(255/xTotal)));
    noFill();
    ellipse(xPos,yPos,(xTotal-xHit)*15,(xTotal-xHit)*15);
    noStroke();
    xHit--;
  }
  if (yHit>0) {
    strokeWeight(5);
    stroke(255,255,255,255-(yHit*(255/yTotal)));
    noFill();
    ellipse(xPos,yPos,(yTotal-yHit)*15,(yTotal-yHit)*15);
    noStroke();
    yHit--;
  }

}

