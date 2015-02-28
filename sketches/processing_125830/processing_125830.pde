
void setup()
{
  size(360, 500);
}

void draw()
{
}

void RF()
{
  int a = int(random(125));
  int b = int(random(125));
  int c = 255 - a - b;
  fill( c, a, b);
}

void GF()
{
  int a = int(random(125));
  int b = int(random(125));
  int c = 255 - a - b;
  fill( a, c, b);
}

void BF()
{
  int a = int(random(125));
  int b = int(random(125));
  int c = 255 - a - b;
  fill( a, b, c);
}

void GroseForm()
{
  RF();
  triangle(0,0, 180, 0, 180, 250);
  RF();
  triangle(360, 0, 180, 0, 180, 250);
  RF();
  triangle(0,0, 0, 250, 180, 250);
  RF();
  triangle(360, 0, 360, 250, 180, 250);
  GF();
  rect( 0, 250, 360, 500);
  BF();
  ellipse( 180, 250, 100, 100);
}

void keyPressed()
{
  GroseForm();
  save("Test.jpg");
}

