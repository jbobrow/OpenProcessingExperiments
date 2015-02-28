
int division = 10;

void setup() {
  size(300, 300);
}

void draw() {
  // Turning integer arithmetic into floating point one
  // by multiplying by 1.0. You may try removing 1.0 to see
  // the difference.
  float xStep = mouseX * 1.0 / division;
  float yStep = mouseY * 1.0 / division;

  background(0);
  
  noFill();
  stroke(mouseX, mouseY, 0);  // Define stroke color by mouse position.
  for (float y = 0; y <= division; y++) {
    for (float x = 0; x <= division; x++) {
      ellipse(x * xStep, y * yStep, 15, 15);
    }
  }
}



