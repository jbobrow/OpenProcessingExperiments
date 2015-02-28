
void setup() {
  size(400, 400);
  background(255);
}
 
void draw() { 
  for (int x = 25; x <= width; x +=20) {
    for (int y = 25; y <= height; y +=20) {
      shapes (x, y);
    }
  }
  noLoop();
}
 
 
void shapes (float x, float y) {
  pushMatrix();
  stroke(0, random(255), random(255), random(150)); 
  strokeWeight(random(1,10));
  fill(20, 20, 40, 10);
  rect(random(width),random(height),random(5,50),random(5,50));
  noFill();
  popMatrix();
}



