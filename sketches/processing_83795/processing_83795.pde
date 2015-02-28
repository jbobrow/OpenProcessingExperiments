
//Alvin Ha Computer Programming 4-5 Mr Simon
//POOONGG

Ball bob;
Paddle smack;
Comppaddle comp;

void setup()
{
  size(400, 400);

  bob = new Ball();
  smack = new Paddle();
  comp = new Comppaddle();
}

void draw()
{
  background(0);
  smack.move();
  smack.show();
  comp.show();
  bob.move();
  bob.show();
  bob.bounce();
  
}

class Paddle
{
  boolean up = true;
  boolean down = false;
  int o, p;
  Paddle()
  {
    o = 10;
    p = 200;
    up = true;
    down = false;
  }
  void show()  
  {
    fill(255);
    rect(o, p, 10, 50);
  }

  void move()
  {
    if (p > 0 && keyPressed == true && key == 'w')
    {
      up = true;
      p = p -10;
    }
    if ( p < 350 && keyPressed == true && key == 's')
    {
      down = false;
      p = p + 10;
    }
  }
}

class Comppaddle
{
  boolean up = true;
  boolean down = false;
  int compX = 380;
  int compY = 200;
  void show()
  {
    fill(255);
     if (bob.y > 0 && bob.y < 390)
    {
    rect(compX, bob.y, 10, 50);
    }
  }
}



class Ball
{
  boolean right = true;
  boolean up = true;
  int x, y;
  Ball()
  {
    x = 100;
    y = 100;
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 30, 30);
  }
  void move()
  {
    if ( right == true)
    {
      x = x + 5;
    }
    else
    {
      x = x - 5;
    }
    if (up == true)
    {
      y = y - 5;
    }
    else
    {
      y= y + 5;
    }
  }
  void bounce()
  {
//    if (x<1)
//    {
//      right = true;
//    }
//    if (x>399)
//    {
//      right = false;
//    }
  
    if(get(x+31,y) == color(255))
    {
      right = false;
    }
    if(get(x-31,y) == color(255))
    {
      right = true;
    }
      if (y>370)
    {
      up = true;
    }
    if (y<21)
    {
      up = false;
    }

  }
}
