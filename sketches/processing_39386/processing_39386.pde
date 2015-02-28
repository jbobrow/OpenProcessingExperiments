
// Alex Maung

circle a, b, c, d, e;

gc f;

void setup()
{
  size(600,600);
  
  a = new circle();
  a.s = 20;
  a.v = 2;
  a.b = #05F2FC;
  
  b = new circle();
  b.s = 20;
  b.v = 2;
  b.b = #FC0505;
  
  c = new circle();
  c.s = 20;
  c.v = 2;
  c.b = #05F2FC;
  
  d = new circle();
  d.s = 20;
  d.v = 2;
  d.b = #FC0505;
  
  e = new circle();
  e.s = 20;
  e.v = 2;
  e.b = #FC0505;
 
  f = new gc();
  f.q = 70;
  f.m = 4;
  f.o = #5CFF00;   
 
  a.x = width/3;
  a.y = height/2;
  
  b.x = width/10;
  b.y = height/2;
   
  c.x = width/6;
  c.y = height/2; 
 
  d.x = width/4;
  d.y = height/2;

  e.x = width/2.5 ;
  e.y = height/2;

  f.j = width/7;
  f.k = height/2;


}

void draw()
{
  
  noStroke();
  smooth();
  background(#FC9205);
 




  a.move();
 
  b.move();
 
  c.move();

  d.move();
 
  e.move();
  
  f.move();
  
  
  a.show();

  b.show();
  
  c.show();
 
  d.show();
 
  e.show();

  f.show();


}

class circle
{
  float x, y;
  int s;
  int v; 
  int b,g,re;
  
  void show()
  {
    fill (b);
    ellipse(x,y, s,s);
  }
  
  void move()
  {
    x+= ( mouseX - width/2  ) * 0.002 * v;
  }
}

class gc
{
  float j,k;
  int q;
  int m;
  int o;
void show()
 {
   fill (o);
   ellipse (j,k,q,q);
 }
  
   void move()
  {
    j+= ( mouseX - width/2  ) * 0.002 * m;
    k+= ( mouseY - width/2  ) * 0.002 * m;
  }
  
  
}

