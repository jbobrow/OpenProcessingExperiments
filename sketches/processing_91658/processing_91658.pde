
int [] anArray = {100, 200, 300, 400, 500};
void setup()
{
  size (500, 500);
   background (0);
}

void draw()
{
  fill (255);
  rect (20, 0, width - 40, height - 20);

if (mouseX < 20 || mouseX > width - 20 || mouseY > height - 20)
{
  for (int i = 0; i < anArray.length; i++)
  {
    anArray[i] = anArray[i] - 1;

    fill (221, 5, 255);
   rect (width/2, anArray[i], 40, 40);
   rect (width/2, anArray[i], 40, 40);
   rect (width/2, anArray[i], 40, 40);
   rect (width/2, anArray[i], 40, 40);
   rect (width/2, anArray[i], 40, 40);
   if (anArray[i] < -40)
   anArray[i] = 500;
  }
}
}
