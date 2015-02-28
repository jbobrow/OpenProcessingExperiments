
Ball ball;
float easing = 0.01;
float speed = 10.0;

void setup() {
  size(640, 480);
  frameRate(30);
  smooth();
  
  // init balls
  ball = new Ball(100, 0, height/2, color(255, 0, 255, 200));
}

void draw() {
  
  background(0);

  // add randomness
  float x = ball.x + speed;

  if ((x > width) || (x < 0)) {
    speed *= -1;
  }
  
  // display ball
  ball.display(x, ball.y);
}

