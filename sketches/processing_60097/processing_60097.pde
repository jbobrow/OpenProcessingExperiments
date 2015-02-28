
//scheint nur in PROCESSING richtig zu funktionieren...

void setup () {
size(420, 420);
smooth();
background (0);
noStroke();
ellipseMode(CORNER);
}

int a = 20;
int b = 20;
int c = 20;
int d = 1000;
color white = color(255);
color red = color(255, 0, 0);

void draw () {


  if (a < width-c) {
  ellipse(a, b, c, c);
  delay(d);
  a = a + c * 2;
  }
  if (a >= width-c) {
  a = 20;
  b = b + c * 2;
  }
  if (b >= height) {
    background(0);
    b = 20;
  }
  if (mousePressed) {
    fill(red);
    d = 40;
  }
  else {
    fill(white);
    d = 500;
  }
}

