
void setup() {
  size(640, 360);
}

void draw() {
  background(0, 0, 127);
  
  pushMatrix();
  translate(width*0.2, height*0.5);
  rotate(frameCount / 50.0);
  star(0, 0, 25, 20, 10); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.275, height*0.5);
  rotate(frameCount / 50.0);
  star(0, 0, 25, 20, 10); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.275, height*0.63);
  rotate(frameCount / 50.0);
  star(0, 0, 25, 20, 10); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.35, height*0.63);
  rotate(frameCount / 50.0);
  star(0, 0, 25, 20, 10); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.35, height*0.76);
  rotate(frameCount / 50.0);
  star(0, 0, 25, 20, 10); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.425, height*0.76);
  rotate(frameCount / 50.0);
  star(0, 0, 25, 20, 10); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.5, height*0.76);
  rotate(frameCount / 50.0);
  star(0, 0, 25, 20, 10); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.575, height*0.76);
  rotate(frameCount / 50.0);
  star(0, 0, 25, 20, 10); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.575, height*0.63);
  rotate(frameCount / 50.0);
  star(0, 0, 25, 20, 10); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.575, height*0.5);
  rotate(frameCount / 50.0);
  star(0, 0, 25, 20, 10); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.575, height*0.0275);
  rotate(frameCount / 1000.0);
  star(0, 0, 150, 120, 10); 
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
