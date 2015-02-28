
int size;

void setup() {
  size(600, 600);
  size = 50;

  colorMode(HSB, 255);

  for (int i=0; i<600; i+=size) {
    for (int j=0; j<600; j+=size) {
      strokeWeight(1);
      fill(random(255), 140, 180);
      rect(i, j, size, size);

      fill(random(180, 220));
      ellipse(i+size/2, j+size/2, size-10, size-10);
    }
  }
}

void draw() {

    float mX = map(mouseX, 0, width, -size/4, size/4);
  float mY = map(mouseY, 0, width, -size/4, size/4);

  for (int i=0; i<600; i+=size) {
    for (int j=0; j<600; j+=size) {
      strokeWeight(1);
      fill(random(255), 140, 180);
      rect(i, j, size, size);

      fill(random(180, 220));
      ellipse(i+size/2, j+size/2, size-10, size-10);
      fill(10);
      ellipse(i+size/2+mX, j+size/2+mY, size-35, size-35);
    }
  }
}



