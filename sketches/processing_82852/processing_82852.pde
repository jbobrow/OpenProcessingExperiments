
//Derek Chan, Bouncing Ball, CP1 Mods 14-15
Phreak lol[];
PImage phreak;
PImage TonsOfDamage;
PImage tf;
PImage phreak2;
PImage phreak3;
void setup()
{
  size(500, 500);
  lol = new Phreak[50];
  phreak=loadImage("phreak.jpg");
  TonsOfDamage=loadImage("TonsOfDamage.jpg");
  tf=loadImage("tf.jpg");
  phreak2=loadImage("phreak2.jpg");
  phreak3=loadImage("phreak3.jpg");
  for(int x=0;x<lol.length;x++)
  {
    lol[x]=new Phreak();
  }
}
void draw()
{
image(TonsOfDamage,0,0,500,500);
  for(Phreak temp:lol)
  {
  temp.move();
  temp.bounce();
  temp.show();
  }
}
class Phreak
{
  int x, y;
  int position1, position2;
  boolean up, left;
  Phreak()
  {
    x=int(random(0, 400));
    y=int(random(0, 400));
    up=true;
    left=true;
  }
  void show()
  {
    image(phreak, x, y, 50, 50);
    image(tf,400-x,400-y,50,50);
    image(phreak2, x,400-y,50,50);
    image(phreak3,400-x,y,50,50);
  }
  void move()
  {
    if (up==true)
    {
      y-=5;
    }
    else
    {
      y+=5;
    }
    if (left==true)
    {
      x-=5;
    }
    else
    {
      x+=5;
    }
  }
  void bounce()
  {
    if (y<=0 || y>=400)
    {
      up=!up;
    }
    if (x<=0||x>=400)
    {
      left=!left;
    }
  }
}



