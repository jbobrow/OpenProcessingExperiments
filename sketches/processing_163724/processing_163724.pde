
float y = 20.0;

void setup () {
  size (300, 300);
  smooth ();
  background (#D7F0B8);
}

void draw () {
  frameRate (4);
  background (#D7F0B8);
  noStroke ();
  fill (#ABF54D);
  y = y +10;
  ellipse (y, y, y, y);
}



