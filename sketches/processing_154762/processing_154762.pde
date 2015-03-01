
Mover [] bouncers;

int bewegungsModus = 1;

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
    m.update (bewegungsModus);

    i = i + 1;
  }
}


class Mover
{
  PVector direction;
  PVector location;

  float speed;
  float SPEED;

  float noiseScale;
  float noiseStrength;
  float forceStrength;

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

    speed = random (4, 7);
    SPEED = speed;
    noiseScale = 80;
    noiseStrength = 1;
    forceStrength = random (0.1, 0.2);

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

  // GENEREL ------------------------------

  void update ()
  {
    update (0);
  }

  void update (int mode)
  {
    if (mode == 0) // bouncing ball
    {
      speed = SPEED * 0.7;
      move();
      checkEdgesAndBounce();
    }
    else if (mode == 1) // noise
    {
      speed = SPEED * 0.7;
      addNoise ();
      move();
      checkEdgesAndRelocate ();
    }
    else if (mode == 2) // steer
    {
      steer (mouseX, mouseY);
      move();
    }
    else if (mode == 3) // seek
    {
      speed = SPEED * 0.7;
      seek (mouseX, mouseY);
      move();
    }
    else // radial
    {
      speed = SPEED * 0.7;
      addRadial ();
      move();
      checkEdges();
    }

    display();
  }

  // HOW TO MOVE ----------------------------

  void steer (float x, float y)
  {
    steer (x, y, 1);
  }

  void steer (float x, float y, float strength)
  {

    float angle = atan2 (y-location.y, x -location.x);

    PVector force = new PVector (cos (angle), sin (angle));
    force.mult (forceStrength * strength);

    direction.add (force);
    direction.normalize();

    float currentDistance = dist (x, y, location.x, location.y);

    if (currentDistance < 70)
    {
      speed = map (currentDistance, 0, 70, 0, SPEED);
    }
    else speed = SPEED;
  }

  void seek (float x, float y)
  {
    seek (x, y, 1);
  }

  void seek (float x, float y, float strength)
  {

    float angle = atan2 (y-location.y, x -location.x);

    PVector force = new PVector (cos (angle), sin (angle));
    force.mult (forceStrength * strength);

    direction.add (force);
    direction.normalize();
  }

  void addRadial ()
  {

    float m = noise (frameCount / (2*noiseScale));
    m = map (m, 0, 1, - 1.2, 1.2);

    float maxDistance = m * dist (0, 0, width/2, height/2);
    float distance = dist (location.x, location.y, width/2, height/2);

    float angle = map (distance, 0, maxDistance, 0, TWO_PI);

    PVector force = new PVector (cos (angle), sin (angle));
    force.mult (forceStrength);

    direction.add (force);
    direction.normalize();
  }

  void addNoise ()
  {

    float noiseValue = noise (location.x /noiseScale, location.y / noiseScale, frameCount / noiseScale);
    noiseValue*= TWO_PI * noiseStrength;

    PVector force = new PVector (cos (noiseValue), sin (noiseValue));
    //Processing 2.0:
    //PVector force = PVector.fromAngle (noiseValue);
    force.mult (forceStrength);
    direction.add (force);
    direction.normalize();
  }

  // MOVE -----------------------------------------

  void move ()
  {

    PVector velocity = direction.get();
    velocity.mult (speed);
    location.add (velocity);
  }

  // CHECK --------------------------------------------------------

  void checkEdgesAndRelocate ()
  {
    float diameter = ellipseSize;

    if (location.x < -diameter/2)
    {
      location.x = random (-diameter/2, width+diameter/2);
      location.y = random (-diameter/2, height+diameter/2);
    }
    else if (location.x > width+diameter/2)
    {
      location.x = random (-diameter/2, width+diameter/2);
      location.y = random (-diameter/2, height+diameter/2);
    }

    if (location.y < -diameter/2)
    {
      location.x = random (-diameter/2, width+diameter/2);
      location.y = random (-diameter/2, height+diameter/2);
    }
    else if (location.y > height + diameter/2)
    {
      location.x = random (-diameter/2, width+diameter/2);
      location.y = random (-diameter/2, height+diameter/2);
    }
  }


  void checkEdges ()
  {
    float diameter = ellipseSize;

    if (location.x < -diameter / 2)
    {
      location.x = width+diameter /2;
    }
    else if (location.x > width+diameter /2)
    {
      location.x = -diameter /2;
    }

    if (location.y < -diameter /2)
    {
      location.y = height+diameter /2;
    }
    else if (location.y > height+diameter /2)
    {
      location.y = -diameter /2;
    }
  }

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
  if (key == ' ') transparentBG = !transparentBG;
  if (key == 'n')
  {
    float noiseScale = random (5, 400);
    float noiseStrength = random (0.5, 6);
    float forceStrength = random (0.5, 4);

    for (int i = 0; i < bouncers.length; i++)
    {
      Mover currentMover = bouncers[i];
      currentMover.noiseScale = noiseScale;
      currentMover.noiseStrength = noiseStrength;
      currentMover.forceStrength = forceStrength;
    }
  }
}

void mousePressed ()
{
  if (mouseButton == LEFT)
  {
    bewegungsModus++;
    if (bewegungsModus > 4)
    {
      bewegungsModus = 0;
    }
  }
}

