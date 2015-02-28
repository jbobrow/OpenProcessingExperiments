
void setup() {
  size(500, 500);
  background(0);
  smooth();
  noStroke();
}

void draw() {

  if (mousePressed == true) {
    ellipse(pmouseX, pmouseY, mouseX, mouseY);

    if (keyPressed == true) {

      fill(random(0, 126), random(0, 126), random(0, 126));
      for (int i = 0; i<width; i = i + 20) {
        for (int j = 0; j<height; j = j +20) {

          rect(i, j, 10, 10);
          fill(random(126, 255), random(126, 255), random(126, 255));

          rect(i+10, j +10, 10, 10);

          fill(random(0, 255), random(0, 255), random(0, 255));
          ellipse(i, j, 15, 15);
        }
      }
    }
  }
}
