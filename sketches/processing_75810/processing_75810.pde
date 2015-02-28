
//Cole Pierce, CP1, mods 4-5
int a=250;
int b=250;
int e=255;
int f=255;
int g=255;
int h=0;
int i=0;

int x=1;
int y=1;
boolean iscolor=true;
void setup()
{
  size(500, 500);
}
void draw()
{
  background(0);

  while (x<=y)
  {
    smooth();
    noStroke();
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
    textSize(15);
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
