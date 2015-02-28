
ShapeV myshape1;
ShapeV myshape2;
ShapeV myshape3;
ShapeV myshape4;
float a;

void setup() {
  size (550, 600);
  background(0);
  
  myshape1 = new ShapeV(150+25, 250-20, 275+25, 325-20);
  myshape2 = new ShapeV(150+50, 250-40, 275+50, 325-40);
  myshape3 = new ShapeV(150+75, 250-60, 275+75, 325-60);
  myshape4 = new ShapeV(150+100, 250-80, 275+100, 325-80);
}
  

void draw() {
  colorMode(HSB);
  smooth();
  strokeWeight(1);
  stroke(350, abs(mouseX-255)-50, 99);
  myshape1.drawV();
  stroke(223, abs(mouseX-255), 99);
  myshape2.drawV();
  stroke(200, abs(mouseX-255)+50, 99);
  myshape3.drawV();
  stroke(188, abs(mouseX-255)+100, 99);
  myshape4.drawV();
}

class ShapeV {
  float xpos; float ypos; float xpos2; float ypos2;
  
  ShapeV(float a, float b, float c, float d) {
    xpos = a;
    ypos = b;
    xpos2 = c;
    ypos2 = d;
  }
  
  //one shape
  void drawV() {
  noFill();
  beginShape();
  vertex(xpos, ypos);
  vertex(xpos2, ypos2);
  vertex(xpos2, ypos2+100);
  vertex(xpos, ypos+100);
  vertex(xpos, ypos);
  endShape();
  
  }
}
