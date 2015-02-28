
int rectx = 40;
int recty = 160;
int barwidth = 800;
void setup()
{
  size (880, 400);
  fill(125);
  rect(rectx, recty, barwidth, 80);
  fill(191, 255, 0);
}

void draw()
{

  int sizebarx = 80;
  int sizebary = sizebarx;
    float sc = mouseX;
  if ((sc+rectx) < barwidth)
  {
    rect(sc, recty, sizebarx, sizebary);
    fill(0, 0, 0);
  }
  else
  {
    rect(barwidth-rectx, recty, sizebarx, sizebary);
    fill(0, 0, 0);
  }
  
  
}



