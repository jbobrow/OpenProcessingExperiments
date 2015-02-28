

PImage rr;
float i = 1;

void setup () {
  size (371,600);
  ellipseMode (CENTER);
  smooth ();
  rr = loadImage ("ronnie.jpg");
  image (rr, 0, 0);
  frameRate (20);
}

void draw () {
  translate (93,243);
  stroke (255,0,0,128);
  noFill ();
  hypno (i);
  pushMatrix ();
  translate (123,3);
  hypno (i);
  popMatrix ();
  i = i*1.414;
  if (i>1200) {
    i = 1;
  }
  tint (255,20);
  rr = loadImage ("ronnie.jpg");
  image (rr, -93, -243);
}

void hypno (float diameter) {
  strokeWeight (3);
  ellipse (random(-5,5), random(-5,5), diameter, diameter);
}

