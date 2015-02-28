
void setup()
{
  size(500, 500);
  background(#F091A3);
  smooth();
}
void draw()
{
  noFill();
  stroke(#81424E);
  //premiere boucle hauteur
  for (int a = 25; a < 500;a = a+30)
  {
    for (int b =25; b <500; b = b+30)
    {
      ellipse (a, b, 500, 500);
    }
  }
  noLoop();
}



