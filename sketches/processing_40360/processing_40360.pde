
// By Wilson L. 
//Move the mouse.
//It's a picture of an oil rig.

int space =25;
int mini = 5;
float y;

void setup()
{
  size (500,500);
  noStroke();
  smooth();
}

void draw()
{
  background (#BF881B);
  //BACKGROUND
  for (int x3 = 30; x3<70; x3+=mini)
  {
    for (int y3 = 0; y3<height; y3+=10)
    {
      fill (0);
      ellipse (x3,y3*2-mouseY,mini,mini);
    }
  }

  for (int x3 = 100; x3<170; x3+=mini)
  {
    for (int y3 = 0; y3<height; y3+=10)
    {
      fill (0);
      ellipse (x3,y3*2-mouseY,mini,mini);
    }
  }
  //FOREGROUND
  for (int y = 0; y<height+25; y+=space)
  {
    fill (0);
    ellipse (mouseX,y,space,space);
  }
  for (int x2 = 0; x2<300; x2+=space*2+5)
  {
    for (int y2 = 0; y2<height; y2+=100)
    {
      fill (128);
      ellipse (x2,y2*2-mouseX,space*2,space*2);
    }
  }
}


