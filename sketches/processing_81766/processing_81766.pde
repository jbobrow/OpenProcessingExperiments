
void setup()
{
  size(500, 500);
  background(#C2F778);
  smooth();
}
void draw()
{
  noFill();
  stroke(#475A2C);
  //premiere boucle hauteur
  for (int a = 25; a < 500;a = a+15)
  {
    for (int b =25; b <500; b = b+60)
    {
      ellipse (a, b, 500, 500);
    }
  }
  noLoop();
}



