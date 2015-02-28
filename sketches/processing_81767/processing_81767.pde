
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
  for (int a = 25; a < 500;a = a+70)
  {
    for (int b =25; b <500; b = b+70)
    {

      line(a/2, b/2, 500, 500);

      line(a/2, b/2, 500, 500);
      line(a/2, b/2, 0, 500);
      line(a/2, b/2, 500, 0);
      line(a/2, b/2, 500, 250);
      line(a/2, b/2, 100, 100);
    }
  }
  noLoop();
}



