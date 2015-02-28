
int NUMBER_OF_CIRCLES = 200;
int CIRCLE_RADIUS = 12;
int LIKELINESS_OF_ACCELERATION = 10;
int MAX_ACCELERATION_TIME = 30;
float MAX_ACCELERATION = 0.5;
float MAX_VELOCITY = 4;

Circle[] circle = new Circle[100000];

class Circle {
  float xPosition;
  float yPosition;
  float xVelocity;
  float yVelocity;
  float xAcceleration;
  float yAcceleration;
  int timeLeftAccelerating;
  color colour;

  Circle(int x, int y) {
    xPosition = x;
    yPosition = y;
    xVelocity = 0;
    yVelocity = 0;
    xAcceleration = newAcceleration();
    yAcceleration = newAcceleration();
    colour = color((int)random(256), (int)random(256), (int)random(256));
    timeLeftAccelerating = 0;
  }
}

void setup() {
  size(1000, 600);
  noStroke();
  smooth();
  frameRate(30);

  //create circles array
  for (int i = 0; i < NUMBER_OF_CIRCLES; i++) {
    circle[i] = new Circle(int(random(width)), int(random(height)));
  }
}

void draw() {
  background(255);
  makeCirclesMove();
  drawCircles();
}

void makeCirclesMove() {
  for (int i = 0; i < NUMBER_OF_CIRCLES; i++) {

    if (circle[i].timeLeftAccelerating == 0) {
      circle[i].xAcceleration = 0;
      circle[i].yAcceleration = 0;

      float accelerate = random(LIKELINESS_OF_ACCELERATION);
      if (accelerate < 1) {
        circle[i].xAcceleration = newAcceleration();
        circle[i].yAcceleration = newAcceleration();
        circle[i].timeLeftAccelerating = (int) random(MAX_ACCELERATION_TIME);
      }
    }
    else circle[i].timeLeftAccelerating--;
    
    float newXVelocity = circle[i].xVelocity + circle[i].xAcceleration;
    float newYVelocity = circle[i].yVelocity + circle[i].yAcceleration;
    
    if (abs(newXVelocity) < MAX_VELOCITY ||
      (newXVelocity > MAX_VELOCITY && circle[i].xAcceleration < 0) ||
      (newXVelocity < -MAX_VELOCITY && circle[i].xAcceleration > 0))
      circle[i].xVelocity = newXVelocity;
    else circle[i].xAcceleration *= -1;

    if (abs(newYVelocity) < MAX_VELOCITY ||
      (newYVelocity > MAX_VELOCITY && circle[i].yAcceleration < 0) ||
      (newYVelocity < -MAX_VELOCITY && circle[i].yAcceleration > 0))
      circle[i].yVelocity = newYVelocity;
    else circle[i].yAcceleration *= -1;

    circle[i].xPosition += circle[i].xVelocity;
    circle[i].yPosition += circle[i].yVelocity;

    if (circle[i].xPosition < -CIRCLE_RADIUS)
      circle[i].xPosition += width + CIRCLE_RADIUS*2;
    else if (circle[i].xPosition > width + CIRCLE_RADIUS)
      circle[i].xPosition -= width + CIRCLE_RADIUS*2;
    if (circle[i].yPosition < -CIRCLE_RADIUS)
      circle[i].yPosition += height + CIRCLE_RADIUS*2;
    else if (circle[i].yPosition > height + CIRCLE_RADIUS)
      circle[i].yPosition -= height + CIRCLE_RADIUS*2;
  }
}

void drawCircles() {
  for (int i = 0; i < NUMBER_OF_CIRCLES; i++) {
    fill(circle[i].colour);
    ellipse(circle[i].xPosition, circle[i].yPosition, CIRCLE_RADIUS, CIRCLE_RADIUS);
  }
}

float newAcceleration() {
  return random(MAX_ACCELERATION*2) - MAX_ACCELERATION;
}
