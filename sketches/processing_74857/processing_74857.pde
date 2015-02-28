
//cole pierce mods 4-5 cp1
//http://colesprogrammingsite.webs.com/animation.html
int w=55;
int t=5;
int y=55;
int a=0;
int b=0;
int c=0;
int d=5;
int e=0;
int f=0;
void setup()
{
  background(255, 255, 255);
  frameRate(15);
  smooth();
  size(400, 400);
  fill(0, 0, 0);
  ellipse(180, 25, 20, 20);
  ellipse(220, 25, 20, 20);
  quad(180, 15, 220, 15, 220, 30, 180, 30);
  ellipse(140, 14, 7, 7);
  ellipse(260, 14, 7, 7);
  strokeWeight(3);
  line(140, 14, 140, 30);
  line(260, 14, 260, 30);
  ellipse(200, 39, 200, 22);
  strokeWeight(2.5);
  stroke(0, 255, 0);
  fill(0, 255, 0);
  ellipse(200, 326, 20, 30);
  fill(0);

  line(200, 330, 200, 370);
  line(200, 350, 220, 343);
  line(200, 350, 180, 343);
  line(200, 369, 185, 385);
  line(200, 369, 215, 385);
  ellipse(200, 326, 14, 22);
  noFill();
}
void draw()
{

  mystery();

  if (w>385)
  {
    mystery1();
  }    
  if (b>170)
  {
    mystery2();
  }
}
void mystery()
{
  smooth();
  stroke(30, 255-t, 0+t);
  t=t+3;
  ellipse(200, w, y, 10);
  w=w+6;
  y=y+3;
  if (w>385)
  {
    fill(255, 255, 255);
    w=1000000;
  }
  if (y>220)
  {
    fill(255, 255, 255);
    y=10000000;
  }
}
void mystery1()
{
  strokeWeight(4);
  stroke(255, 255, 255);
  ellipse(200, 385-a, 220-b, 10);
  a=a+6;
  b=b+3;


  if (a>330)
  {
    a=0;
    frameRate(1000);
  }
  if (b>175)
  {
    b=0;
    frameRate(1000);
  }
}


void mystery2()
{

  fill(255, 255, 255);
  quad(-5, -5, -5, 500, 500, 500, 500, -5);
  fill(0);
  stroke(0);
  strokeWeight(1);
  ellipse(180+c, 25+e, 20, 20);
  ellipse(220+c, 25+e, 20, 20);
  quad(180+c, 15+e, 220+c, 15+e, 220+c, 30+e, 180+c, 30+e);
  ellipse(140+c, 14+e, 7, 7);
  ellipse(260+c, 14+e, 7, 7);
  strokeWeight(3);
  line(140+c, 14+e, 140+c, 30+e);
  line(260+c, 14+e, 260+c, 30+e);
  ellipse(200+c, 39+e, 200, 22+e);
  c=c+d;
  e=e+f;
  if (c>100)
  {
    d=-5;
  }
  if (c<-100)
  {
  f=-5;
    d=0;
    
  }
}
