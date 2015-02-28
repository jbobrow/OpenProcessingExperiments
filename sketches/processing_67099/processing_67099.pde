


float circleX = 100;
float circleY = 50;

float xVel;
float yVel;

float gravity = .3;

void setup() {
  size(500, 500);
  smooth(); 
  background(100);

  circleX = width/4;
  circleY = height/4;
  
  xVel = 4;
  yVel = 5;
}

void draw() {
  fill(random(255));
  noStroke();
  ellipse(circleX, circleY, random(30), random(50));

  yVel = yVel + gravity;

  circleY = circleY + yVel;
  circleX = circleX + xVel;

  if (circleX >= 480 || circleX <= 20) {
    xVel = xVel*-1;
  }

  if (circleY >= 480 || circleY <= 20) {
    yVel = yVel*-1;
    xVel = xVel*.85;
  }
  
  if (circleY >= 550) {
  circleY = 480;
  
  }
  
}

