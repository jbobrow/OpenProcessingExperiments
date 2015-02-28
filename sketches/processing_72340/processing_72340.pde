
int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;

float deg;

PImage sham;
float offset = 0;
float easing = 0.05;


int posX;
int posY;

void setup() {
size(3000,3000);

sham = loadImage("galaxy.jpg");

posX = 0;
posY = 0;

size(1000,1000);

xOne = -10;
yOne = -10;

xTwo = -10;
yTwo = 10;

xThree = 10;
yThree = -10;

xFour = 10;
yFour = 10;

deg = 0.0;

}

void draw() {

//background(0,0);


image(sham, 0, 0);  // Display at full opacity
  float dx = (mouseX-sham.width/2) - offset;
  offset += dx * easing; 
  tint(255, 60);  // Display at half opacity
  image(sham, offset, 0);

translate(width/2,height/2);

deg+=1000;
float rad = radians(deg);
rotate(rad);

for (int i = 0; i < 100; i++) {

stroke(255, 255, 255);
fill( (0), (0), (0), (0));
ellipse(xOne*i,yOne*i,10*i,10*i);
ellipse(xTwo*i,yTwo*i,10*i,10*i);
ellipse(xFour*i,yThree*i,10*i,10*i);
ellipse(xFour*i,yFour*i,10*i,10*i);

rotate(PI/50);

stroke(0, 0, 0);
ellipse(xOne*i,yOne*i,10*i,10*i);
ellipse(xTwo*i,yTwo*i,10*i,10*i);
ellipse(xThree*i,yThree*i,10*i,10*i);
ellipse(xFour*i,yFour*i,10*i,10*i);
image(sham, posX, posY);


}

}

