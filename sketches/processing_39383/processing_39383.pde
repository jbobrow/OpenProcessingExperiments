
/*
*Press SPACEBAR to change color.
*/

cycle a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
  float s1 = random(225);
  float s2 = random(225);
  float s3 = random(225);

void setup()
{
  size (500, 500); 
  smooth();
  stroke(s1, s2, s3);
  strokeWeight(5);

  a = new cycle();
  a.r = 50;
  a.s = 50;

  b = new cycle();
  b.r = 150;
  b.s = 150 ;

  c = new cycle();
  c.r = 250;
  c.s = 250;

  d = new cycle();
  d.r = 350;
  d.s = 350;

  e = new cycle();
  e.r = 450;
  e.s = 450;

  f = new cycle();
  f.r = 550;
  f.s = 550;

  g = new cycle();
  g.r = 650;
  g.s = 650;

  h = new cycle();
  h.r = 750;
  h.s = 750;

  i = new cycle();
  i.r = 850;
  i.s = 850;

  j = new cycle();
  j.r = 950;
  j.s = 950;

  k = new cycle();
  k.r = 1050;
  k.s = 1050;

  l = new cycle();
  l.r = 1150;
  l.s = 1150;

  m = new cycle();
  m.r = 1250;
  m.s = 1250;

  n = new cycle();
  n.r = 1350;
  n.s = 1350;

  o = new cycle();
  o.r = 1450;
  o.s = 1450;

  p = new cycle();
  p.r = 1550;
  p.s = 1550;

  //a.x = b.x = c.x = d.x = e.x = f.x = g.x = h.x = i.x = j.x =250;
  //a.y = b.y = c.y = d.y = e.y = f.y = g.y = h.y = i.y = j.y = 250;
}

void draw()
{
  a.display2();
  b.display();
  c.display();
  d.display();
  e.display();
  f.display();
  g.display();
  h.display();

}

class cycle
{
  int x=250, y=250;
  int r;
  int s;
  int speed;
  int dir = -1;
  

  void display()
  {
    fill (0, 12);
    stroke(s1, s2, s3);
    ellipse (x, y, r, r); 

    r = r + dir;

    //println (dir);

    if (r < 0)
    {
      dir = dir * -1;
    }

    if (r > 750) 
    {
    dir = dir * -1;
    r = s;
  
    }
  }


  void display2()
  {
    fill (0, 12);
    stroke(random(225),random(225), random(225));
    ellipse (x, y, r, r); 

    r = r + dir;

    //println (dir);

    if (r < 0)
    {
      dir = dir * -1;
    }

    if (r > 750) 
    {
    dir = dir * -1;
    r = s;
  
    }
  }
}

void keyPressed()
{

 if (key == ' ')
      {
        s1 = random(225);
        s2 = random(225);
        s3 = random(225);
        background (0);

      } 

}

