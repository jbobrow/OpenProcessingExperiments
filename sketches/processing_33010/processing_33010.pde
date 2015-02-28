
float x;
float y;
float speedX = 4;
float speedY = 3;
float radius = 25;

void setup() {
  size (500, 500);
}

void draw() {

  background(220, 220, 220);

  for (int i = 0; i < 2; i++) {

    noStroke();
    ellipse (x, y, radius*2, radius*2);
    x+=speedX;
    y+=speedY;

    if (x > 500 - radius) {
      x = 500 - radius;
      speedX = speedX * -1;
      fill(255, 255, 0);
      ellipse (x, y, radius*2, radius*2);
    }
    else if (x < 0 + radius) {
      x = radius;
      speedX = speedX * -1;
      fill(255, 0, 0);
      ellipse (x, y, radius*2, radius*2);
    }

    if (y > 500 - radius) {
      y = 500 - radius;
      speedY = speedY * -1;
      fill(0, 0, 255);
      ellipse (x, y, radius*2, radius*2);
    }
    else if (y < 0 + radius) {
      y = radius;
      speedY = speedY * -1;
      fill(0, 255, 0);
      ellipse (x, y, radius*2, radius*2);
    }
  }
}


