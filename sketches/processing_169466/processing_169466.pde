
int y = 450;
int x = 450;
int v = 0;
int w = 0;
int r = 0;
int g = 0;
int b = 0;

void setup() {
size (900, 900); // set dimensions window
}

void draw() {
  background (0, 0, 0);
  noStroke();
  y=y-1;
  x=x-1;
  v=v+1;
  w=w+1;
  r=r+1;
  g=g+3;
  b=b+5;
  if (y<0) {
  y = height;
  }
  if (x<0) {
  x = width;
  }
  if (v>900) {
  v = 0;
  }
  if (w>900) {
  w = 0;
  }
  if (r>255) {
  r = 0;
  }
  if (g>255) {
  g = 0;
  }
  if (b>255) {
  b = 0;
  }
  // begin hier met tekenen
  fill(r, g, b);
  cirkelmetxeny(x, y);
  fill(b, r, g);
  cirkelmetxeny(v, w);
  fill(g, b, r);
  cirkelmetxeny(x-200, y-200);
  fill(0, 0, 0);
  ellipse(mouseX, mouseY, 100, 100);
}

void cirkelmetxeny (int x, int y) {
 ellipse(x, y, 50, 50);
}


