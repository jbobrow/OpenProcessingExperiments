
/// Composite version of individually made Picasso tiles, by the students in
/// Parsons MFADT Bootcamp Green Section

/// Original painting is "Seated Woman with Wrist Watch" by Picasso

PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;
PImage k;
PImage l;
PImage m;
PImage n;

void setup(){
  size(500,680);
  a = loadImage("01.jpg");
  b = loadImage("02.jpg");
  c = loadImage("03.jpg");
  d = loadImage("04.jpg");
  e = loadImage("05.jpg");
  f = loadImage("06.jpg");
  g = loadImage("07.jpg");
  h = loadImage("08.jpg");
  i = loadImage("09.jpg");
  j = loadImage("10.jpg");
  k = loadImage("11.jpg");
  l = loadImage("12.jpg");
  m = loadImage("13.jpg");
  n = loadImage("14.jpg");
}

void draw(){
  image(a,0,0);
  image(b,294,0);
  image(c,0,105);
  image(d,235,105);
  image(e,393,105);
  image(f,0,210);
  image(g,235,235);
  image(h,316,235);
  image(i,0,357);
  image(j,214,357);
  image(k,298,357);
  image(l,393,357);
  image(m,0,525);
  image(n,298,561);
}
  

