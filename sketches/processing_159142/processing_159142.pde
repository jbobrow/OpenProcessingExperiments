
import processing.pdf.*;
float r;
float g;
float b;
float a;
float x;
float y;
int d=mouseX;
int c= mouseY;
void setup(){
  size(600,200);
  frameRate(20);
  background(255);
  smooth();
  beginRecord(PDF,"everything.pdf");
}
void draw(){
  if(mousePressed == true);
     ellipse(d,c,50,50);
  d=mouseX;
  c=mouseY;
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  fill(r,g,b,a);
}


void mouseClicked(){
  endRecord();
  noLoop();
}


