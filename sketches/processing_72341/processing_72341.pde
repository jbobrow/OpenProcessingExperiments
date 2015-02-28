
/*
*Hyerin Kim
*rotating eyeball
*sept 27
*/

PImage triangles;
PImage eyeBall;

int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;

float deg,degTwo,degThree;

void setup() {

size (881,616);

triangles= loadImage("http://www.stevebuffoni.com/wp-content/uploads/2009/12/pattern-family-01-single1.jpg");
eyeBall= loadImage("http://www.clker.com/cliparts/f/2/0/9/11971498921066994001tonlima_Olho_Azul_Blue_Eye.svg.thumb.png");

xOne = -50;
yOne = -50;

xTwo = -50;
yTwo = 50;

xThree = 50;
yThree = -50;

xFour = 50;
yFour = 50;

deg = 0.0;
degTwo = 0.0;
degThree = 0.0;
}

void draw() {

background (triangles);
rectMode(CENTER);

//red rectangles that move when pressed

pushMatrix();
translate(width/2,height/2);

if(mousePressed==true) {
deg-=2;
}

float rad = radians(deg);
rotate(rad);

fill(255,0,0);
rect(xOne, yOne, 50, 50);
rect(xTwo, yTwo, 50, 50);
rect(xThree, yThree, 50, 50);
rect(xFour, yFour, 50, 50);
popMatrix();

//moving eyeballs
pushMatrix();
translate(width/2,height/2);

if(mousePressed==true) {
degThree+=2;
}

float radThree = radians(degThree);
rotate(radThree);

fill(0,0,255);

image (eyeBall,xOne*2, yOne*2, 50, 50);
image (eyeBall,xTwo*2, yTwo*2, 50, 50);
image (eyeBall,xThree*2, yThree*2, 50, 50);
image (eyeBall,xFour*2, yFour*2, 50, 50);
popMatrix();

//blue circles
pushMatrix();
translate(width/2,height/2);

if(mousePressed==true) {
degThree+=2;
}

rotate(radThree);

fill(0,0,255);
ellipse(xOne*3.5, yOne*3.5, 50, 50);
ellipse(xTwo*3.5, yTwo*3.5, 50, 50);
ellipse(xThree*3.5, yThree*3.5, 50, 50);
ellipse(xFour*3.5, yFour*3.5, 50, 50);
popMatrix();

}

