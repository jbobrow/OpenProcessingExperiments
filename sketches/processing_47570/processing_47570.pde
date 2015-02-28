
void setup() {
  size(500, 500);
  smooth();
  background(0);
  stroke(255);
  noFill();
}
 
void draw() {
  float x = random(width);
  float y = random(height);
 
  float s = random(20, 50);
  
  ellipse(x, y, s, s);
  
}

