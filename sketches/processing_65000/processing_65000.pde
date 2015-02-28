
int x = 215;
int y = 45;

void setup() {
  size(480, 120);
  fill(255);
}
void draw() {
  background(0);
  //fill(255);
  rect(x, y, 50, 50);
  if ((keyPressed) && (key == CODED)) {
    if (keyCode == LEFT) {
      fill(#E82121);
      rect(x, y, 50, 50);
      x--;
    }
    if (keyCode == RIGHT) {
      fill(#21E822);
      rect(x, y, 50, 50);
      x++;
    }
    if (keyCode == UP) {
      fill(#2321E8);
      rect(x, y, 50, 50);
      y--;
    }
    if (keyCode == DOWN) {
      fill(#DA21E8);
      rect(x, y, 50, 50);
      y++;
    }
  }
  if ((keyCode == DOWN) && (keyCode == LEFT)) {
    fill(#DA21E8);
    rect(x, y, 50, 50);
    y++;
    x--;
  }
  if (x == 0) {
    x = width;
  }
  if (x == width + 1) {
    x = 0;
  }
  if (y == height) {
    y = 0;
  }
  if (y == -1) {
    y = height;
  }
  rect(x, y, 50, 50);
}


