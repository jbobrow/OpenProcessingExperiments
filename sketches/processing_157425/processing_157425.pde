
// Doodle 2
// Levente Sandor, 2014

float x = 0, y = 0, a = 0;
int i0 = 0, i = 0;
color c0 = color(0), c = color(0), clr = color(0);
boolean p = true;


void setup() {
  size(300, 300);
  background(255);
}

void draw() {
  a += random(-0.1, 0.1);
  x = (x + cos(a) + width) % width;
  y = (y + sin(a) + height) % height;
  i = int(x) + int(y) * width;
  if (i != i0) {
    loadPixels();
    c = pixels[i];
    if (c == clr && c0 != clr) {
      p = !p;
    }
    if (p) {
      pixels[i] = clr;
    }
    c0 = c;
    updatePixels();
  }
  i0 = i;
}
