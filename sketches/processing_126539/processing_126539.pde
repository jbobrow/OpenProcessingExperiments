
void setup()
{
  size (400, 400);
  background (255);
  ellipseMode (CORNER);
}

void draw()
{
  float i, j;
  for (i = 0; i < 10; i = i + 1)
   for (j = 0; j < 10; j = j + 1)
   {
   if (j % 2 == 0 && i % 2 == 0)
   fill (255, 0, 0);
   else if ( j % 2 != 0 && i % 2 == 0)
   fill (0, 255, 0);
   else if (j % 2 == 0 && i % 2 != 0)
   fill (0, 255, 0);
   else
   fill (255, 0, 0);
   ellipse (i * width/10, j * height/10, width/10, height/10);
   }
   noLoop ();
}
