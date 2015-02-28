
void setup() {
  size(500, 500);
  smooth();
  background(255);
  frameRate(15);
}

void draw() { 
  background(255);
  for (int i = 0; i <height; i+=80) {
    for (int j = 0; j<width; j+=80) {
      bullseye(random(2,5), 1, 10, random(0, 255), random(0, 255), random(0, 255), i, j);
    }
  }
}

void bullseye (float rings, float thickness, float spacing, 
                float color1, float color2, float color3, 
                float xPosition, float yPosition) {
  stroke(color1, color2, color3);
  strokeWeight(thickness);
  noFill();
  for (int i=0;i <= rings;i++) {
    ellipse(xPosition, yPosition, i*spacing, i*spacing);
  }
}
