
/* @pjs preload="window.jpg";*/
/* @pjs preload="first.png";*/
/* @pjs preload="second.png";*/
/* @pjs preload="third.png";*/

PImage img;
PImage f;
PImage s;
PImage t;

float[] a;

void setup() {
  size(500,313);
  stroke(50, 50, 250);
  fill(150, 150, 250);
  frameRate(100);
  img = loadImage("window.jpg");
  f = loadImage("first.png");
  s = loadImage("second.png");
  t = loadImage("third.png");
  a = new float[3];
}

void draw() {
image(img,0,0);
  int i = 0;
  while ( i <= 2 ) {
    image(f,i*(500/3),a[i]);
image(s,i*(500/3),a[i]);
image(t,i*(500/3),a[i]);
    if (mouseX>i*(500/3)&&mouseX<i*(500/3)+(500/3)) {
      a[i] = a[i] + random(0, 10);
    }
    i = i + 1;
  }
}



