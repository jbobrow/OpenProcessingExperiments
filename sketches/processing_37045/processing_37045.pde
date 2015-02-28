
void setup() {
  size (400, 400);
  colorMode(HSB, width, 250, 90);
}

void draw() {
  background (214, 36, 0);
  for (int x=10; x<200; x+=10) {
    noStroke();
    fill(mouseX, x, height, 50);//changes color as mouse moves over shape
    ellipse(height/2, width/2, 200, 60);
  }

  for (int x=30; x<100; x+=100) {
    fill(mouseX, 200, mouseY, 60);
    rect(100, 100, 200, 200, 300, 300);
  }
}


