
int x=0;
int y=0;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  noStroke();
  ellipse(x, y, 30, 30);
  fill(193);
  if (key == 'd' && x<width) {
    x=x+2;
  }
  if (key == 'a' && x>0) {
    x=x-2;
  }
  if (key == 's' && y<height) {
    y=y+2;
  }
  if (key == 'w' && y>0) {
    y=y-2;
  }
  if (mousePressed) {
    noStroke();
    ellipse(x, y, 30, 30);
    fill(110);
    if (key == 'd' && x<width) {
      x=x+7;
    }
    if (key == 'a' && x>0) {
      x=x-7;
    }
    if (key == 's' && y<height) {
      y=y+7;
    }
    if (key == 'w' && y>0) {
      y=y-7;
    }
  }
}

