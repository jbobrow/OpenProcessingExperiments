
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
  for (int a = 0; a < 500;a = a+40)
  {
    for (int b =0; b <500; b = b+40)
    {
      rect (a, b, 500, 500);
      ellipse(a,b,500,500);
    }
  }
  noLoop();
}



