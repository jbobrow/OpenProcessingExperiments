
// Assignment #2
// Name: Meagan Neal
// E-mail: mneal@brynmawr.edu
// Date: September 23,2010


void setup() {
  size(600,500);
  background(255);
  smooth();
  frameRate(15);
}
void draw() {
  float x, y, w, h;
     x= random(width);
     y= random(height);
     w= random(0,0);
     h= random(0,30);
  drawLine(x, y, w, h);
}

void drawLine(float x, float y, float w, float h) {
  strokeWeight(15);
  stroke(random(255), random(255), random(255), 150);
  ellipse(x,y,w,y);
  ellipse(y,x,y,w);
    
  
  }
  
  void mousePressed() {
    background(255);
    
  }



