
color backgr = color(0);
color coStr = color(100);

void setup() {
  size(810, 970);
  noFill();
  background(backgr);
  smooth();
}

void draw_grid() {
  background(backgr);
  for (int y = 0; y < height; y +=10) {
    stroke(coStr);
    if (random(20)>17) {
      strokeWeight(4);
    } else {
      strokeWeight(1);
    }
    line(random(50, width), y, random(50, width), y);
  }
}

void draw() {
  if (keyPressed) {
    if (key == 's') {
      save(random(1000000) + ".png");
    }
  }
}

void mousePressed() {
  draw_grid();
}
