
void setup() {
  size(480, 480);
}

void draw() {
  if (mousePressed) {
    fill(random(255),random(255),random(255));
  } else {
    fill(255,0,255);
  }
  triangle(mouseX, mouseY, 100,100,100,80);
}

