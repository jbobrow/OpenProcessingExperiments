
//Winston L, Ping Pong & Billy, CP1, Mods 4-5
//

bouncingBall billy = new bouncingBall();
paddle ping = new paddle();
paddle pong = new paddle();
void setup()
{
  size(500, 500);
}
void draw()
{
  background(200);
  pong.show();
  ping.show();
  billy.move();
  billy.bounce();
  billy.show();
  ping.ping();
  pong.pong();
}
class paddle
{
  int a, b, x, y, z;
  paddle()
  {
   b=200; 
  }
  void show()
  {
    fill(x,y,z);
    noStroke();
    rect(a,b,10,80);
  }
  void ping()
  {
    a=25;
    x=255;
    y=0;
    z=0;
  }
  void pong()
  {
    a=475;
    x=0;
    y=0;
    z=255;
  }
}
class bouncingBall
{
  int x, y;
  boolean up, right;
  bouncingBall()
  {
    x=70;
    y=250;
    up=true;
    right=true;
  }
  void move()
  {
    if (get(x-13,y)==color(255,0,0))
    {
      right=true;
    }
    if (get(x+10,y)==color(0,0,255))
    {
      right=false;
    }
    if(up==true)
    {
      y=y-2;
    }
    if (up==false)
    {
      y=y+2;
    }
    if(right==true)
    {
      x=x+2;
    }
    if(right==false)
    {
      x=x-2;
    }
  }
  void bounce()
  {
    if(x<15)
    {
      right=true;
    }
    if(x>485)
    {
      right=false;
    }
    if(y<15)
    {
      up=false;
    }
    if(y>485)
    {
      up=true;
    }
  }
  void show()
  {
    fill(random(256),random(256),random(256),random(125,255));
    noStroke();
    ellipse(x, y, 25, 25);
  }
}
void keyPressed()
{
  if(key=='w')
  {
    ping.b=ping.b-25;
  }
  if(key=='s')
  {
    ping.b=ping.b+25;
  }
  if(keyCode==UP)
  {
    pong.b=pong.b-25;
  }
  if(keyCode==DOWN)
  {
    pong.b=pong.b+25;
  }
}
