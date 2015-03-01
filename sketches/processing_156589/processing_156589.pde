
Mover [] bouncers;

boolean transparentBG = true;


void setup ()
{
  size (600, 200);
  smooth();

  bouncers = new Mover [200];

  for (int i = 0; i < bouncers.length; i++)
  {
    Mover m = new Mover();
    bouncers [i] = m;
  }

  background (#57385c);
  frameRate (30);
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


  int i = 0;
  while (i < bouncers.length )
  {
    Mover m = bouncers [i];
    m.move();
    m.checkEdgesAndBounce();
    m.display();

    i = i + 1;
  }
}


class Mover
{
  PVector direction;
  PVector location;

  float speed;

  float ellipseSize;

  color c;


  Mover () // Konstruktor = setup der Mover Klasse
  {
    setRandomValues();
  }

  Mover (float x, float y) // Konstruktor = setup der Mover Klasse
  {
    setRandomValues ();
  }

  // SET ---------------------------

  void setRandomValues ()
  {
    location = new PVector (random (width), random (height));
    ellipseSize = random (4, 15);

    float angle = random (TWO_PI);
    direction = new PVector (cos (angle), sin (angle));

    speed = random (1, 5);

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

  // MOVE -----------------------------------------

  void move ()
  {

    PVector velocity = direction.get();
    velocity.mult (speed);
    location.add (velocity);
  }

  // CHECK --------------------------------------------------------

  void checkEdgesAndBounce ()
  {
    float radius = ellipseSize / 2;

    if (location.x < radius )
    {
      location.x = radius ;
      direction.x = direction.x * -1;
    }
    else if (location.x > width-radius )
    {
      location.x = width-radius ;
      direction.x *= -1;
    }

    if (location.y < radius )
    {
      location.y = radius ;
      direction.y *= -1;
    }
    else if (location.y > height-radius )
    {
      location.y = height-radius ;
      direction.y *= -1;
    }
  }

  // DISPLAY ---------------------------------------------------------------

  void display ()
  {
    fill (c);
    ellipse (location.x, location.y, ellipseSize, ellipseSize);
  }
}

void keyPressed ()
{
  transparentBG = !transparentBG;
}

