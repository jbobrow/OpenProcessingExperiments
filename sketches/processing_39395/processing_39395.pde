
void setup ()
{
  size (500, 500);
  smooth ();
  noStroke();
  noLoop();
  background (0);
  ellipseMode(CENTER);
  
}

void draw ()
{
  for (int r = 0; r <21 ; r++)
  {
    for (int c = 0; c <21; c++)
    {
      int R = c*1*20;
      int G = r*1 *20;
      int B = c*10*254;
      
      
       fill (B, R, G);
      ellipse (c*60, r*60, 30, 30);
      
      
      fill (R, G, B);
      rect (c*35,r*35, 10, 10);
      
      fill (G, B, R);
      ellipse (c*25, r*25, 5, 5);
     
     
      //fill (B, B, B);
      //ellipse (c*20, r*20, 5, 5);
    }
  }
}
