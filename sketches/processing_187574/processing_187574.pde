
void setup() {
  size(510, 510);
  smooth();
  frameRate(5);
  noStroke();
}

void draw() {
  background(mouseY, mouseX, random(255), 100);
  for (float i = 12.5; i < width; i +=25) {
    for (float j = 12.5; j < height; j +=25) {
      fill((mouseX/2), (mouseY/2), random(255));
      if (mousePressed == true) {
        fill((mouseY/2), (mouseX/2), random(255));
      }
      ellipse(i, j, 20, 20);
    }
  }
  for (int a = 25; a < width; a += 25) {
    for (int b = 25; b < height; b += 25) {
      fill(random(255), (mouseX/2), (mouseY/2));
      if (mousePressed == true) {
        fill(random(255), (mouseY/2), (mouseX/2));
      }
      ellipse(a, b, 10, 10);
    }
  }
}

