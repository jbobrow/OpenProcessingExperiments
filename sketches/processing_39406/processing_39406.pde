
//Click the LEFT arrow to change to a circle or click the
//Right arrow to change to a Square.
//Click the LEFT mouse button to change the colors randomly.
//Click anyoen mouse button to stop the change in color.
//Click any key to stop all actions.


Different a, b, c, d, e, f, g, h, i, j, k, l;
void setup()
{
  size(500, 500);
  smooth();
  noStroke();

  a = new Different();
  a.x=200;
  a.y=300;
  a.r=75;
  a.rd=random(0, 255);
  a.gr=random(0, 255);
  a.bl=random(0, 255);

  b = new Different();
  b.x=300;
  b.y=200;
  b.r=75;
  b.rd=random(0, 255);
  b.gr=random(0, 255);
  b.bl=random(0, 255);

  c = new Different();
  c.x=400;
  c.y=100;
  c.r=65;
  c.rd=random(0, 255);
  c.gr=random(0, 255);
  c.bl=random(0, 255);

  d = new Different();
  d.x=100;
  d.y=400;
  d.r=65;
  d.rd=random(0, 255);
  d.gr=random(0, 255);
  d.bl=random(0, 255);

  e = new Different();
  e.x=0;
  e.y=0;
  e.r=35;
  e.rd=random(0, 255);
  e.gr=random(0, 255);
  e.bl=random(0, 255);

  f = new Different();
  f.x=0;
  f.y=500;
  f.r=35;
  f.rd=random(0, 255);
  f.gr=random(0, 255);
  f.bl=random(0, 255);

  g = new Different();
  g.x=100;
  g.y=100;
  g.r=65;
  g.rd=random(0, 255);
  g.gr=random(0, 255);
  g.bl=random(0, 255);

  h = new Different();
  h.x=400;
  h.y=400;
  h.r=65;
  h.rd=random(0, 255);
  h.gr=random(0, 255);
  h.bl=random(0, 255);

  i = new Different();
  i.x=500;
  i.y=500;
  i.r=35;
  i.rd=random(0, 255);
  i.gr=random(0, 255);
  i.bl=random(0, 255);

  j = new Different();
  j.x=500;
  j.y=0;
  j.r=35;
  j.rd=random(0, 255);
  j.gr=random(0, 255);
  j.bl=random(0, 255);

  k = new Different();
  k.x=300;
  k.y=300;
  k.r=75;
  k.rd=random(0, 255);
  k.gr=random(0, 255);
  k.bl=random(0, 255);

  l = new Different();
  l.x=200;
  l.y=200;
  l.r=75;
  l.rd=random(0, 255);
  l.gr=random(0, 255);
  l.bl=random(0, 255);
}
void draw() 
{
  background(0);
  a.show();
  b.show();
  c.show();
  d.show();
  e.show();
  f.show();
  g.show();
  h.show();
  i.show();
  j.show();
  k.show();
  l.show();
}
class Different
{
  float rd, gr, bl;
  int x, y, r;
  void show()
  {
    if (keyCode == RIGHT) 
    {
      fill(rd, gr, bl);
      ellipse(x, y, r, r);
    }
    if (keyCode == LEFT)
    {
      fill(rd, gr, bl);
      rect(x-25, y-25, r, r);
    }
    if (mouseButton == LEFT)
    {
      fill(rd=random(0, 255), gr=random(0, 255), bl=random(0, 255));
    }
  }
}


