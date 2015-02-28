
void setup() {
  size(1280, 800);
  colorMode(HSB, 100, 100, 100, 100);
  background(100);

  smooth();
  noStroke();
  fill(100, 20);
}

void draw() {
  if (dist(mouseX, mouseY, pmouseX, pmouseY) > 0) {

    fill(100, 3);
    rect(0, 0, width, height);


    int shapeCount = 10;

    for (int i = 0; i < shapeCount; i++) {
      fill(random(0, 100), 80, 80, 40);

      float x1 = mouseX + random(-100, 100);
      float x2 = mouseX + random(-100, 100);
      float x3 = mouseX + random(-100, 100);

      float y1 = mouseY + random(-100, 100);
      float y2 = mouseY + random(-100, 100);
      float y3 = mouseY + random(-100, 100);

      float size = random(20, 100);

      triangle(x1, y1, x2, y2, x3, y3);
      //ellipse(x1, y1, size, size);
    }
  }
}


