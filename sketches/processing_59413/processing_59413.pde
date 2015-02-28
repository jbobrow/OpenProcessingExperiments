
PImage star, star2;
int animDelay;
int animFrame; 
int animFrame2;
int RUN_ANIMATION_DELAY = 5;
boolean canShoot = true;

class Bullet {
  int x, y;

  Bullet(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void show() {
    x += 12;
    if (animDelay--<0) 
    {
      animDelay=RUN_ANIMATION_DELAY;
      if (animFrame==0) 
      {
        animFrame=1;
      } 
      else
        if (animFrame==1)
        {
          animFrame=0;
        }
    }

    if (animFrame==0)
    {
      image(star, x+60, y+10);
    }
    if (animFrame==1)
    {
      image(star2, x+55, y+5);
    }
  }

  void show2() {
    x += 12;
    if (animDelay--<0) 
    {
      animDelay=RUN_ANIMATION_DELAY;
      if (animFrame2==0) 
      {
        animFrame2=1;
      } 
      else
        if (animFrame2==1)
        {
          animFrame2=2;
        }
        else
          if (animFrame2==2)
          {
            animFrame2=3;
          }
          else
            if (animFrame2==3)
            {
              animFrame2=0;
            }
    }

    if (animFrame2==0) 
    {
      image(saltWEP1, x+80, y+7);
    }
    if (animFrame2==1)
    {
      image(saltWEP2, x+70, y+14);
    }
    if (animFrame2==2)
    {
      image(saltWEP3, x+80, y+7);
    }
    if (animFrame2==3)
    {
      image(saltWEP4, x+70, y+14);
    }
  }
}


