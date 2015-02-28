
float circleY = 300;
float circleX = 20;
float moveX = 2;
float moveY = -2;

void setup() {
  size(400, 400);
  stroke(#D60DFF);
  strokeWeight(7);
}

void draw() {
  background(#21EA73);
  ellipse(circleX, circleY, 40, 40);
  circleX = circleX + moveX;
  circleY = circleY + moveY;

  if (circleX > width) {
    circleX = width;
    moveX = -moveX;
    print("\nToo far right");
  }
  if (circleY > height) {
    circleY = height;
    moveY = -moveY;
    print("\nToo far bottom");
  }
  if (circleX < 0) {
    circleX = 0;
    moveX = -moveX;
    print("\nToo far left");
  }
  if (circleY < 0) {
    circleY = 0;
    moveY = -moveY;
    print("\n Too far top");
  }
}



