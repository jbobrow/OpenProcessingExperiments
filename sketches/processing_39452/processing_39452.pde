
Circle a,l,k,o,i,s,g,j,m,n;
boolean z, w;

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    w = true;
    z = false;
  }
  
  if (mouseButton == RIGHT)
  {
    w = true;
    z = false;
  }
}

void setup()
{
  size(1024,768);
  noStroke();
  smooth();
  
  a = new Circle();
  a.e = 100;
  a.u = 10;
  
  l = new Circle();
  l.e = 100;
  l.u = 10;
  
  k = new Circle();
  k.e = 100;
  k.u = 10;
  
  o = new Circle();
  o.e = 100;
  k.u = 10;
  
  i = new Circle();
  i.e = 100;
  i.u = 10;
  
  s = new Circle();
  s.e = 100;
  s.u = 10;
  
  g = new Circle();
  g.e = 100;
  g.u = 10;
  
  j = new Circle();
  j.e = 100;
  j.u = 10;
  
  m = new Circle();
  m.e = 100;
  m.u = 10;
  
  n = new Circle();
  n.e = 100;
  n.u = 10;
  
  a.x = (100);
  a.y = (800);
  
  l.x = (300);
  l.y = (800);
  
  k.x = (500);
  k.y = (800);
  
  o.x = (700);
  o.y = (800);
  
  i.x = (900);
  i.y = (800);
  
  s.x = (100);
  s.y = (-100);
  
  g.x = (300);
  g.y = (-200);
  
  j.x = (500);
  j.y = (-300);
  
  m.x = (700);
  m.y = (-400);
  
  n.x = (900);
  n.y = (-500);
   
}
void draw()
{
  background(255,255,0);
  if ( a.y > 1600 ) a.y = -600;
  if ( l.y > 1600 ) l.y = -600;
  if ( k.y > 1600 ) k.y = -600;
  if ( o.y > 1600 ) o.y = -600;
  if ( i.y > 1600 ) i.y = -600;
  if ( s.y > 1600 ) s.y = -600;
  if ( g.y > 1600 ) g.y = -600;
  if ( j.y > 1600 ) j.y = -600;
  if ( m.y > 1600 ) m.y = -600;
  if ( n.y > 1600 ) n.y = -600;
  if ( a.y < -600 ) a.y = 1600;
  if ( l.y < -600 ) a.y = 1600;
  if ( k.y < -600 ) a.y = 1600;
  if ( o.y < -600 ) a.y = 1600;
  if ( i.y < -600 ) a.y = 1600;
  if ( g.y < -600 ) a.y = 1600;
  if ( j.y < -600 ) a.y = 1600;
  if ( m.y < -600 ) a.y = 1600;
  if ( n.y < -600 ) a.y = 1600;
  if ( s.y < -600 ) a.y = 1600;
  a.change();
  l.change();
  k.change();
  o.change();
  i.change();
  s.change();
  g.change();
  j.change();
  m.change();
  n.change();
  a.move();
  l.move();
  k.move();
  o.move();
  i.move();
  s.move();
  g.move();
  j.move();
  m.move();
  n.move();
}

void keyPressed ()
{
  if (key == 'a');
{
  a.t = random(0,255);
  l.t = random(0,255);
  k.t = random(0,255);
  o.t = random(0,255);
  i.t = random(0,255);
  s.t = random(0,255);
  g.t = random(0,255);
  j.t = random(0,255);
  m.t = random(0,255);
  n.t = random(0,255);
}
}

class Circle
{
  float x, y, f, t;
  int e,u;
  void change()
  {
    fill(t);
    ellipse(x, y , e, e);
  }
  void move()
  {
    y = y + 4;
  }
}


