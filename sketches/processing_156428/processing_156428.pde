
Circular [] cir;

void setup ()
{
  size (600, 200);
  smooth();

  cir = new Circular [30];

  for (int i = 0; i < cir.length; i++)
  {
    Circular neuerKreis = new Circular (random (width), random (height));
    cir [i] = neuerKreis;
  }
}

void draw ()
{
  background (#57385c);
  for (int i = 0; i < cir.length; i++)
  {
    Circular aktuellerCircle = cir [i];
    aktuellerCircle.update ();
  }
}


void mousePressed ()
{

  for (int i = 0; i < cir.length; i++)
  {
    Circular neuerKreis = new Circular (random (width), random (height));
    cir [i] = neuerKreis;
  }
}
class Circular
{
  float radius;
  int num;

  PVector location;
  color c;
  float ellipseSize;

  Circular () // konstruktor, mind. 1
  {
    radius = random (10, 100);
    num = round (random (3, 30));

    location = new PVector (random (width), random (height));
    ellipseSize = random (3, 15);
    setRandomColor();
  }

  Circular (float x, float y) // konstruktor, mind. 1
  {
    radius = random (10, 100);
    num = round (random (3, 30));

    location = new PVector (x, y);
    ellipseSize = random (3, 15);

    setRandomColor();
  }

  void setRandomColor ()
  {
    int colorDice = (int) random (4);

    if (colorDice == 0) c = #ffedbc;
    else if (colorDice == 1) c = #A75265;
    else if (colorDice == 2) c = #ec7263;
    else c = #febe7e;
  }

  void update ()
  {
    fill (c);
    noStroke();

    for (int i = 0; i < num; i = i + 1 )
    {
      float angle =  map (i, 0, num, 0, TWO_PI);

      float x = location.x + cos (angle) * radius;
      float y = location.y + sin (angle) * radius;

      ellipse (x, y, ellipseSize, ellipseSize);
    }
  }
}


