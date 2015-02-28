
void setup ()
{
  size (500,500);
  background (255);
  frameRate (10);
}

void draw ()
{
  colorMode (HSB, 500);
    for (int a = 0; a < width; a=a+20)
    {
      for (int b = 0; b < height; b=b+20)
      {
        int aa = round (a / 40); 
        int aaa = (aa*40);
        int bb = round (b / 40);
        int bbb = (bb*40);
       stroke (0); 
       float r = random (0, 50);
      fill (a, b, 500, r); 
      rect (aaa, bbb, r, r);
      }
    }
   }



