
Ball[] balls;
int numBalls = 50;
float minDist = 100.0;
float springAmount = 0.0005;

void setup() {
  frameRate(30);
  size(450, 450);
  smooth();
  
  balls = new Ball[numBalls];
  for (int i = 0; i < numBalls; i++) {
    Ball ball = new Ball(2, color(#000000));
    ball.x = random(0, width);
    ball.y = random(0, height);
    ball.vx = random(-3, 3);
    ball.vy = random(-3, 3);
    balls[i] = ball;
  }
}

void draw() {
  background(255);
  
  for (int i = 0; i < numBalls; i++) {
    Ball ball = balls[i];
    ball.x += ball.vx;
    ball.y += ball.vy;
    if (ball.x > width) {
      ball.x = 0;
    } else if (ball.x < 0) {
      ball.x = width;
    }
    if (ball.y > height) {
      ball.y = 0;
    } else if (ball.y < 0) {
      ball.y = height;
    }
  }
  
  for (int i = 0; i < numBalls - 1; i++) {
    Ball partA = balls[i];
    for (int j = i + 1; j < numBalls; j++) {
      Ball partB = balls[j];
      spring(partA, partB);
    }
  }
  
  for (int i = 0; i < numBalls; i++) {
    balls[i].draw();
  }
}

void spring(Ball partA, Ball partB) {
  float dx = partB.x - partA.x;
  float dy = partB.y - partA.y;
  float dist = sqrt(dx * dx + dy * dy);
  if (dist < minDist) {
    strokeWeight(1);
    stroke(color(#000000, 255 - 255 * (dist / minDist)));
    line(partA.x, partA.y, partB.x, partB.y);
    float ax = dx * springAmount;
    float ay = dy * springAmount;
    partA.vx += ax;
    partA.vy += ay;
    partB.vx -= ax;
    partB.vy -= ay;
  }
}

class Ball {
  float x;
  float y;
  float vx;
  float vy;
  float r;
  color c;
  
  Ball() {
    this.r = 20;
    this.c = color(#000000);
  }
  
  Ball(float r, color c) {
    this.r = r;
    this.c = c;
  }
  
  void draw() {
    fill(c);
    noStroke();
    ellipse(x, y, r * 2, r * 2);
  }
}

