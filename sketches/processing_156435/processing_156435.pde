
Mover m;

boolean transparentBG = true;


void setup ()
{
  size (600, 200);
  smooth();

  m = new Mover ();


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

  m.move();
  m.checkEdgesAndBounce();
  m.display();
}


class Mover
{
  PVector direction;
  PVector location;

  float speed;
  float ellipseSize;


  Mover () // Konstruktor = setup der Mover Klasse
  {
    location = new PVector (random (width), random (height));
    ellipseSize = random (4, 15);

    float angle = random (TWO_PI);
    direction = new PVector (cos (angle), sin (angle));

    speed = random (1, 5);
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
    fill (#ffedbc);
    noStroke();
    ellipse (location.x, location.y, ellipseSize, ellipseSize);
  }
}

void keyPressed ()
{
  transparentBG = !transparentBG;
}

void mousePressed ()
{
  m = new Mover();
}

