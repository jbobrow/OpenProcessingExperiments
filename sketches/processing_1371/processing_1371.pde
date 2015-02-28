
/**
 * Arm. 
 * 
 * The angle of each segment is controlled with the mouseX and
 * mouseY position. The transformations applied to the first segment
 * are also applied to the second segment because they are inside
 * the same pushMatrix() and popMatrix() group.
*/

float x = 100;
float y = 200;
float angle1 = 0.0;
float angle2 = 0.0;
float segLength = 150;

void setup() {
  size(300, 400);
  smooth(); 
  strokeWeight(70.0);
  stroke(0, 150);
}

void draw() {
  background(100);
  
  angle1 = (mouseX/float(width) - 0.5) * -PI;
  angle2 = (mouseY/float(height) - 0.5) * PI;
  
  pushMatrix();
  segment(x, y, angle2); 
  segment(segLength, 0, angle1);
  popMatrix();
  segment(x, y, angle1); 
  segment(segLength, 0, angle2);
}

void segment(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
}

