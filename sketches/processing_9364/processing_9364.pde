
/**
 * Arm. 
 * 
 * The angle of each segment is controlled with the mouseX and
 * mouseY position. The transformations applied to the first segment
 * are also applied to the second segment because they are inside
 * the same pushMatrix() and popMatrix() group.
*/

float x = 200;
float y = 200;
float angle1 = 0.0;
float angle2 = 0.0;
float angle3 = 0.0;
float angle4 = 0.0;
float segLength = 50;

void setup() {
  size(400, 400);
  smooth(); 
  strokeWeight(20.0);
  stroke(0, 100);
}

void draw() {
  float r1 = random(0, 255);
  float r2 = random(0, 255);
  float r3 = random(0, 255);
  background(r1, r2, r3);
  
  angle1 = (mouseX/float(width) - 0.5) * -PI;
  angle2 = (mouseY/float(height) - 0.5) * PI;
  angle3 = (mouseX/float(width) + 0.5) * -PI;
  angle4 = (-mouseY/float(height) + 0.5) * PI;
  
  pushMatrix();
  segment(x, y, angle1); 
  segment(segLength, 0, angle2);
  popMatrix();

  pushMatrix();
  segment1(x, y, angle3);
  segment(segLength, 0, angle4);
  popMatrix();
  
  pushMatrix();
  segment2(x, y);
  popMatrix();
  
  pushMatrix();
  head(x, y - 20);
  popMatrix();
}

void segment(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
}
void segment1(float x, float y, float a) {
  translate(x, y);
  rotate(-a);
  line(0, 0, segLength, 0);
}
void segment2(float x, float y) {
  translate(x, y);
  line(0, 0, 0, segLength+100);
}

void head(float x, float y)
{
  translate(x, y);
  ellipse(0, 0, 35, 35);
}

