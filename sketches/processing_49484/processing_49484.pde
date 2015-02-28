
int circleX = 0;
int circleY = 100;

void setup () {
  size (200,200);
}

void draw () {
  smooth ();
  background (155,99,122);
  stroke (0);
  fill(0);
  ellipse (circleX,circleY,50,50);
  
  circleX = circleX + 1;
}

