
class Bomb
{
  int x,y,ticks;
  int pulseAnimationIndex;
  float timer;
  
  public Bomb(int ix, int iy, int t)
  {
    pulseAnimationIndex = 200;
    ticks = t;
    x = ix;
    y = iy;
    timer = millis();
  }
  
  public Bomb(int ix, int iy)
  {
    pulseAnimationIndex = 200;
    ticks = 4;
    x = ix;
    y = iy;
    timer = millis();
  }
  
  public void update()
  {
    pulseAnimationIndex -= 5;
    if (millis() - timer > levelSpeed)
    {
      timer = millis();
      ticks--;
      pulseAnimationIndex = 200;
    }
    if (ticks < 1)
    {
      for (int i=0; i<3; i++)
      {
        for (int j=0; j<3; j++)
        {
          objectController.addGraphic(x-1+i,y-1+j);
        }
      }
      objectController.explosionAt(x,y);
      objectController.removeBomb(this);
    }
  }    
  
  public void draw()
  {
    noStroke();
    fill(20,pulseAnimationIndex,20);
    rect(x*RESOLUTION, y*RESOLUTION, RESOLUTION, RESOLUTION);
  }
}

