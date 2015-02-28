
/* Marvin Yan
 *Press any key to generate "wind"*/
petals f, l, o, w, e, r, s, a, u, z, n, b, q;
void setup ()
{
  size (640, 480);
  noStroke ();

  f = new petals();
  f.x = 213;
  f.y = 205;
  f.r = 0;
  f.k = random (300);
  f.k1 = random (300);
  f.k2 = random (300);
  f.x_start = f.x;
  f.y_start = f.y;

  l = new petals ();
  l.x = 72;
  l.y= 338;
  l.r = -28;
  l.k = random (300);
  l.k1 = random (300);
  l.k2 = random (300);
  l.x_start = l.x;
  l.y_start = l.y;

  o = new petals ();
  o.x = 275;
  o.y= 28;
  o.r = 55;

  o.k = random (300);
  o.k1 = random (300);
  o.k2 = random (300);
  o.x_start = o.x;
  o.y_start = o.y;

  w = new petals ();
  w.x= 249;
  w.y =-165.5;
  w.r = 28;
  w.x_start = w.x;
  w.y_start = w.y;
  w.k = random (300);
  w.k1 = random (300);
  w.k2 = random (300);

  e= new petals ();
  e.x = 130;
  e.y = -330;
  e.r = 30;
  e.x_start = e.x;
  e.y_start = e.y;
  e.k = random (300);
  e.k1 = random (300);
  e.k2 = random (300);

  r = new petals ();
  r.x= -25;
  r.y= -410;
  r.r = 25;
  r.x_start = r.x;
  r.y_start = r.y;
  r.k = random (300);
  r.k1 = random (300);
  r.k2 = random (300);

  s = new petals ();
  s.x = -230;
  s.y = -408;
  s.r = 28;
  s.x_start = s.x;
  s.k = random (300);
  s.k1 = random (300);
  s.k2 = random (300);
  s.y_start = s.y;

  a = new petals ();
  a.x =-437;
  a.y =-265;
  a.r =35;
  a.x_start = a.x;
  a.y_start = a.y;
  a.k = random (300);
  a.k1 = random (300);
  a.k2 = random (300);

  u = new petals ();
  u.x= -530;
  u.y= 10;
  u.r= 40;
  u.x_start = u.x;
  u.k = random (300);
  u.k1 = random (300);
  u.k2 = random (300);
  u.y_start = u.y;


  z = new petals ();
  z.x=-474;
  z.y=215;
  z.r=30;
  z.x_start = z.x;
  z.y_start = z.y;
  z.k = random (300);
  z.k1 = random (300);
  z.k2 = random (300);

  n = new petals ();
  n.x= -140;
  n.y=385;
  n.r=58;
  n.x_start = n.x;
  n.k = random (300);
  n.k1 = random (300);
  n.k2 = random (300);
  n.y_start = n.y;

  b = new petals ();
  b.x=-340;
  b.y=354;
  b.r=-30;
  b.x_start = b.x;
  b.y_start = b.y;
  b.k = random (300);
  b.k1 = random (300);
  b.k2 = random (300);


  q = new petals ();
  q.x=-210;
  q.y=396;
  q.r=20;
  q.x_start = q.x;
  q.y_start = q.y;
  q.k = random (300);
  q.k1 = random (300);
  q.k2 = random (300);
}

void draw ()
{
  background (0, 255, 0);
  fill (#811414);
  rect (320, 240, 35, 250);
  fill (0);
  ellipse (338, 220, 125, 125);

  f.petapos();
  f.petalshape();
  l.petapos();
  l.petalshape();
  o.petapos();
  o.petalshape();
  w.petapos();
  w.petalshape();
  e.petapos ();
  e.petalshape ();
  r.petapos ();
  r.petalshape ();
  s.petapos();
  s.petalshape();
  a.petapos ();
  a.petalshape ();
  u.petapos ();
  u.petalshape();
  z.petapos ();
  z.petalshape();
  n.petapos ();
  n.petalshape ();
  b.petapos();
  b.petalshape();
  q.petapos ();
  q.petalshape();
}

class petals 
{
  float x;
  float y;
  float x_start;
  float y_start;

  float s;
  float r;
  float k, k1, k2;

  float ease = 90;

  void petalshape()
  {
    rotate (radians (r));
    fill (k, k1, k2);
    shininess (3000.0);
    ellipse (x, y, 200, 40);
  }
  void petapos ()
  {
    x = x*1;
    y = y*1;
    if (keyPressed)
    {
      x = random(500);
      y = random (400);
    }
    else {

      x -= (x-x_start)/ease;
      y -= (y-y_start)/ease;
    }
  }
}


