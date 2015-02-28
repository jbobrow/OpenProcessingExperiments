
int space = 10;

void setup() {
  size(400, 300);
  colorMode(HSB, 360, 100, 100);
  smooth();
  newGrid();
}

void draw() {
}

void mouseClicked() {
  newGrid();
}

void newGrid() {
  background(random(360), 50, 100);
  stroke(random(360), 100, 50);
  space = int(random(4, height * 0.1));
  strokeWeight(space * 0.4);
  for (int x = 0; x < width; x += space) {
    for (int y = 0; y < height; y += space) {
      int r = int(random(3));
      if (r == 2) {
        line(x, y, x + space, y + space);
      }
      else if (r == 1) {
        line(x, y + space, x + space, y);
      }
      else continue;
    } 
  }
}


