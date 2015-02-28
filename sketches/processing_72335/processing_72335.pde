
int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;

float deg;

PImage colors123;

int posX;
int posY;

void setup() {
  size(1200,700);

  colors123 = loadImage("http://i46.tinypic.com/razq6q.jpg");
  
  posX = 0;
  posY = 0;
  
  
  
   size(1200,700);
 
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
  
  background(1200,700);
  
  image(colors123, posX, posY);
  
  translate(width/2,height/2);
 
 deg+=2;
 float rad = radians(deg);
 rotate(rad);
  
 for (int i = 0; i < 100; i++) {
   
    pushMatrix();
 translate(width/2,height/2);
  
 if(mousePressed==true) {
   deg+=2;
 }

 rotate(rad);
   
   stroke(240, 169, 250);
   fill( random(255), random(255), random(255), random(255)); 
   ellipse(xOne*i,yOne*i,10*i,10*i);
   ellipse(xTwo*i,yTwo*i,10*i,10*i);
   ellipse(xThree*i,yThree*i,10*i,10*i);
   ellipse(xFour*i,yFour*i,10*i,10*i);
    popMatrix();

   rotate(PI/2);

   stroke(240, 169, 250);
   ellipse(xOne*i,yOne*i,10*i,10*i);
   ellipse(xTwo*i,yTwo*i,10*i,10*i);
   ellipse(xThree*i,yThree*i,10*i,10*i);
   ellipse(xFour*i,yFour*i,10*i,10*i);
   
 }
  

} 



