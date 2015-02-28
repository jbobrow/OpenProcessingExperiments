
//Assignment #3
//Name: Jessica Tan
//E-mail: jtan@brynmawr.edu
//Date: 9/23/10
float x;
float y;
float w;
float h;
float r;
float g;
float b;
float a;


void setup() {
  size(500,500);
  background(255);
  smooth();
  frameRate(5);
  x=10;
  y=10;
  w=20;
  h=20;
}

void draw() {
rectMode(CENTER);
drawFlower();

}
  void drawFlower() {
    
  noStroke();
  fill(r,g,b,a);
  ellipse(mouseX,mouseY,w,h);
  ellipse(mouseX+w/4,mouseY,w/2,h/2);
  ellipse(mouseX-w/4,mouseY,w/2,h/2);
  ellipse(mouseX,mouseY+h/4,w/2,h/2);
  ellipse(mouseX,mouseY-h/4,w/2,h/2);
  stroke(175);
  line(mouseX-w/8,mouseY-w/8,mouseX,mouseY);
  line(mouseX+w/8,mouseY-w/8,mouseX,mouseY);
  line(mouseX-w/8,mouseY+w/8,mouseX,mouseY);
  line(mouseX+w/8,mouseY+w/8,mouseX,mouseY);
  noStroke();
  fill(r+10,g+10,b+10,a+100);
  ellipse(mouseX-w/8,mouseY-w/8,w/10,h/10);
  ellipse(mouseX+w/8,mouseY-w/8,w/10,h/10);
  ellipse(mouseX-w/8,mouseY+w/8,w/10,h/10);
  ellipse(mouseX+w/8,mouseY+w/8,w/10,h/10);
 
  }
  void mousePressed() {
    
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(50,150);
  x=mouseX;
  y=mouseY;
  w=random(100);
  h=w;
  }
   
  
 

