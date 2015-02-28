
//DISCOPLAZA Manel Lopez 1DAM
Bolas []a;
void setup()
{
  size(200, 200);
  smooth();
  fill(200);
  a = new Bolas[400];
  for (int i=0; i<a.length; i++)
  {
    a[i] = new Bolas();
    a[i].d = (int)random(15, 70);
    a[i].v = (int)random(100,35);
    a[i].c = color(random(150));
  }
}
 
void draw()
{
  background(random(145));
  fill(200, 150, 150);
  stroke(50);
 
 
  for (int i=0; i<a.length; i++)
  {
    a[i].move();
    a[i].show();
  }
 
  for (int i=0; i<a.length; i++)
  {
  }
}
class Bolas
{
  float x, y;
  int d;
  int v;
  color c;
 
  void show()
  {
    //burbujas repressenta focos
    fill(c);
    ellipse(x, y, d, d);
    fill(random (255));
    ellipse(x,x,10,d);
    if (x>400) x = 0;
    if (x<0) x = 100;
    if (y>400) y = 0;
    if (y<0) y = 10;
    //luces aleatorias
       stroke(int(random(255)),int(random(255)), int(random(255)) );
line((random(255)),(random(255)),10,10);
line((random(255)),(random(255)),20,200);
rect((random(20)),(random(255)),20,10);
 }
  
 //movimiento
  void move()
  {
    x += (random(-10, 20)) * 0.1 * v;
    y += (random(-10, 70)) * 0.1* v;
   
   
  }
}


