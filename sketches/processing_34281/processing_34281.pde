
void setup() {
size(600, 400);
frameRate(60);
}

float pX=50;
float pY=50;
float moveX=-2;
float moveY=+2;

float pX2=100;
float pY2=100;
float moveX2=+2;
float moveY2=-2;
float z=1;

float pX3=150;
float pY3=150;
float moveX3=-2;
float moveY3=+2;


void draw() {
background(0);
if (mouseButton == LEFT) { 
 PImage img;
img = loadImage("a2.jpg");
image(img, pX,pY,100,100); 
pX=pX+moveX;
pY=pY+moveY;
z=z+1;
}




if (pX> width){
  pX=width;
  moveX=-moveX;
}
if(pY > height) {
    pY = height;
    moveY = -moveY;
  }
  
  if(pX<0) {
    pX= 0;
    moveX = -moveX;
  }
  if(pY < 0) {
    pY = 0;
    moveY = -moveY;
  }
  
 if (z>10) {
 PImage g;
g = loadImage("a1.jpg");
image(g, pX2,pY2,100,100); 
pX2=pX2+moveX2;
pY2=pY2+moveY2;
}
if (pX2> width){
  pX2=width;
  moveX2=-moveX2;
}
if(pY2 > height) {
    pY2 = height;
    moveY2 = -moveY2;
  }
  
  if(pX2<0) {
    pX2= 0;
    moveX2 = -moveX2;
  }
  if(pY2 < 0) {
    pY2 = 0;
    moveY2 = -moveY2;
  }
  
  if (z>20) { 
    PImage g6;
g6 = loadImage("a6.jpg");
image(g6, pX3,pY3,100,100);
pX3=pX3+moveX3;
pY3=pY3+moveY3;
}

if (pX3> width){
  pX3=width;
  moveX3=-moveX3;
}
if(pY3 > height) {
    pY3 = height;
    moveY3 = -moveY3;
  }
  
  if(pX3<0) {
    pX3= 0;
    moveX3 = -moveX3;
  }
  if(pY3 < 0) {
    pY3 = 0;
    moveY3 = -moveY3;
  }
  
}


