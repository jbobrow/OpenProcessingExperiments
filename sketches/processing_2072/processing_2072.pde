
 
  //By Logan Westbury Aged 11

PImage a;  // Declare variable "a" of type PImage
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
PImage o;
PImage p;

int ranX,ranY,intX,intY;

void setup() {
  size(800, 800);
  a = loadImage("invader0056.png");
  b = loadImage("invader0587.png");
  c = loadImage("invader0586.png");
  d = loadImage("invader0605.png");
  e = loadImage("invader0606.png");
  f = loadImage("invader0607.png");
  g = loadImage("invader0608.png");
  h = loadImage("invader0609.png");
  i = loadImage("invader0610.png");
  j = loadImage("invader0611.png");
  k = loadImage("invader0612.png");
  l = loadImage("invader0613.png");
  m = loadImage("invader0614.png");
  n = loadImage("invader0615.png");
  o = loadImage("invader0616.png");
  p = loadImage("invader0617.png");
  loadspaceguys();
}

void draw() {
}
                       
void mousePressed()
{
  e = loadImage("invader0879.png");
  intX = int((random(4)));
  intY = int((random(4)));
  ranX = intX*200;
  ranY = intY*200;
  image(e,ranX,ranY, e.width, e.height);
  //draw();
}

//loop for placing images in specified place.
void loadspaceguys()
{
  image(a, 0, 200, a.width, a.height);
  image(b, 200, 200, b.width, b.height);
  image(c, 400, 200, c.width, c.height);
  image(d, 600, 200 , d.width, d.height);
  image(e, 0, 0 , e.width, e.height);
  image(f, 200, 0 , f.width, f.height);
  image(g, 400, 0 , g.width, g.height);
  image(h, 600, 0 , h.width, h.height);
  image(i, 0, 400 , i.width, i.height);
  image(j, 200, 400, j.width, j.height);
  image(k, 400, 400 , k.width, k.height);
  image(l, 600, 400 , l.width, l.height);
  image(m, 0, 600 , m.width, m.height);
  image(n, 200, 600 , n.width, n.height);
  image(o, 400, 600 , o.width, o.height);
  image(p, 600, 600 , p.width, p.height); 
}



