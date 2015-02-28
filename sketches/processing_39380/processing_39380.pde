
/*
 *    Ryan Ancheta
 *    PRESS THE SPACE BAR!!!!!
 */



Head a,b,c,d,Leye,Reye;
Body z,y,x,w,v;
void setup()
{
  size(900, 600);
  smooth();

//****** main BLACK man *******
  z = new Body();
  z.l = 200;
  z.w = 100;
  z.s = 5;
  z.colors = (#E103FF);
  w = new Body();
  w.l = 80;
  w.w = 30;
  w.s = 5;
  w.colors = (#E103FF);
  a = new Head();
  a.r = 150;
  a.v = 5;
  a.colors = (#983F03);
  d = new Head();
  d.r = 250;
  d.v = 5;
  d.colors = (#000000);
  Leye = new Head();
  Leye.r = 30;
  Leye.v = 5;
  Reye = new Head();
  Reye.r = 30;
  Reye.v = 5;

  // thing 1
  y = new Body();
  y.l = 100;
  y.w = 50;
  y.s = 3;
  v = new Body();
  v.l = 40;
  v.w = 20;
  v.s = 3;
  b = new Head();
  b.r = 75;
  b.v = 3;
  // thing 2
  x = new Body();
  x.l = 100;
  x.w = 50;
  x.s = 3;
  c = new Head();
  c.r = 75;
  c.v = 3;
  
// ********************************************************  
  // main man
  z.x = width/2 +100;
  z.y = height/2;
  w.x = width/2 +80;
  w.y = height/2 +60;
  a.x = width/2 +150;
  a.y = height/2;
  d.x = width/2 +150;
  d.y = height/2 - 40;
  Leye.x = width/2 +130;
  Leye.y = height/2-15;
  Reye.x = width/2 +170;
  Reye.y = height/2-15;


  // thing 1
  y.x = width/2 -150;
  y.y = height/2;
  v.x = width/2 -155;
  v.y = height/2+30;
  b.x = width/2-125;
  b.y = height/2;
  
  // thing 2
  x.x = width/2 +170;
  x.y = height/2;
  c.x = width/2 +195;
  c.y = height/2;

}

void draw()
{
  background(0);
    if (keyPressed) 
  {
    if (key == ' ' || key == ' ') 
    {
      background(random(255),random(255),random(255));
    }
  }
  // thing 1
  y.move();
  b.move();
  v.move();
  y.show();
  b.show();
  v.show();
  
  //thing 2
  x.move();
  c.move();
  x.show();
  c.show();
  
  // main man
  d.move();
  z.move();
  w.move();
  a.move();
  Leye.move();
  Reye.move();
  d.show();
  z.show();
  w.show();
  a.show();
  Leye.show();
  Reye.show();
}

class Head
{
  float x, y;
  int r; // size (r for radius)
  int v; // velocity
  int colors;

  void show()
  {
    fill (colors);
    ellipse(x, y, r, r);
  }


  void move()
  {
    x += ( mouseX - width/2) * 0.005 * v;
    y += ( mouseY - height/2) * 0.005 * v;
  }
}
class Body
{
  float x, y; 
  int l; // length
  int w; // width
  int s; // speed
  int colors;

  void show()
  {
    fill (colors);
    rect (x, y, w, l);
  }
  void move()
  {
    x += ( mouseX - width/2) * 0.005 * s;
    y += ( mouseY - height/2) * 0.005 * s;
  }
}


