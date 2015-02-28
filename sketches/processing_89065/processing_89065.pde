
/* @pjs preload="pope.jpg"; */
PImage img;
float beginX = 20.0;
float beginY = 10.0;
float endX = 700.0;
float endY = 800.0;
float distX;
float distY;
float exponent = 0.5;
float x = 0.0;
float y = 0.0;
float step = 0.01;
float pct = 0.0;

void setup(){
  img = loadImage("pope.jpg");
  size(800,800);
  image(img,0,0);
  noStroke();
  smooth();
  distX=endX-beginX;
  distY=endY-beginY;
}
void draw(){
fill(0,2);
rect(0,0,width,height);
pct += step;
if (pct <1.0){
  x = beginX + (pct * distX);
  y = beginY + (pow(pct,exponent)*distY);
}
fill(200,0,0);
ellipse(x,y,50,50);
}


