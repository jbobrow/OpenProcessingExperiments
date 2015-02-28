
/*
 *
 *draw over image using mousePressed
 *
 *by Jocelyn Wu
 *9/27/2012
 */
 
PImage lightning;
PImage redLightning;

int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;
int posX;
int posY;
int posA;
int posB;

float deg, degTwo, degThree, degFour;

void setup() {
  size(600, 450);
  
  lightning = loadImage("darklightning.jpeg");
  redLightning = loadImage("redlightning.png");
  
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
   degFour = 0.0;
   
   posX = 0;
   posY = 0;
   posA = 0;
   posB = 0;
   
}

void draw() {
  
  background(0, 0);

  image(lightning, posX, posY);
  
   
  pushMatrix();
  translate(300,250);
   
  if (mousePressed == true) {
     deg+=9;
   }
   
  float rad = radians(deg);
  rotate(rad);
  smooth();
  strokeWeight(5);   
  line(xOne, yOne, xThree, yThree);
  line(xTwo, yTwo, xFour, yFour);
  line(xOne, xOne, xFour, yFour);
  translate (100, 100);
  line(xOne, yOne, xThree, yThree);
  line(xTwo, yTwo, xFour, yFour);
  line(xOne, xOne, xFour, yFour);
  popMatrix();
   
  pushMatrix();
  translate(300, 250);
  
  if(mousePressed==true); {
  degTwo-=11;
  }
  
  float radTwo = radians(degTwo);
  rotate(radTwo);
  
  smooth();
  strokeWeight(3);
  line(xOne, yOne, xThree, yThree);
  line(xTwo, yTwo, xFour, yFour);
  line(xOne, xOne, xFour, yFour);
  translate(100,100);
  line(xOne, yOne, xThree, yThree);
  line(xTwo, yTwo, xFour, yFour);
  line(xOne, xOne, xFour, yFour);
  popMatrix();

  posY = mouseY;
}

