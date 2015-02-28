
//Asterix, Dan Olson 2013

float x,y;
float x2, y2;
float x3, y3;
float x4, y4;
float speedY, speedX;
float speedXDiag, speedYDiag;
float speedXDiag2, speedYDiag2;
float randomSpeedX, randomSpeedY;
float randomSpeedDiag, randomSpeedDiag2;

void setup() {
  size(250,250);
  smooth();
  noStroke();
  x = width/2; y = height * .25;
  x2 = width * .25; y2 = height/2;
  x3 = width * .25; y3 = height * .25;
  x4 = width * .25; y4 = height * .75;
  
  randomSpeedX = random(.25,1);
  randomSpeedY = random(.25,1);
  
  randomSpeedDiag = random(.25,1);
  randomSpeedDiag2 = random(.25,1);
  
}

void draw() {
  
//Vertical
if (y >= height * .75) {
speedY -= randomSpeedY;
  }
if (y <= height * .25) {
speedY += randomSpeedY;
  }
y += speedY;

//Horizontal
if (x2 >= width * .75) {
speedX -= randomSpeedX;
  }
if (x2 <= width * .25) {
speedX += randomSpeedX;
  }
x2 += speedX;

//Diagonal 1
if ((x3 >= width * .75) && (y3 >= height * .75)) {
speedXDiag -= randomSpeedDiag;
speedYDiag -= randomSpeedDiag;
}

if ((x3 <= width * .25) && (y3 <= height * .25)) {
speedXDiag += randomSpeedDiag;
speedYDiag += randomSpeedDiag;
}
x3 += speedXDiag;
y3 += speedYDiag;

//Diagonal 2
if ((x4 >= width * .75) && (y4 <= height * .25)) {
speedXDiag2 -= randomSpeedDiag2;
speedYDiag2 += randomSpeedDiag2;
}

if ((x4 <= width * .25) && (y4 >= height * .75)) {
speedXDiag2 += randomSpeedDiag2;
speedYDiag2 -= randomSpeedDiag2;
}
x4 += speedXDiag2;
y4 += speedYDiag2;

fill(50,5);
rect(0,0,width,height);
fill(255,89,90);

rect(x-10,y-10,20,20); 
rect(x2-10,y2-10,20,20); 
rect(x3-10,y3-10,20,20);
rect(x4-10,y4-10,20,20);

}
