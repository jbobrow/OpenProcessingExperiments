
float size;
float r;
float b;
float g;
float x;
float y;

void setup(){
  size (500, 500);
  background (0);
  noStroke();
  smooth ();
  frameRate (5);
}

void draw (){
  size = random (100);
  x = random (500);
  y = random (500);
  r = random (100);
  g = random (100);
  b = random (100);
  fill (r, g, b, 100);
  ellipse (x, y, size, size);
}
