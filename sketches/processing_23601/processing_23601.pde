
int x = 0;
int y = 0;
int rate = 1;
int direction = 0; 
// 0 means downwards, 1 means upwards, 2 means leftwards, 3 means rightwards

void setup() {
  size(400, 400);
  smooth();
}

void draw() {  
  if (mousePressed) {
    rate = 5;
    for (int i = 0; i < 10; i++) {
      rect(random(50) - random(50) + mouseX, random(50) - random(50) + mouseY, i, i);
    }
  } else {
    rate = 1;
    stroke(40 * random(6), (direction + 1) * 60, 40 * random(6));
  }
  
  if (direction == 0) {
    line(0, y, height, y);
    y += rate;
    if (y > height)
      direction = 2;
  } else if (direction == 2) {
    line(x, 0, x, width);
    x += rate;
    if (x > height)
      direction = 1;
  } else if (direction == 1) {
    line(0, y, height, y);
    y -= rate;
    if (y < 0)
      direction = 3;
  } else {
    line(x, 0, x, width);
    x -= rate;
    if (x < 0)
      direction = 0;
  }
}

