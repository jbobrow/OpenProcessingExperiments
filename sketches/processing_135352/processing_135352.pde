
 void setup ()
{
  size (500,500);
  background (255);
}

void draw ()
{
   strokeWeight (mouseY/(mouseX+1));
  stroke (0);
  if (mousePressed && (mouseButton == LEFT))
  {
    int aa = mouseX/10;
    int bb = mouseY/10;
    for (int a = 0; a < width; a=a+aa)
  {
    for (int b = 0; b < height; b=b+bb)
    {
      line (b,a, a, b);
      if ( a == width)
      {
        a=0;
      }
      if ( b == height)
      {
        b=0;
      }
    }
  }
  }
   if (mousePressed && (mouseButton == RIGHT))
  {
    background (255);
  }
}
    
void keyPressed ()
{
  if (keyPressed == true )
  {
  if (key == 'i')
  {
    saveFrame ("minimalist_####.jpg");
      }
}
}

