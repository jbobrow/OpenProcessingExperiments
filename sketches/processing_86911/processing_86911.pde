

corra[] w;
pluja[] k;
 
void setup()
{
  noCursor();
  size(300,530);
  smooth();
 
  k = new pluja[3000];
  for (int e=0; e<3000; e++)
  {
    k[e] = new pluja();
    k[e].x = random(0,300);
    k[e].y = random(0,470);
    k[e].d = (int)random(10, 90);
    k[e].v = (int)random(1, 10);
  }
 
  w = new corra[2];
  for (int i=0; i<2; i++)
  {
    w[i] = new corra();
    w[i].x = random(0, 300);
  }
}
 
void draw()
{
  background(#050505);
  fill(#AA851F);
 rect(0, 475, 300, 100);
  fill(#009FFF);
  ellipse(150, 480, 250, 25);
  for (int e=0; e<k.length; e++)
  {
    k[e].move();
    k[e].show();
  }
 
}
 
class corra
{
  float x, y;
  int d, v;
  float i;
}
 
class pluja
{
  float x, y;
  int d, v;
  float i, k, r;
 
  void show()
  {
    noStroke();
    fill(#0AA3FF);
    ellipse(x, y,2,2);
  }
 
  void move()
  {
    y =  y + random(1,3) ;
 
    if (y>475) y = random(0,5);
     
    if (mousePressed)
    {
      y =  y + random(1,3) ;
    }
     
 
  }
}


