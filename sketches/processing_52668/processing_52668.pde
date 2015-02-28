
void outerCircles(int count, float radius) {
  noFill();

 


  float theta = 0.0;
  float shapeRadius = 20.0;
  for (int i=0; i<count; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    ellipse(0, 0, shapeRadius*2, shapeRadius*2);
    popMatrix();
    theta += TWO_PI/count;
    
  }
}



