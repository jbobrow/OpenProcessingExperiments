
int movement;
int yball;

void setup () {
  background (255);
  size (500, 500);
  noFill ();
  smooth ();
  noStroke ();
  frameRate (60);
  movement = 10;
  yball = 10;
}

void draw () {
  background (255);
  fill (255, 0, 255);
  ellipse (width/2, yball, 200, 80);

  yball += movement;

  if (yball > 500 || yball < 0) {
    movement *= -1;
 }
}


