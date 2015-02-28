
PImage snail;

float x = 150;
float y = 100;
float angle1 = 0.0;
float snailLength = 2;

void setup() {
  size(1000, 600);
  smooth(); 
  //strokeWeight(20.0);
  //stroke(0, 100);
  snail = loadImage("snail.png");  
}

void draw() {
  background(226);

  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * snailLength);
  y = mouseY - (sin(angle1) * snailLength);
  
  snail(x, y, angle1);
  //segment(x, y, angle1); 
//  ellipse(x, y, 20, 20);
  image(snail, x, y, 262, 118);
}

void snail(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, snailLength, 0);
  popMatrix();
}


