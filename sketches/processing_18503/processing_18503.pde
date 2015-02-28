
void setup () {
  size (300,300);
  frameRate (32);
  smooth ();
}

int x=50;
void draw () {
  fill(x,0,0);
  ellipse (150,150,x,x);
  x++;
}

