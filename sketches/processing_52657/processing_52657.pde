
void setup() {
  size(600, 600);
}

void draw() {
  background(255);

  translate(width/2, height/2);
  rect(-140, -120, 100, 100);
  rect(-140, 0, 100, 100);
  rect(40, 0, 100, 100);
  rect(40, -120, 100, 100);
  rect(-50, -60, 100, 100);
  noFill();
  rect(-250, -250, 500, 500);
  fill(255);


  float theta = 0.0;
  float radius = 245.0;
  int shapeCount = 12;
  float shapeRadius = 45.0;
  for (int i=0; i<shapeCount; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    ellipse(0, 0, shapeRadius*2, shapeRadius*2);
    popMatrix();
    theta += TWO_PI/shapeCount;
  }

  float theta2 = 0.0;
  float radius2 = -85.0;
  int shpaeCount2 = 6;
  float shapeRadius2 = 30;
  for (int i=0; i<shapeCount; i++) {
    pushMatrix();
    translate(cos(theta2*2)*radius2*2, sin(theta2*2)*radius2*2);
    rotate (PI/3);
    triangle(0, 0, -shapeRadius2, -10, -10, -shapeRadius2);
    popMatrix();
    theta2 += TWO_PI/shapeCount;
  }
}


