

int moveX=1;
int moveY=1;


void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(200);
  for (int y = 0; y < width/2; y = y +40) {
    for (int x = 0; x <= height; x = x +40) {
      noStroke();
      ellipse (y, x, 30, 3);
    }
  }

  for (int y1 = width/2; y1 <= width; y1=y1 +40) {
    for (int x1 = 0; x1 <= height; x1 = x1 +40) {

      stroke(0);
      fill(y1, x1, y1+100);
      ellipse (y1+random(5), x1+random(5), 30, 30);
    }
  }

  if (mousePressed) {

    background(200);
    for (int y = 0; y < width/2; y = y +40) {
      for (int x = 0; x <= height; x = x +40) {
        stroke(0);
        fill(y, x, y+100);
        ellipse (y+random(5), x+random(5), 30, 30);
      }
    }

    for (int y1 = width/2; y1 <= width; y1=y1 +40) {
      for (int x1 = 0; x1 <= height; x1 = x1 +40) {

        noStroke();
        ellipse (y1, x1, 30, 3);
      }
    }
  }
}

