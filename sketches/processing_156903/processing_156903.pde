
float angleX = 0;
float angleY = 0;
float angleIncX,angleIncY;;
int d = 300;
float angRange = 0.02;
int a = 130;

int alpha = 200;
color c1 = color(0, 200, 255, alpha);
color c2 = color(50, 150, 250, alpha);
color c3 = color(100);

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  translate(width/2, height/2);
  background(0);
  noStroke();
  angleIncX = map(mouseX, 0, 600, -angRange, angRange);
  angleIncY = map(mouseY, 0, 600, -angRange, angRange);
  
  pushMatrix();
  translate(-a, -d/2);
  fill(c3);
  ellipse(0, 0, d, d);
  pushMatrix();
  rotate(angleX-2*PI/3);
  fill(c1);
  ellipse(d/4, 0, d/2, d/2);
  popMatrix();
  rotate(angleY-2*PI/3);
  fill(c2);
  ellipse(-d/3, 0, d/3, d/3);
  popMatrix();

  pushMatrix();
  translate(a, 0);
  fill(c3);
  ellipse(0, 0, d, d);
  pushMatrix();
  rotate(angleX);
  fill(c1);
  ellipse(d/4, 0, d/2, d/2);
  popMatrix();
  rotate(angleY);
  fill(c2);
  ellipse(-d/3, 0, d/3, d/3);
  popMatrix();

  pushMatrix();
  translate(-a, d/2);
  fill(c3);
  ellipse(0, 0, d, d);
  pushMatrix();
  rotate(angleX+2*PI/3);
  fill(c1);
  ellipse(d/4, 0, d/2, d/2);
  popMatrix();
  rotate(angleY+2*PI/3);
  fill(c2);
  ellipse(-d/3, 0, d/3, d/3);
  popMatrix();
  angleX += angleIncX;
  angleY += angleIncY;
}

