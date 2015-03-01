
void setup() {
  size(600, 400);
  background(255);
  smooth();
  noStroke();
}
void draw() {
  float red_prob = 0.60; 
  float green_prob = 0.10; 
  float blue_prob = 0.30; 
  float num = random(1); 
  if (num < red_prob) {
    fill(255, 53, 2, 150);
  } else if (num < green_prob + red_prob) {
    fill(156, 255, 28, 150);
  } else {
    fill(10, 52, 178, 150);
  }
  ellipse(random(width), random(height), random(5,25), random(5,25));
}



