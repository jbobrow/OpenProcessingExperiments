
float x = 200;
float y = 200;
float x2 = 300;
float y2 = 200;
int startPointX = 200;
int startPointY = 200;
int startPoint2X = 300;
int startPoint2Y = 300;
float angle1 = 0.0;
float angle2 = 0.0;
float angle3 = 0.0;
float angle4 = 0.0;
float angle5 = 0.0;
float angle6 = 0.0;
float angle7 = 0.0;
float angle8 = 0.0;
float segLength = 50;

void setup() {
  size(500, 500);
  smooth(); 
  strokeWeight(1.0);
  stroke(0, 100);
}

void draw() {
  background(226);
  drawSpider1();
  drawSpider2();
}

void drawSpider1() {
  
  fill(0);
  line(x, 0, startPointX, startPointY);

  fill(0);
  ellipse(startPointX, startPointY, 50, 50);

  fill(255);
  ellipse(startPointX - 10, startPointY + 10, 10, 10);
  ellipse(startPointX + 10, startPointY + 10, 10, 10);

  angle1 = (mouseX/float(width) - 0.5) * -PI;
  angle2 = (mouseY/float(height) - 0.5) * PI;
  angle3 = (mouseX/float(width) - 0.8) * -PI;
  angle4 = (mouseY/float(height) - 0.8) * PI;
  angle5 = (mouseX/float(width) - 1.0) * -PI;
  angle6 = (mouseY/float(height) - 1.0) * PI;
  angle7 = (mouseX/float(width) - 0.3) * -PI;
  angle8 = (mouseY/float(height) - 0.3) * PI;

  pushMatrix();
  segment(startPointX, startPointY, angle1); 
  segment(segLength, 0, angle2);
  popMatrix();

  pushMatrix();
  segment(startPointX, startPointY, angle3); 
  segment(segLength, 0, angle4);
  popMatrix();

  pushMatrix();
  segment(startPointX, startPointY, angle5); 
  segment(segLength, 0, angle6);
  popMatrix();

  pushMatrix();
  segment(startPointX, startPointY, angle7); 
  segment(segLength, 0, angle8);
  popMatrix();

  startPointY = startPointY + 1;

  filter(BLUR);

}

void drawSpider2() {
  
  fill(0);
  line(x2, 0, startPoint2X, startPoint2Y);

  fill(0);
  ellipse(startPoint2X, startPoint2Y, 50, 50);

  fill(255);
  ellipse(startPoint2X - 10, startPoint2Y + 10, 10, 10);
  ellipse(startPoint2X + 10, startPoint2Y + 10, 10, 10);

  angle1 = (mouseX/float(width) - 0.5) * -PI;
  angle2 = (mouseY/float(height) - 0.5) * PI;
  angle3 = (mouseX/float(width) - 0.8) * -PI;
  angle4 = (mouseY/float(height) - 0.8) * PI;
  angle5 = (mouseX/float(width) - 1.0) * -PI;
  angle6 = (mouseY/float(height) - 1.0) * PI;
  angle7 = (mouseX/float(width) - 0.3) * -PI;
  angle8 = (mouseY/float(height) - 0.3) * PI;

  pushMatrix();
  segment(startPoint2X, startPoint2Y, angle1); 
  segment(segLength, 0, angle2);
  popMatrix();

  pushMatrix();
  segment(startPoint2X, startPoint2Y, angle3); 
  segment(segLength, 0, angle4);
  popMatrix();

  pushMatrix();
  segment(startPoint2X, startPoint2Y, angle5); 
  segment(segLength, 0, angle6);
  popMatrix();

  pushMatrix();
  segment(startPoint2X, startPoint2Y, angle7); 
  segment(segLength, 0, angle8);
  popMatrix();

  startPoint2Y = startPoint2Y + 1;

  filter(BLUR);

}

void segment(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
}




