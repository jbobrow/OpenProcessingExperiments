
 
PImage chess;

int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;

float degT, deg, degTwo, degThree;

float spiralY;

float radius = 0.25;

void setup() {

 chess = loadImage("chessboard.png");
 chess.resize(1200, 1200);

 size(1200,1200);
 background(chess);

 xOne = -100;
 yOne = -100;

 xTwo = -100;
 yTwo = 100;

 xThree = 100;
 yThree = -100;

 xFour = 100;
 yFour = 100;
 
 degT = 0.0;
 deg = 0.0;
 degTwo = 0.0;
 degThree = 0.0;
 
 spiralY = 0.0;
 
}

void draw() {
 
//background(255);
 
 translate(mouseX, mouseY);
  
 spiralY++;
 
 if (mousePressed) {
 
 degT+=2;
 float radT = radians(degT);
 rotate(radT);
 
 //red lines
 translate(10,spiralY);

 deg+=2;
 float rad = radians(deg);
 rotate(rad);

 stroke(255,0,0);
 line(xOne*1, yOne*1, xFour, yFour);
 line(xTwo*1, yTwo*1, xThree, yThree);

// } else if (mousePressed && (mouseButton == RIGHT) {
// 
// degT+=2;
// float radT = radians(degT);
// rotate(radT);
//   
// //green lines
// translate(20,spiralY);
// 
// degTwo+=6;
// float radTwo = radians(degTwo);
// rotate(radTwo);
//
// stroke(0,255,0);
// line(xOne*1, yOne*1, xFour, yFour);
// line(xTwo*1, yTwo*1, xThree, yThree);
 
 } else {
 
 //blue lines
 translate(30,spiralY); 
 
 degThree+=10;
 float radThree = radians(degThree);
 rotate(radThree);
 
 stroke(0,0,255);
 line(xOne*1, yOne*1, xFour, yFour);
 line(xTwo*1, yTwo*1, xThree, yThree);
 
 }
 
}

