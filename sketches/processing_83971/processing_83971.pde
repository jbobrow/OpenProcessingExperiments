
//Jarvis Law,Bouncing Ball,CP1 mods 16-17
ball Yellow;
paddle Black;
void setup()
{
  size(500, 500);
  Yellow=new ball();
  Black=new paddle();
}
void draw()
{
  background(0);  
  Black.keyPressed();
  Black.show1();
  Yellow.move();
  Yellow.bounce();
  Yellow.show();
}
class paddle
{
  int x, y;
  boolean left, right;
  paddle()
  {
    x=180;
  }
  void keyPressed()
  {
    if (keyPressed==true&key;=='a')
    {
      x-=3;
    }
    if (keyPressed==true&key;=='d')
    {
      x+=3;
    }
  }
  void show1()
  {
    noStroke();
    fill(200, 100, 69);
    rect(x, 420, 150, 25);
  }
}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=170;
    y=250;
    up=true;
    right=true;
  }
  void move()
  {
    if (right==true)
    {
      x+=3;
    }
    if (right==false)
    {
      x-=3;
    }
    if (up==true)
    {
      y+=3;
    }
    if (up==false)
    {
      y-=3;
    }
  }
  void bounce()
  {
    if (x>460)
    {
      right=false;
    }
    if (x<40)
    {
      right=true;
    }
    if (y>460)
    {
      up=false;
    }
    if (y<40)
    {
      up=true;
    }
    if (get (x, y)!=color(0))
    {
      up=false;
    }
  }
  void show()
  {
    fill(0, 255, 255);
    ellipse(x, y, 40, 40);
  }
}
