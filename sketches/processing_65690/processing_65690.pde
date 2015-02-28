
// Example 07-03 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

int radius = 40;
float y = -radius;
float speed = 50;

PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i; //shuttle
PImage j; // star
PImage k;
PImage l;
PImage m;
PImage n;
PImage o;
PImage p;
PImage q; //paper

void setup() {
  size(600, 300);
  smooth();
  ellipseMode(RADIUS);
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
  q = loadImage("paper.jpg");
      
  frameRate(5);
  imageMode(CENTER);
}

void draw() {
  background(255);
  image(q, 0, 0);
  y = y + speed;  // Increase the value of x
  if(y>300) {
    y = 0;
  }
  float shuttlesize = random(20, 60);
  float shuttle_y = random(150, 250);
  float starsize = random(40, 150);
  
  float xj = random(width); //star
  float xk = random(width);
  float xl = random(width);
  float xm = random(width);
  float xn = random(width);
  float xo = random(width);
  float xp = random(width);
  
  float xa = random(width); //pencil
  float xb = random(width);
  float xc = random(width);
  float xd = random(width);
  float xe = random(width);
  float xf = random(width);
  float xg = random(width);
  float xh = random(width);
  
  image(j, xj, y/2, starsize, starsize);
  image(k, xk, y/2 + 20, starsize, starsize);
  image(l, xl, y/2 + 25, starsize, starsize);
  image(m, xm, y/2 + 30, starsize, starsize);
  image(n, xn, y/2 + 35, starsize, starsize);
  image(o, xo, y/2 + 40, starsize, starsize);
  image(p, xp, y/2 + 45, starsize, starsize);
  
  image(a, xa, y * 3);
  image(b, xb, y * 3 + 20);
  image(c, xc, y * 3 + 70);
  image(d, xd, y * 3 + 120);
  image(i, 300, shuttle_y, shuttlesize, shuttlesize *2.9666);
  image(e, xe, y * 3 + 170);
  image(f, xf, y * 3 + 220);
  image(g, xg, y * 3 + 270);
  image(h, xh, y * 3 + 320);
}


