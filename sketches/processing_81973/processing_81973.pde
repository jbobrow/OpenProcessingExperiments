
void setup()
{
  size(500, 500);
}

void draw()
{

  for (int mpx = 25; mpx < 500; mpx= mpx+50)
  {
    for (int mpy = 25; mpy < 500; mpy = mpy +50)
    {
      fill(mouseY, mouseY, 50, 150);
      stroke(250, 43, 237);
      ellipse (mpx, mpy, 40, 40);
      fill(mpx,mpy,100);
      ellipse(mpx,mpy,60,60);
      rectMode(CENTER);
      rect(mpx, mpy, 32, 32);
    }
  }
}



