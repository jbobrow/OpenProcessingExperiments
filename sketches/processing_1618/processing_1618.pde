
/*
  Roses by Stuart Welch, 4/14/2008

  This sketch displays a succession of 
  growing and shrinking red roses, 
  each one composed of a series of nested 
  rectangles rotated a certain amount.  
  The degree of rotation is incremented 
  by one degree in each iteration.
  Give it time to develop.
*/

int x1,y1,x2,y2;
boolean isGrowing = true;
int rotateAngle = -1;
int rotateBy = 1;
color c = color(255,7);

void setup() {
  size(600,600);
  frameRate(60);
  x1 = 0;
  y1 = 0;
  x2 = 0;
  y2 = 0;
  background(0);
  fill(255);
  smooth();
}

void draw() {
  fill(c);
  rect(0,0,width,height);
  stroke(205,0,10);
  rect(10,10,width-10,height-10);
  noFill();
  strokeWeight(5);
  stroke(205,0,10);
  pushMatrix();
  translate(width/2,height/2);
  rectMode(CORNERS);
  
  if (x2 == (width*1/3)) {
    isGrowing = false;
  }
  else if (x1 == 0) {
    isGrowing = true;
    rotateAngle += rotateBy;
  }
  
  if (isGrowing == true) {
    x1 -= 1;
    y1 -= 1;
    x2 += 1;
    y2 += 1;
  }
  else {
    x2 -= 1;
    y2 -= 1;
    x1 += 1;
    y1 += 1;
  }
  
  int numSquares = round(x2/10.0);
  int temp = 0;
  
  pushMatrix();
  while (temp < numSquares) {
    rotate(radians(rotateAngle));
    rect(x1+(temp*10),y1+(temp*10),x2-(temp*10),y2-(temp*10));
    temp++;
  }
  popMatrix();
  popMatrix();
}

