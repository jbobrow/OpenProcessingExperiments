
void setup() {
  size(600, 600);
}

void draw() {
  smooth();
  strokeWeight(3);
}

void mouseClicked() {
  face(mouseX, mouseY);
}


void face (int x, int y) {

  float g = random(100, 255);
  float b = random(100, 255);

  fill(255, g, b);
  ellipse(x, y, 100, 100);

  fill(0);
  ellipse(x-30, y-10, 10, 10);
  ellipse(x+30, y-10, 10, 10);

  line(x-35, y-25, x-20, y-15);
  line(x+20, y-15, x+35, y-25);

  line(x-30, y+20, x+30, y+20);
  line(x-30, y+15, x-30, y+25);
  line(x+30, y+15, x+30, y+25);
}
