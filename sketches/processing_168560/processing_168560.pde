
void setup ()
{
  size (600,525);
  background (0);
  smooth ();
  fill (255);
}

void draw ()
{
  rectMode (CENTER);
  triangle (0+mouseX,525-mouseX,
            600-mouseX,525-mouseX,300,0+mouseX);
  triangle (0+mouseX,0+525,
            600-mouseX,0+525,300,525-mouseX);  
}
