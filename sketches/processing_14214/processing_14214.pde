
JitterBug jit;
JitterBug bug;
JitterBug a;
JitterBug b;
JitterBug c;
JitterBug d;
JitterBug e;
JitterBug f;
JitterBug g;
JitterBug h;
JitterBug i;
JitterBug j;
JitterBug k;
JitterBug l;
JitterBug m;
JitterBug n;
JitterBug o;
JitterBug p;
JitterBug q;
JitterBug r;
JitterBug s;
JitterBug t;
JitterBug u;
JitterBug v;
JitterBug w;
JitterBug x;

void setup(){
  size(480, 480);
  smooth();

  jit = new JitterBug(width * 0.66, height/2, 10);
  bug = new JitterBug(width * 0.66, height/2, 10);
  a = new JitterBug(width * 0.66, height/2, 10);
  b = new JitterBug(width * 0.66, height/2, 10);
  c = new JitterBug(width * 0.66, height/2, 10);
  d = new JitterBug(width * 0.66, height/2, 10);
  e = new JitterBug(width * 0.66, height/2, 10);
  f = new JitterBug(width * 0.66, height/2, 10);
  g = new JitterBug(width * 0.66, height/2, 10);
  h = new JitterBug(width * 0.66, height/2, 10);
  i = new JitterBug(width * 0.66, height/2, 10);
  j = new JitterBug(width * 0.66, height/2, 10);
  k = new JitterBug(width * 0.66, height/2, 10);
  l = new JitterBug(width * 0.66, height/2, 10);
  m = new JitterBug(width * 0.66, height/2, 10);
  n = new JitterBug(width * 0.66, height/2, 10);
  o = new JitterBug(width * 0.66, height/2, 10);
  p = new JitterBug(width * 0.66, height/2, 10);
  q = new JitterBug(width * 0.66, height/2, 10);
  r = new JitterBug(width * 0.66, height/2, 10);
  s = new JitterBug(width * 0.66, height/2, 10);
  t = new JitterBug(width * 0.66, height/2, 10);
  u = new JitterBug(width * 0.66, height/2, 10);
  v = new JitterBug(width * 0.66, height/2, 10);
  w = new JitterBug(width * 0.66, height/2, 10);
  x = new JitterBug(width * 0.66, height/2, 10);
  
}

void draw(){
  background(205);
  jit.move();
  jit.display();
  bug.move();
  bug.display();
  a.move();
  a.display();
  b.move();
  b.display();
  c.move();
  c.display();
  d.move();
  d.display();
  e.move();
  e.display();
  f.move();
  f.display();
  g.move();
  g.display();
  h.move();
  h.display();
  i.move();
  i.display();
  j.move();
  j.display();
  k.move();
  k.display();
  l.move();
  l.display();
  m.move();
  m.display();
  n.move();
  n.display();
  o.move();
  o.display();
  p.move();
  p.display();
  q.move();
  q.display();
  r.move();
  r.display();
  s.move();
  s.display();
  t.move();
  t.display();
  u.move();
  u.display();
  v.move();
  v.display();
  w.move();
  w.display();
  x.move();
  x.display();
}

