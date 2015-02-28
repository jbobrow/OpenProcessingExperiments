

float i = 1;

void setup () {
  size (900,400);
  background (255);
  ellipseMode (CENTER);
  smooth ();
  frameRate(3600);
}

void draw () {
  pushMatrix ();
  translate (450,0);
  circles (i,i);
  pushMatrix ();
  translate (0,400);
  circles (i,i);
  popMatrix ();
  popMatrix ();
  i = i*1.414;
  if (i>900) {
    i = 1;
  }
}

void circles (float center, float diameter) {
  strokeWeight (1);
  stroke (0,32);
  noFill ();
  ellipse (center*random(-1,1), center*random(-1,1), diameter, diameter);
  strokeWeight (.5);
  stroke (255,64);
  ellipse (center*random(-.1,.1), center*random(-1,1), diameter/10, diameter/10);
}

void mouseClicked () {
  setup ();
}

