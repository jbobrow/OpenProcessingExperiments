
//Keana Moezzi, CP1, mods 4-5, Pong Assignment

Ball bob; 
Paddle jo;
Paddle comp;
void setup()
{
  size(500, 500);
  frameRate(150);
  bob = new Ball(); 
  jo = new Paddle();
  comp = new Paddle();
  comp.s = 10;
  comp.s = 490;
}
void draw()
{
  background(0, 0, 0);  
  jo.moveUp();
  jo.moveDown();
  jo.show();  
  comp.moveUp();
  comp.moveDown();
  comp.show();  
  bob.move();
  bob.bounce();
  bob.show();
  
  

  if (keyPressed == true && keyCode == UP)
  {
    jo.moveUp();
  }
  if (keyPressed == true && keyCode == DOWN)
  {
    jo.moveDown();
  }
  if (comp.a < bob.y && bob.x > 250)
  {    
    comp.moveDown();
  }
  if (comp.a > bob.y && bob.x > 250)
  {
    comp.moveUp();
  }
}
class Ball
{
  int x, y;
  boolean up, right;  
  Ball()
  {
    x = int(random(0, 500));
    y = int(random(0, 500));
    up = random (1) < 0.5;
    right = random (1) < 0.5;
  }
  void move()
  {
    if (right == false)
    {
      x= x-2;
    }
    else
    {
      x++;
    }
    if (up == true)
    {
      y--;
    }
    else
    {
      y++;
    }
  }
  void bounce()
  {
    if (get(x - 11, y) != color (0, 0, 0))
    {
      right = true;
    }
    if (get(x + 11, y) != color (0, 0, 0))
    {
      right = false;
    }

    if (x < 10)
    {
      right = true;
    }
    if (x>490)
    {
      right = false;
    }
    if (y<10)
    {
      up = false;
    }
    if (y>490)
    {
      up = true;
    }
  }
  void show()
  {
    fill (255, 255, 255);
    ellipse (x, y, 20, 20);
  }
}

class Paddle
{
  int a;  
  int s;
  Paddle()
  {
    a = 250;
  }
  void moveUp()
  {
    a--;
  }
  void moveDown()
  {
    a++;
  }

  void show()
  {
    fill (255, 255, 255);    
    rect (s, a, 7, 50);   
    //rect (490, a, 7, 50);
  }
}
