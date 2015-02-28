
Squares a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, 
t, u, v, w, x, y, z;

boolean up, down, left, right, tab, shift;
float direction;

void keyPressed()
{
      if (keyCode == DOWN)
      {
        down = true;
      }
  
      if (keyCode == UP)
      {
        up = true;
      }
      
      if (keyCode == LEFT)
      {
        left = true;
      }
      
      if (keyCode == RIGHT)
      {
       right = true;
      }
      
      if (keyCode == TAB)
      {
        tab = true;
      }
      
       if (keyCode == SHIFT)
      {
        shift = true;
      }
      
     
      
     
}

void keyReleased()
{
  if (keyCode == DOWN)
      {
        down = false;
      }
  
      if (keyCode == UP)
      {
        up = false;
      }
      
      if (keyCode == LEFT)
      {
        left = false;
      }
      
      if (keyCode == RIGHT)
      {
       right = false;
      }
      
      if (keyCode == TAB)
      {
        tab = false;
      }
      
      if (keyCode == SHIFT)
      {
        shift = false;
      }
}
void setup()
{
  background(0);
  size (600, 600);
  smooth();




  a = new Squares();
  a.s = random(10, 75);
  a.c = random(3, 25);
  a.x = random(600);
  a.y = random(600);
  
  
  b = new Squares();
  b.s = random(10, 75);
  b.c = random(3, 25);
  b.x = random(600);
  b.y = random(600);
  
  c = new Squares();
  c.s = random(10, 75);
  c.c = random(3, 25);
  c.x = random(600);
  c.y = random(600);
  
  d = new Squares();
  d.s = random(10, 75);
  d.c = random(3, 25);
  d.x = random(600);
  d.y = random(600);
  
  e = new Squares();
  e.s = random(10, 75);
  e.c = random(3, 25);
  e.x = random(600);
  e.y = random(600);
  
  f = new Squares();
  f.s = random(10, 75);
  f.c = random(3, 25);
  f.x = random(600);
  f.y = random(600);
  
  
  g = new Squares();
  g.s = random(10, 75);
  g.c = random(3, 25);
  g.x = random(600);
  g.y = random(600);
  
  h = new Squares();
  h.s = random(10, 75);
  h.c = random(3, 25);
  h.x = random(600);
  h.y = random(600);
  
  i = new Squares();
  i.s = random(10, 75);
  i.c = random(3, 25);
  i.x = random(600);
  i.y = random(600);
  
  j = new Squares();
  j.s = random(10, 75);
  j.c = random(3, 25);
  j.x = random(600);
  j.y = random(600);
  
  k = new Squares();
  k.s = random(10, 75);
  k.c = random(3, 25);
  k.x = random(600);
  k.y = random(600);
  
  
  l = new Squares();
  l.s = random(10, 75);
  l.c = random(3, 25);
  l.x = random(600);
  l.y = random(600);
  
  m = new Squares();
  m.s = random(10, 75);
  m.c = random(3, 25);
  m.x = random(600);
  m.y = random(600);
  
  n = new Squares();
  n.s = random(10, 75);
  n.c = random(3, 25);
  n.x = random(600);
  n.y = random(600);
  
  o = new Squares();
  o.s = random(10, 75);
  o.c = random(3, 25);
  o.x = random(600);
  o.y = random(600);
  
  p = new Squares();
  p.s = random(10, 75);
  p.c = random(3, 25);
  p.x = random(600);
  p.y = random(600);
  
  
  q = new Squares();
  q.s = random(10, 75);
  q.c = random(3, 25);
  q.x = random(600);
  q.y = random(600);
  
  r = new Squares();
  r.s = random(10, 75);
  r.c = random(3, 25);
  r.x = random(600);
  r.y = random(600);
  
  s = new Squares();
  s.s = random(10, 75);
  s.c = random(3, 25);
  s.x = random(600);
  s.y = random(600);
  
  t = new Squares();
  t.s = random(10, 75);
  t.c = random(3, 25);
  t.x = random(600);
  t.y = random(600);
  
  u = new Squares();
  u.s = random(10, 75);
  u.c = random(3, 25);
  u.x = random(600);
  u.y = random(600);
  
  v = new Squares();
  v.s = random(10, 75);
  v.c = random(3, 25);
  v.x = random(600);
  v.y = random(600);
  
  w = new Squares();
  w.s = random(10, 75);
  w.c = random(3, 25);
  w.x = random(600);
  w.y = random(600);
  
  x = new Squares();
  x.s = random(10, 75);
  x.c = random(3, 25);
  x.x = random(600);
  x.y = random(600);
  
  y = new Squares();
  y.s = random(10, 75);
  y.c = random(3, 25);
  y.x = random(600);
  y.y = random(600);
  
  z = new Squares();
  z.s = random(10, 75);
  z.c = random(3, 25);
  z.x = random(600);
  z.y = random(600);
}

void draw()
{
  background (0);
  
  direction = random(0,2);
  
  
  
  
  
  a.move();
  a.show();
 
  b.move();
  b.show();
  
  c.move();
  c.show();
  
  d.move();
  d.show();
 
  e.move();
  e.show();
 
  f.move();
  f.show();
  
  g.move();
  g.show();
  
  h.move();
  h.show();
  
  i.move();
  i.show();
 
  j.move();
  j.show();
  
  k.move();
  k.show();
  
  l.move();
  l.show();
  
  m.move();
  m.show();
  
  n.move();
  n.show();
  
  o.move();
  o.show();
  
  p.move();
  p.show();
  
  q.move();
  q.show();
 
  r.move();
  r.show();
 
  s.move();
  s.show();
  
  t.move();
  t.show();
  
  u.move();
  u.show();
  
  v.move();
  v.show();
  
  w.move();
  w.show();
  
  x.move();
  x.show();
  
  y.move();
  y.show();
  
  z.move();
  z.show();
  
  
}



class Squares
{
  float x, y;
  float s;
  float c;


  void show()
  {
    stroke(random(255), random(255), random(255));
    noFill();
    rect(x, y, s, s);
    strokeWeight(c);
  }
  void move()
  {
    if (keyPressed)
    {
      if (down)
      {
        y = y + 5;
      }
  
      if (up)
      {
        y = y - 5;
      }
      
      if (left)
      {
        x = x - 5;
      }
      
      if (right)
      {
       x = x + 5;
      }
      
      if (tab)
      {
        c = c + 1;
      }
      
      if (shift)
      {
        c = c - 1;
      }
      
      
      if (x > 600)
      {
        x = 1;
        y = random(0,600);
      }
      
      if (x < 0)
      {
        x = 600;
        y = random(0,600);
      }
        
      if (y > 600)
      {
        y = 1;
        x = random(0,600);
      }
      
      if (y < 0)
      {
        y = 600;
        x = random(0,600);
        
      }
      
       if (c < 1)
      {
        c = 1;
      }      
      
      
      
      
    }
  }
}


