
class Ball
{
  float x;
  float y;
  float d;
  float xSpeed;
  float ySpeed;
  color c;
  color c2;

  Ball(float xPos, float yPos, float diameter, 
  float speed1, float speed2, color color1)
  {
    x = xPos;
    y = yPos;
    d = diameter;
    xSpeed = speed1;
    ySpeed = speed2;    
    c = color1;
  }

  void display( )
  {
    fill(c);
    ellipse(x, y, d, d);
  }

  void move( )
  {
    x += xSpeed;
    y += ySpeed;

    xSpeed = constrain(xSpeed, -6, 6);

    if (x + d / 2 > width || x - d < 0)
    {
      xSpeed = - xSpeed;
    }
    if (y - d / 2 < 0)
    {
      ySpeed = - ySpeed;
    }
    if (y + d / 2 > height)
    {
      ySpeed = -ySpeed;

      /*
      xSpeed = 0;
       ySpeed = 0;
       println("GAME OVER!");
       noLoop( );
       */
    }
  }

  void collide(Paddle p)
  {
    if (x >= p.x - p.l / 2 && x <= p.x + p.l / 2)
    {
      if (y >= p.y - p.t / 2 && y < p.y + p.t / 2)
      {
        ySpeed = -ySpeed;

        if(xSpeed > 0)
        {
          if (p.x - x <= -p.l / 4)
          {
            xSpeed  = xSpeed * dist(p.x, p.y, x, y) / (p.l / 4);
          }
          if (p.x - x >= p.l / 4)
          {
            xSpeed  = - xSpeed * dist(p.x, p.y, x, y) / (p.l / 2);
          }
        }
        else
        {
          if (p.x - x <= - p.l / 4)
          {
            xSpeed  = - xSpeed * dist(p.x, p.y, x, y) / (p.l / 2);
          }
          if (p.x - x >= p.l / 4)
          {
            xSpeed  = xSpeed * dist(p.x, p.y, x, y) / (p.l / 2);
          }
        }
      }
    }
  }

  void collide(Block b)
  {
    if (x > b.x - 4 * b.l / 10 && x < b.x + 4 * b.l / 10)
    {
      if (y >= b.y - b.t / 2 && y <= b.y + b.t / 2)
      {
        ySpeed = -ySpeed;
      }
    }

    if (xSpeed > 0)
    {
      if (y >= b.y - b.t / 2 && y <= b.y + b.t / 2)
      {
        if (x >= b.x - b.l / 2 && x <= (b.x - b.l / 2) + (b.l / 10))
        {
          xSpeed = -xSpeed;
        }
      }
    }
    if (xSpeed < 0)
    {
      if (y >= b.y - b.t / 2 && y <= b.y + b.t / 2)
      {
        if(x <= b.x + b.l / 2 && x >= (b.x + b.l / 2) - (b.l / 10))
        {
          xSpeed = -xSpeed;
        }
      }
    }
  }
}


