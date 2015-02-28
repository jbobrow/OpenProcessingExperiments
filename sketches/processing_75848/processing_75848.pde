
//Derek King, Doubling Shapes, CP1 mods 14-15
http://dereklucca.webs.com/Random Shapes.html

int a=200;
int b=275;
int e=300;
int f=215;
int g=245;
int h=200;
int i=100;
 
int x=2;
int y=1;
boolean iscolor=true;
void setup()
{
  size(500, 500);
}
void draw()
{
  background(0);
 
  while (x<y)
  {
    smooth();
    frameRate(1);
    fill(e, f, g);
    e=int(random(255));
    f=int(random(255));
    g=int(random(255));
    ellipse(a, b, h, i);
    a=int(random(30, 470));
    b=int(random(30, 470));
    i=int(random(10,50));
     h=int(random(10,50));
     
     
   fill(237,157,7);
    textSize(20);
    text(y/2, 450, 490);
    x++;
     
  }
 
     
  y=y*2;
  if (y>9000)
  {
    x=1;
    y=2;
  }
}
