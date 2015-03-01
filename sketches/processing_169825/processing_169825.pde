
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(0);
 
  translate(width / 2, height / 2);
  
  // ellipse der uhr

  strokeWeight(10);
  stroke(75);
  ellipse(0, 0, 300, 300);
  
  
  // seconds
  strokeWeight(1);
  float sekunden = 360 / 60 * second();
  pushMatrix();
  rotate(radians(sekunden));
  line(0, 0, 0, -125);
  popMatrix();
  
  // minutes
  strokeWeight(4);
  float mminuten = 360 / 60 * minute();
  pushMatrix();
  rotate(radians(mminuten));
  line(0, 0, 0, -100);
  popMatrix();
  
  // hours
  strokeWeight(4);
  float stunde = 360 / 12 * hour();
  pushMatrix();
  rotate(radians(stunde));
  line(0, 0, 0, -70);
  popMatrix();
}
