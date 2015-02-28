
class Ball
{
  float gravity, velY, velX, bounce;
  float x, y, px, py;
  float ballWidth, ballHeight;
  float bounceWall;
  color col;
  int life;

  Ball(float gravity_, float velX_, float velY_, float bounce_, float x_, float y_, color col_, int life_)
  {
    gravity = gravity_;
    velY = velY_;
    velX = velX_;
    bounce = bounce_;
    ballHeight = 10;
    ballWidth = 10;
    bounceWall = bounce;
    x = x_;
    y = y_;
    px = x_;
    py = y_;
    col = col_;
    life = life_;
  }

  void drawBall()
  {
    velY = velY +gravity;
    y = y + velY;
    x = x + velX;
    if(life > 0)
    {
      stroke(col, life);

      line(px, py, x, y );
      px = x;
      py = y;
      bounce();
      life--;
    }
  }

  void bounce()
  {
    if(y >= height)
    {
      velY = -velY*bounce;
      y = height;
    }
    if(x > width)
    {
      x = width;
      velX = -velX*bounceWall;

    }
    else if(x < 0)
    {
      x = ballWidth/2;
      velX = -velX * bounceWall;
    }

  }

}


