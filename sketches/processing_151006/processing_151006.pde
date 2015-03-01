
void setup() {
  size(600, 600); 
  smooth();
  background(255);
}

void draw() {
  noFill();
  stroke(#12EAFF, 30);
  strokeWeight(5);
  for (float a = 50; a <=width; a = a + 165) {
    for (float b = 50; b <=height; b = b + 200) {
      ellipse(a, b, 100, 100);
      ellipse(a, b, 50, 50);
    }
  }
  for (float a = 130; a <=width; a = a + 165) {
    for (float b = 150; b <=height; b = b + 200) {
      ellipse(a, b, 100, 100);
      ellipse(a, b, 50, 50);
    }
  }
}
