
import processing.opengl.*;

float x, y, w, h, vx, vy, gravity;
void setup()
{
  size (screen.width, screen.height, OPENGL);
  //x = (random(0,screen.width));
  x= (screen.width/2);
  y = (0);
  //h = random(5, 10);
  //w = random(5, 10);
  vx = .3;
  vy =-.4;
  gravity = .3;
}

void draw()


{
  background (0);


  y = y - vy;
  vy-=gravity;
  


for (int i = 0; i<20;i++)
{
    if (y<0)
  {
    y = y*vy*i;
  }
  ellipse (x*i*.2, y, 10, 10);
  stroke(255);
}
}
