
ArrayList <Circular> cir;
boolean transparentBG = false;

void setup ()
{
  size (600, 200);
  smooth();

  cir = new ArrayList ();

  for (int i = 0; i < 10; i++)
  {
    Circular neuerKreis = new Circular (width/2, height/2);
    cir.add (0, neuerKreis);
  }
}

void draw ()
{
    if (transparentBG)
  {
    fill (#57385c, 40);
    noStroke();
    rect (0, 0, width, height);
  } 
  else background (#57385c);
  
  for (int i = 0; i < cir.size()/*cir.length*/; i++)
  {
    Circular aktuellerCircle = cir.get (i);
    aktuellerCircle.update ();
  }

  if (mousePressed && mouseButton == LEFT)
  {
    Circular neuerKreis = new Circular (mouseX, mouseY);
    cir.add (0, neuerKreis); // fÃ¼gt das Element am Ende der List an
  }
}


class Circular
{
  float radius;
  int num;

  PVector location;
  color c;
  float ellipseSize;

  float startAngle;
  float angleSpeed;

  Circular () // konstruktor, mind. 1
  {
    radius = random (10, 100);
    num = round (random (3, 30));

    location = new PVector (random (width), random (height));
    ellipseSize = random (3, 15);

    startAngle = random (TWO_PI);
    angleSpeed = map (radius, 10, 40, 0.05, 0.005);

    float dice = random (100);
    if (dice < 50) angleSpeed *= -1;

    setRandomColor();
  }

  Circular (float x, float y) // konstruktor, mind. 1
  {
    radius = random (10, 100);
    num = round (random (3, 30));

    location = new PVector (x, y);
    ellipseSize = random (3, 15);

    startAngle = random (TWO_PI);
   angleSpeed = map (radius, 10, 100, 0.03, 0.01);

    float dice = random (100);
    if (dice < 50) angleSpeed *= -1;

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
      float angle = startAngle + map (i, 0, num, 0, TWO_PI);

      float x = location.x + cos (angle) * radius;
      float y = location.y + sin (angle) * radius;

      ellipse (x, y, ellipseSize, ellipseSize);
    }

    startAngle += angleSpeed;
  }
}


void mousePressed ()
{

  if (mouseButton == RIGHT)
  {
    if (cir.size() > 0) cir.remove (cir.size()-1);
  }
}


void keyPressed ()
{
 if (key == ' ') cir.clear();
 if (key == 'n') transparentBG = !transparentBG;
}

