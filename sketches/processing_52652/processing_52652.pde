
void setup() {
  size(800, 800);
  background(0, 0, 255);
  stroke(255);
  strokeWeight(5);

  translate(width/2, height/2);
  rotate(radians(45));

  fill(255, 0, 255);
  for (int i=0; i < 360; i=i+15) {
    ellipse(0, 0, 795, 400);
    rotate(radians(15));
  } 

  fill(0, 255, 255);
  ellipse(0, 0, 750, 750);

  fill(0, 255, 0);
  for (int i=0; i < 360; i=i+30) {
    ellipse(0, 0, 750, 375);
    rotate(radians(45));
  }

  fill(255, 0, 0);
  float theta = 0.0;
  float radius = 330.0;
  int shapeCount = 16;
  float shapeRadius = 55.0;
  for (int i=0; i<shapeCount; i++) {
    //stroke(5);
    //strokeWeight(5); 
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    ellipse(0, 0, shapeRadius*2, shapeRadius*2);
    popMatrix();
    theta += TWO_PI/shapeCount;
  }

  fill(255, 255, 0);
  for (int i=0; i < 360; i=i+15) {
    rect(0, 0, 150, 150);
    rotate(radians(15));
  }

  fill(255);
  noStroke();
  for (int i=0; i < 360; i=i+90) {
    rect(0, 0, 50, 50);
    rotate(radians(90));
  }
}


