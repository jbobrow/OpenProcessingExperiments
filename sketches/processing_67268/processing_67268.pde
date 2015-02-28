
float circleA;
float circleB;

float circleG;
float circleK;

float xVel;
float yVel;

float aVel;
float bVel;

float gravity;

void setup() {
  size (500, 500);
  smooth ();

  circleA = width/3;
  circleB = height/3;

  circleG = width/5;
  circleK = height/5;

  xVel =10;
  yVel = 2;
  aVel = 7;
  bVel =5;
  gravity = .8;
}

void draw () {


  background (80);
  noStroke ();

  yVel = yVel + gravity;

  bVel = bVel + gravity;

  circleA= circleA +xVel;
  circleB= circleB+yVel;

  circleG = circleG +aVel;
  circleK = circleK +bVel;

  if ((circleA> width) ||( circleA < 0)) {
    xVel = xVel * (-1);
  }

  if ((circleB> height) || (circleB<0)) {
    yVel = yVel * (-.85);
  }

  if (circleB > height) {
    circleB= height;
  }

  if ((circleG> width) || (circleG<0)) {
    aVel = aVel *(-1);
  }

  if ((circleK > height)|| (circleK< 0)) {

    bVel = bVel *(-.95);
  }

  if (circleK > height) {
    circleK = height;
  }

  fill(255, 10, 230, 150);
  ellipse (circleG, circleK, 20, 20);

  fill(90, 70, 150);
  ellipse (circleA, circleB, 100, 100);
}


