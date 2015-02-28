
//use arrow keys



rectangles a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;

void setup ()
{
  size(600, 600);
  smooth();
  a = new rectangles();
  a.xp = 300;
  a.yp = 300;
  a.sp = random(3, 10);
  a.s = 40;

  b = new rectangles();
  b.xp = 200;
  b.yp = 200;
  b.sp =random(3, 10);
  b.s = 50;

  c = new rectangles();
  c.xp = 340;
  c.yp = 220;
  c.sp = random(3, 10);
  c.s = 80;

  d = new rectangles();
  d.xp = 200;
  d.yp = 500;
  d.sp = random(3, 10);
  d.s = 90;

  e = new rectangles();
  e.xp = 300;
  e.yp = 200;
  e.sp = random(3, 10);
  e.s = 30;

  f = new rectangles();
  f.xp = 400;
  f.yp = 150;
  f.sp = random(3, 10);
  f.s = 60;

  g = new rectangles();
  g.xp = 100;
  g.yp = 300;
  g.sp = random(3, 10);
  g.s = 50;

  h = new rectangles();
  h.xp = 455;
  h.yp = 555;
  h.sp = random(3, 10);
  h.s = 60;

  i = new rectangles();
  i.xp = 400;
  i.yp = 400;
  i.sp = random(3, 10);
  i.s = 60;

  j = new rectangles();
  j.xp = 249;
  j.yp = 70;
  j.sp = random(3, 10);
  j.s = 100;

  k = new rectangles();
  k.xp = 250;
  k.yp = 150;
  k.sp = random(3, 10);
  k.s = 35;

  l = new rectangles();
  l.xp = 200;
  l.yp = 420;
  l.sp = random(3, 10);
  l.s = 64;

  m = new rectangles();
  m.xp = 500;
  m.yp = 30;
  m.sp = random(3, 10);
  m.s = 50;

  n = new rectangles();
  n.xp = 110;
  n.yp = 110;
  n.sp = random(3, 10);
  n.s = 80;

  o = new rectangles();
  o.xp = 70;
  o.yp = 530;
  o.sp = random(3, 10);
  o.s = 100;

  p = new rectangles();
  p.xp = 45;
  p.yp = 240;
  p.sp = random(3, 10);
  p.s = 35;
}



void draw()
{
  fill(0, 12);
  rect(-50, -50, 700, 700);
  smooth();

  a.keyPressed();

  b.keyPressed();

  c.keyPressed();

  d.keyPressed();

  e.keyPressed();

  f.keyPressed();

  g.keyPressed();

  h.keyPressed();

  i.keyPressed();

  j.keyPressed();

  k.keyPressed();

  l.keyPressed();

  m.keyPressed();

  n.keyPressed();

  o.keyPressed();

  p.keyPressed();
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
  m.show();
  n.show();
  o.show();
  p.show();

  print (mouseX);
  print (",");
  println (mouseY);
}



class rectangles
{
  float xp;//x position
  float yp;//y position
  float sp;//speed
  float s;//size

  boolean uu = false;
  boolean dd = false;
  boolean ll = false;
  boolean rr = false;

  void show()
  {
    stroke(255);
    strokeWeight(15);
    fill(0);
    rect (xp, yp, s, s);
    if (xp > 680) xp = -80;

    if (yp > 680) yp = -80;

    if (xp < -80) xp = 680;

    if (yp < -80)yp = 680;
  }

  void keyPressed()
  {
    if (key == CODED)
    {
      if (keyCode == UP)
      {
        yp = yp-sp;
      }
      if (keyCode == DOWN)
      {
        yp = yp+sp;
      }
      if (keyCode == LEFT)
      {
        xp = xp-sp;
      }
      if (keyCode == RIGHT)
      {
        xp = xp+sp;
      }
    }
  }
  
}


