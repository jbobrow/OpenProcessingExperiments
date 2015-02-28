
class Final
{
  float x, y, dx, dy;
  boolean finalHidden;
  PImage boss;

Final(int PositionX, int PositionY)
{
  x = PositionX;
  y = PositionY;
  dx = 2.5;
  dy = 3.1;
  finalHidden = false;
  boss = loadImage("hilton3.png");
}

void drawBoss()
{
  image(boss, x, y);
}

void moveBoss()
{
  x += dx;
  y += dy;
  if(x >= 510){
    dx *= -1.3;
  }
  if(x <= 61){
    dx *= -0.8;
  }
  if(y >= 550){
    dy *= -1.2;
  }
  if(y <= 113){
    dy *= -0.7;
  }
}
}

