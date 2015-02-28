
int numBalls = 200;
float spring = 0.05;
float gravity = 0.09;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];

void setup() {
  size(600, 600);
  noStroke();
  smooth();
  ellipseMode(BOTTOM);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(10, 40), i, balls, 255);
  }
}

void draw() 
{
  background(0);
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();  
    balls[i].sizechange();
  }
}

