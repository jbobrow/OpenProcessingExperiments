
import processing.pdf.*;

float r;
float g;
float b;
float a;
float h;

float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;
int x=60;



void setup() {
  size (600,600);
  background (0);
  smooth();
  frameRate(4);
}

void draw() {
  //each time through draw(), new random numbers are picked for a new ellipse.
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  h=random(25);
  x1=random(600);
  y1=random(600);
  x2=random(600);
  y2=random(600);
  x3=random(600);
  y3=random(600);
  x4=random(600);
  y4=random(600);

  
  
  //use values to draw an ellipse 
  stroke(r,g,b,a);
  strokeWeight(h);
  
  
  noFill();
  quad (x1,y1,x2,y2,x3,y3,x4,y4);
  
   //frameRate (x =- 10);
  
}


void mouseClickd() {
  
  endRecord();
  noLoop();
  
}


