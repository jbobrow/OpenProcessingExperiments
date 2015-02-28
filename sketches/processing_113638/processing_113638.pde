
int circleX=100;
int circleY=0;
int circleW=20;
int speedX=0;
int speedY=10;

int circleA=200;
int circleB=600;
int circleC=30;
int speedA=0;
int speedB=10;

int circleD=300;
int circleE=0;
int circleF=40;
int speedD=0;
int speedE=10;

int circleG=400;
int circleH=600;
int circleI=50;
int speedG=0;
int speedH=10;

int circleJ=500;
int circleK=0;
int circleL=60;
int speedJ=0;
int speedK=10;

void setup() {
  size(600, 600);
  noStroke();
  //framerate(5);
}
void draw() {
  background(200, 50, 190);
  circleX=circleX+speedX;
  circleY=circleY+speedY;
  fill(55, 204, 0);
  ellipse(circleX, circleY, circleW, circleW);

  if (circleY > height) {

    speedY= -1 * speedY;
  }

  if (circleY < 0) {
    speedY = -speedY;
  }   

  circleA=circleA+speedA;
  circleB=circleB+speedB;
  ellipse(circleA, circleB, circleC, circleC);

  if (circleB > 600) {

    speedB= - speedB;
  }
  if (circleB < 0) {
    speedB = -speedB;
  }

  circleD=circleD+speedD;
  circleE=circleE+speedE;
  ellipse(circleD, circleE, circleF, circleF);

  if (circleE > 600) {

    speedE= - speedE;
  }
  if (circleE < 0) {
    speedE = -speedE;
  }

  circleG=circleG+speedG;
  circleH=circleH+speedH;
  ellipse(circleG, circleH, circleI, circleI);

  if (circleH > 600) {

    speedH= - speedH;
  }
  if (circleH < 0) {
    speedH = -speedH;
  }

  circleJ=circleJ+speedJ;
  circleK=circleK+speedK;
  ellipse(circleJ, circleK, circleL, circleL);

  if (circleK > 600) {

    speedK= - speedH;
  }
  if (circleK < 0) {
    speedK = -speedK;
  }
}



