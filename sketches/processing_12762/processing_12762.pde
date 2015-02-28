
// Assignment # 3
// Name: Zandalee Montero
// E-mail: zmontero@brynmawr.edu
// Date: 9/21/10 


float x, y, w, h, r, g, b, a; 

void setup() {
  size(500,500);
  smooth();
  frameRate(15);

  x= random(width);
  y= random(height);
  w= random(200);
  h= w;
  r= random(255);
  g= random(255);
  b= random(255);
  a= random(255);
}
void draw() {
  background(255);
}

void drawrocket(float x,float y, float w, float h) {
  beginShape();
  curveVertex(x,y);
  curveVertex(x,y);
  curveVertex(x+0.3*w,y-0.7*h); 
  curveVertex(x+w,y-h);
  curveVertex(x+0.7*w, y-0.3*h);
  curveVertex(x,y);
  curveVertex(x,y);
  curveVertex(x-0.3*w,y+0.7*h); 
  curveVertex(x+w,y-h);
  curveVertex(x-0.7*w, y+0.3*h);
  curveVertex(x,y);
  curveVertex(x,y);
  endShape(CLOSE);
}

void mouseDragged() {
  w= random(200);
  h= w;
  r= random(255);
  g= random(255);
  b= random(255);
  a= random(255);
  background(255);
  noStroke();
  fill(r,g,b,a);
  drawrocket (mouseX, mouseY, w, h);
}


