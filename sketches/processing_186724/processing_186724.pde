
color bColor = color(255, 255, 255);

void setup() {
  size(400, 400);
}

void draw() {
  background(bColor);
  ellipse(mouseX, mouseY, 100, 100);
  fill(255);
  ellipse(190,180, 100, 100);
  fill(155);
  }


void mousePressed() {
  bColor = color(random(255), random(255), random(255));
}
