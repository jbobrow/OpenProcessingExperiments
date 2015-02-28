

Ball a;

class Ball
{

  float x;
  float y;
  float speedx;
  float speedy;
  float accelx;
  float accely;
  boolean up;
  boolean down;
  boolean right;
  boolean left;

  Ball() 
  {
    speedx = 0;
    speedy = 0;
    accelx = .1;
    accely = .1;
    up = false;
    down = false;
    right = false;
    left = false;
  }

  void show()
  {
    fill (0);
    ellipse (x,y,30,30);
    speedx += accelx;
    speedy += accely;
    x -= speedx;
    y += speedy;
  }

  void boundaries()
  {
    if (x - 15 <= 0)  {
      speedx = -speedx * 7/10;
      x = 15;
    }
    if (x + 15 >= 600)  {
      speedx = -speedx * 7/10;
      x = 585;
    }
    if (y - 15 <= 0)  {
      speedy = -speedy * 7/10;
      y = 15;
    }
    if (y + 15 >= 600)  {
      speedy = -speedy * 7/10;
      y = 585;
    }
  }

  void move() 
  {
    if (up == true)  {
      speedy -= accely * 2;
    }
    if (down == true)  {
      speedy += accely;
    }
    if (right == true)  {
      speedx -= accelx * 2;
    }
    if (left == true)  {
      speedx += accelx;
    }
  }

  void pressed()
  {
    if (keyPressed)  {
      if (keyCode == UP)  {
        up = true;
      }
      if (keyCode == DOWN)  {
        down = true;
      }
      if (keyCode == RIGHT)  {
        right = true;
      }
      if (keyCode == LEFT)  {
        left = true;
      }
    }
  }

}

