
// Learning Processing Example 9-11. Thanks Shiffman!
// Appending bouncing balls to an array.

final float GRAVITY = 0.1;

Ball[] balls = new Ball[1];

void setup() {
  size(400, 400);
  balls[0] = new Ball(50, 0, 16);
}

void draw() {
  background(100);
  for (int i = 0; i < balls.length; ++i) {
    balls[i].gravity();
    balls[i].move();
    balls[i].display();
  }
}

void mousePressed() {
  Ball b = new Ball(mouseX, mouseY, 10);
  balls = (Ball[])append(balls, b);
}

// A ball that bounces
class Ball {

  static final float INITIAL_SPEED = 0.0;
  float x;
  float y;
  float speed;
  float width;

  Ball(float x, float y, float width) {
    this.x = x;
    this.y = y;
    this.width = width;
    speed = INITIAL_SPEED;
  }

  void gravity() {
    speed += GRAVITY;
  }

  void move() {
    y += speed;
    if (y > height) {
      speed *= -0.95;
      y = height;
    }
  }

  void display() {
    fill(200);
    noStroke();
    ellipse(x, y, width, width);
  }

}
