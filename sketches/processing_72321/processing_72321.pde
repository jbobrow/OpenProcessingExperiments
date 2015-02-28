
int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;

float deg;
 

 
PImage geo;

int posX;
int posY;

void setup() {
  size(300, 300);
  smooth();
 strokeWeight(.2);
 
 xOne = -10;
 yOne = -10;

 xTwo = -10;
 yTwo = 10;

 xThree = 10;
 yThree = -10;

 xFour = 10;
 yFour = 10;
 
 deg = 0.0;
  
 
  geo = loadImage("geo.gif");
  
  posX = 0;
  posY = 0;
}

void draw() {

   background (00, 00, 00);
   translate(width/2,height/2);
 
 deg+=2;
 float rad = radians(deg);
 rotate(rad);
  
 for (int i = 0; i < 20; i++) {
  
   strokeWeight(5);
   stroke(40,255,150);
   line(xOne*i,yOne*i,xTwo*i,yTwo*i);
   line(xThree*i,yThree*i,xFour*i,yFour*i);

   rotate(PI/2);

   stroke(255,0,100);
   line(xOne*i,yOne*i,xTwo*i,yTwo*i);
   line(xThree*i,yThree*i,xFour*i,yFour*i);
  
  if (mousePressed == true) {
    posX = mouseX-geo.width/2;
    posY = mouseY-geo.height/2;
  } 
 }

  posY=mouseY;

  image(geo, posX, posY-geo.height/2);  

}



