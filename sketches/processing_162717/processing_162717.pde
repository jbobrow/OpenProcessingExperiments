
int grid = 60;

void setup() {
  size(600, 600);
  background(57, 57, 57);
  rectMode(CENTER);
  smooth();
}

void draw() {
  colorMode(HSB, mouseY);

  for (int x=grid; x<=width-grid; x+=grid) {
    for (int y=grid; y<=height-grid; y+=grid) {
      noStroke();
      fill(120, 214, 237);
      rect(x, y, 18, 22, 2);
    }
  }

  for (int x2=grid; x2<=width-grid-60; x2+=grid) {
    for (int y2=grid-20; y2<=height-grid; y2+=grid-20) {
      noStroke();
      fill(237, 214, 120);
      rect(x2+30, y2+10, 23, 19, 3);
    }
  }
}

void mousePressed() {
    setup();
  }


