
/// Ball 1
float x = 0;
float y = 0;
float yspeed = 4;
float xspeed = 4;
PImage trollface;
/// Ball 1

void setup() {
  size(1000, 400);
  background(0);
  smooth ();
  noStroke ();
  trollface = loadImage("TrollFace.png");
}

void draw() {
  background (0);
  x = x + xspeed;
  y = y + yspeed;
  image(trollface, x, y);

  if (x > 480) {
    xspeed = -2;
  }

  if (x < -40) {
    xspeed = +2;
  }

  if (y > 25) {
    yspeed = - random(4);
  }

  if (y < -50) {
    yspeed = random(4);
  }
}


