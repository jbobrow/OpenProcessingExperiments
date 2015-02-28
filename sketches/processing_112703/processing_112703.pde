
int circleX = 0;
int circleY = 0;
int circleA = 500;
int circleB = 500;
int circleC =500;
int circleD =0;
int circleE=0;
int circleF =500;
int speedX=3;
int speedY=1;
int speedA=-3;
int speedB=-1;
int speedC=3;
int speedD=1;
int speedE=-3;
int speedF=-1;
int beauty=0;



void setup() {
  size(500, 500);
  colorMode(HSB);
  background(0);
  
}

void draw() {
    
  //background(0);
  beauty=beauty+10;
  circleX=circleX+speedX;
  circleY=circleY+speedY;
  fill(beauty,255,255,50);
  ellipse(circleX, circleY, 25, 25);

  circleX=circleX+speedX;
  circleY=circleY+speedY;
  fill(beauty,255,255,50);
  ellipse(circleY, circleX, 25, 25);

  circleA=circleA+speedA;
  circleB=circleB+speedB;
  fill(beauty,255,255,50);
  ellipse(circleA, circleB, 25, 25);

  circleA=circleA+speedA;
  circleB=circleB+speedB;
  fill(beauty,255,255,50);
  ellipse(circleB, circleA, 25, 25);

  circleC=circleC+speedC;
  circleD=circleD+speedD;
  fill(beauty,255,255,50);
  ellipse(circleC, circleD, 25, 25);
  
  circleC=circleC+speedC;
  circleD=circleD+speedD;
  fill(beauty,255,255,50);
  ellipse(circleD, circleC, 25, 25);
  
  circleE=circleE+speedE;
  circleF=circleF+speedF;
  ellipse(circleE,circleF,25,25);
  
  circleE=circleE+speedE;
  circleF=circleF+speedF;
  fill(beauty,255,255,50);
  ellipse(circleF,circleE,25,25);
  


if (beauty>255){beauty=0;}

  if (circleX>width) {
    speedX=speedX*-1;
  }
  if (circleY>height) {
    speedY=speedY*-1;
  }
  if (circleX<0) {
    speedX=speedX*-1;
  }
  if (circleY<0) {
    speedY=speedY*-1;
  }

  if (circleA>width) {
    speedA=speedA*-1;
  }
  if (circleB>height) {
    speedB=speedB*-1;
  }
  if (circleA<0) {
    speedA=speedA*-1;
  }
  if (circleB<0) {
    speedB=speedB*-1;
  }

  if (circleC>width) {
    speedC=speedC*-1;
  }
  if (circleD>height) {
    speedD=speedD*-1;
  }
  if (circleC<0) {
    speedC=speedC*-1;
  }
  if (circleD<0) {
    speedD=speedD*-1;
  }
  if (circleE>width) {
    speedE=speedE*-1;
  }
  if (circleF>height) {
    speedF=speedF*-1;
  }
  if (circleE<0) {
    speedE=speedE*-1;
  }
  if (circleF<0) {
    speedF=speedF*-1;
  }
}
