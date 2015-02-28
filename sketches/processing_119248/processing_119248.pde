
void setup() {
  size(400, 400);
  background(255);
  stroke(255, 100);
  strokeWeight(5);
}

void draw() {
  background(255);
  fill(0, 60);
  //noFill();

  pushMatrix();
  translate(width*0.5, height*0.5);
  polygon(0, 0, 200, second()); 
  popMatrix();
  
  
  pushMatrix();
  translate(width*0.5, height*0.5);
  polygon(0, 0, 180, second()/5); 
  popMatrix();

  pushMatrix();
  translate(width*0.5, height*0.5);
  polygon(0, 0, 140, minute()); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.5, height*0.5);
  polygon(0, 0, 160, minute()/5); 
  popMatrix();

  pushMatrix();
  translate(width*0.5, height*0.5);
  polygon(0, 0, 120, hour()/2); 
  popMatrix();

  pushMatrix();
  translate(width*0.5, height*0.5);
  polygon(0, 0, 100, hour()); 
  popMatrix();

}
//example polygon
void polygon(float x, float y, float radius, int points) {
  float angle = TWO_PI / points;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
