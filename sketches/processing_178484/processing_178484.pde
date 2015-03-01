
void setup() {
  size(600, 600);
}

void draw() {
  background(#981212);
  
 
  fill(#484343);
  pushMatrix();
  translate(width*0.2, height*0.5);
  rotate(frameCount / -20.0);
  star(3, 5, 20, 70, 3); 
  popMatrix();
  
   pushMatrix();
  translate(width*0.8, height*0.5);
  rotate(frameCount / -30.0);
  star(2, 5, 20, 70, 4); 
  popMatrix();
 
}


void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


