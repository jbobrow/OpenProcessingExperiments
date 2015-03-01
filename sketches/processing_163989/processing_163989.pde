
void setup() {
  size(900, 1000);
  colorMode(HSB, 255);
}

void draw() {
  background(255);
  fill(0);
  ellipse(450, 150, 150, 125);
  fill(255);
  ellipse(420, 130, 30, 40);
  ellipse(480, 130, 30, 40);
  fill(0);
  float mappedEyeLeft = map(second(), 0, 59, 407, 433);
  float mappedEyeRight = map(second(), 0, 59, 467, 497);
  ellipse(mappedEyeLeft, 130, 14, 27); 
  ellipse(mappedEyeRight, 130, 14, 27);
}
