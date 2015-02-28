
int circleX = 100;
int circleY = 100;
int speedX = 2;
int speedY = 3;

int circleA = 200;
int circleB = 200;
int speedA = 3;
int speedB = 2;

int circleC = 480;
int circleD = 480;
int speedC = 2;
int speedD = 3; 

int circleE = 350;
int circleF = 350;
int speedE = 4;
int speedF = 7;

int squareG = 210;
int squareH = 210;
int speedG = 7;
int speedH = 4;

int circleI = 400;
int circleJ = 400;
int speedI = 3;
int speedJ = 4;

void setup() {
  size(500, 500);
  frameRate(60);
}

void draw() {
  background(circleA, squareG, circleX);
  noStroke();
  circleX = circleX + speedX;
  circleY = circleY + speedY;
  fill(circleX, circleY, 11);
  ellipse(circleX, circleY, 20, 20);
  
  if (circleY > height) {
    speedY = -speedY;
  }
  if (circleY < 0) {
    speedY = -speedY;
  }
  if (circleX > width) {
    speedX = -speedX;
  } 
  if (circleX < 0) {
    speedX = -speedX;
  } 
  
  noStroke();
  circleA = circleA + speedA;
  circleB = circleB + speedB;
  fill(250, 250, 250);
  ellipse(circleA, circleB, 30, 30);
  
  if (circleB > height) {
    speedB = -speedB;
  }
  if (circleB < 0) {
    speedB = -speedB;
  }
  if (circleA > width) {
    speedA = -speedA;
  }
  if (circleA < 0) {
    speedA = -speedA;
  }
  
  noStroke();
  circleC = circleC + speedC;
  circleD = circleD + speedD;
  fill (20, circleC, circleD);
  ellipse(circleC, circleD, 25, 25);
  
    if (circleD > height) {
    speedD = -speedD;
  }
  if (circleD < 0) {
    speedD = -speedD;
  }
  if (circleC > width) {
    speedC = -speedC;
  }
  if (circleC < 0) {
    speedC = -speedC;
  }
  
  noStroke();
  circleE = circleE + speedE;
  circleF = circleF + speedF;
  fill(circleE, 150, circleF);
  ellipse(circleE, circleF, 50, 50);
  
     if (circleF > height) {
    speedF = -speedF;
  }
  if (circleF < 0) {
    speedF = -speedF;
  }
  if (circleE > width) {
    speedE = -speedE;
  }
  if (circleE < 0) {
    speedE = -speedE;
  }

noStroke();
squareG = squareG + speedG;
squareH = squareH + speedH;
fill(squareH, squareG, 40);
rect(squareG, squareH, 30, 30);

if (squareH > height) {
  speedH = -speedH;
}
if (squareH < 0) {
  speedH = -speedH;
}
if (squareG > width) {
  speedG = -speedG;
}
if (squareG < 0) {
  speedG = -speedG;
}
  
noStroke();
circleI = circleI + speedI;
circleJ = circleJ + speedJ;
fill(circleI, circleJ, 200);
ellipse(circleI, circleJ, 100, 100);

if (circleJ > height) {
  speedJ = -speedJ;
}
if (circleJ < 0) {
  speedJ = -speedJ;
}
if (circleI > width) {
  speedI = -speedI;
}
if (circleI < 0) {
  speedI = -speedI;
}
  
}
