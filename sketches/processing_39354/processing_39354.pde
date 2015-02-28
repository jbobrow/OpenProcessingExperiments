
//Delwin Lei
//Right click for RIGHT Left click for LEFT

bridge a, b, c, d, e, g, h;
//ball m;
boolean q, w;

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    q=true;
    w = false;
  }
  if (mouseButton == RIGHT)
  {
    w= true;
    q = false;
  }
}

/*void mouseReleased()
{
  w=false;
}*/





void setup()
{
  size(400, 200, P3D);
  smooth();
  noStroke();


  a = new bridge();
  a.v = #9A02AF;
  b = new bridge();
  b.v = #A91EF5;
  c = new bridge();
  c.v = #1402EA;
  d = new bridge();
  d.v = #14B43A;
  e = new bridge();
  e.v = #F2EB0C;
  g = new bridge();
  g.v = #F29A0C;
  h = new bridge();
  h.v = #F20C0C;

  a.x = 0;
  b.x = 55;
  c.x = 110;
  d.x = 165;
  e.x = 220;
  g.x = 275;
  h.x = 330;
  a.y = 75;
  b.y = 75;
  c.y = 75;
  d.y = 75;
  e.y = 75;
  g.y = 75;
  h.y = 75;
  
 // m = new ball();
  //m.v = fill(126,255,45);
}

void draw()
{
  if ( a.x > 400)a.x = 0;
  if ( b.x > 400)b.x = 0;
  if ( c.x > 400)c.x = 0;
  if ( d.x > 400)d.x = 0;
  if ( e.x > 400)e.x = 0;
  if ( g.x > 400)g.x = 0;
  if ( h.x > 400)h.x = 0;
  if ( a.x < 0)a.x = 0;
  if ( b.x < 0)b.x = 400;
  if ( c.x < 0)c.x = 400;
  if ( d.x < 0)d.x = 400;
  if ( e.x < 0)e.x = 400;
  if ( g.x < 0)g.x = 400;
  if ( h.x < 0)h.x = 400;
  a.move();
  b.move();
  c.move();
  d.move();
  e.move();
  g.move();
  h.move();
  a.show();
  b.show();
  c.show();
  d.show();
  e.show();
  g.show();
  h.show();
  //m.show();
}

class bridge
{
  int v, x;
  float opacity, y;


  void show()
  {
    fill(v, 10);
    rect(x, y, 60, 60);

    //rotateX (mouseX-300);
    //rotateY (0.1);
  }
  void move()
  {
    if (q)
    {
      x = x-1;
    }
    if (w)
    {
      x = x+2;
    }
  }
}

/*class ball
{
  int v,x,y;
 void show()
 {
   ellipse (x + (random(1,10)), y +(random(1,10)), 20 ,20);
 }
}
*/

