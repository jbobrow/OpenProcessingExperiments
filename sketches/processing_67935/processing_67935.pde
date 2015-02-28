
void setup() {
  size(250,250);
  noStroke();
  frameRate(10);
  background(255);
}

void draw() {
  if (mouseX > 13 && mouseX < 237 && mouseY > 13 && mouseY < 237) {
    blackdraw();
  } else {
    whitedraw();
  }
}

void blackdraw() {
  for (int i=0; i<1; i++) {
    int x = int(random(1,10));
    int y = int(random(1,10));
    fill(0,20);
    rectMode(CENTER);
    rect(x*25, y*25, 24, 24);
  }
}

void whitedraw() {
  for (int i=0; i<1; i++) {
    int x = int(random(1,10));
    int y = int(random(1,10));
    fill(255,126);
    rectMode(CENTER);
    rect(x*25, y*25, 24, 24);
  }
}

