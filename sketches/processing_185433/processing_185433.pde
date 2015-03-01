
/*
 Andor Salga
*/

void setup() {
  size(300, 300);
  noSmooth();
  strokeWeight(4);
  noFill();
  rectMode(CENTER);
}

void draw() {
  background(255);

  for (int x = -100; x < width; x += 98  ) {
    for (int y = 0; y < height; y += 98) {
      pushMatrix();
      translate(x + frameCount % 98, y);

      for (int i = 10; i < 100; i += 16) {
        rect(0, 0, i, i);
      }

      popMatrix();
    }
  }
}

