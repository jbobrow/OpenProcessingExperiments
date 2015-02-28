
// variables V
// random numbers

//--------------------------------------------------------
void setup() {
  size(300, 300);  
  smooth();
  background(33);
}

//--------------------------------------------------------
void draw() {
  // note that random always gives you back a floating point number
  float radius = random(width);
  float x = random(width);
  float y = random(height);
  float thickness = random(0.1, 5);
  
  stroke(255, 64);
  noFill();
  strokeWeight(thickness);
  ellipse(x, y, radius, radius);
}
