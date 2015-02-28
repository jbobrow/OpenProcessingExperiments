
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j; // stars
PImage k;
PImage l;
PImage m;
PImage n;
PImage o;
PImage p;


void setup() {
  size(600, 300);
  smooth();
  a = loadImage("1.png");
  b = loadImage("2.png");
  c = loadImage("3.png");
  d = loadImage("4.png");
  e = loadImage("5.png");
  f = loadImage("6.png");
  g = loadImage("7.png");
  h = loadImage("8.png");
  i = loadImage("spaceshuttle2.png");
  j = loadImage("9.png");
  k = loadImage("10.png");
  l = loadImage("11.png");
  m = loadImage("12.png");
  n = loadImage("13.png");
  o = loadImage("14.png");
  p = loadImage("15.png");
  
  frameRate(1);
  imageMode(CENTER);
}
 
void draw() {
  background(255);
  float xa = random(width); //pencil
  float xb = random(width);
  float xc = random(width);
  float xd = random(width);
  float xe = random(width);
  float xf = random(width);
  float xg = random(width);
  float xh = random(width);

  float xj = random(width); //star
  float xk = random(width);
  float xl = random(width);
  float xm = random(width);
  float xn = random(width);
  float xo = random(width);
  float xp = random(width);
  
  float ya = random(height); //pencil
  float yb = random(height);
  float yc = random(height);
  float yd = random(height);
  float ye = random(height);
  float yf = random(height);
  float yg = random(height);
  float yh = random(height);

  float yj = random(height); //star
  float yk = random(height);
  float yl = random(height);
  float ym = random(height);
  float yn = random(height);
  float yo = random(height);
  float yp = random(height);
  
  float shuttlesize = random(20, 60);
  float shuttle_y = random(150, 250);
  float starsize = random(40, 150);
  
  image(j, xj, yj, starsize, starsize);
  image(k, xk, yk, starsize, starsize);
  image(l, xl, yl, starsize, starsize);
  image(m, xm, ym, starsize, starsize);
  image(n, xn, yn, starsize, starsize);
  image(o, xo, yo, starsize, starsize);
  image(p, xp, yp, starsize, starsize);
  
  image(a, xa, ya);
  image(b, xb, yb);
  image(c, xc, yc);
  image(d, xd, yd);
  image(i, 300, shuttle_y, shuttlesize, shuttlesize *2.9666);
  image(e, xe, ye);
  image(f, xf, yf);
  image(g, xg, yg);
  image(h, xh, yh);
  
}

