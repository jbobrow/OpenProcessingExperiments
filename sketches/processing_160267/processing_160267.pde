
/*----------------------------------
 
 Copyright by Diana Lange 2014
 Don't use without any permission. Creative Commons: Attribution Non-Commercial.
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 vimeo: https://vimeo.com/dianalange/videos
 
 -----------------------------------*/

ArrayList <Mover> bouncers;



void setup ()
{
  size (600, 200);

  bouncers = new ArrayList ();


  frameRate (30);
}

void draw ()
{
  fill (#57385c, 100);
  noStroke();
  rect (0, 0, width, height);


  int i = 0;
  while (i < bouncers.size ())
  {
    Mover m = bouncers.get (i);
    m.update();

    if (m.isDead == true)
    {
      bouncers.remove (i);
    }
    else
    {
      i = i + 1;
    }
  }


  if (mousePressed && mouseButton == LEFT)
  {
    Mover newMover = new Mover (150, 95);
    bouncers.add (newMover);
  }
}

class Fish
{
  PVector [] location;
  float ellipseSize;

  color c1;
  color c2;

  Fish (float x, float y)
  {
    setRandomColor ();

    location = new PVector [round (random (8, 15))];
    location[0] = new PVector (x, y);

    for (int i = 1; i < location.length; i++)
    {
      location[i] = location[0].get ();
    }
    ellipseSize = random (6, 40);
  }

  // GET ------------------------------

  float getSize ()
  {
    return ellipseSize;
  }

  PVector getHead ()
  {
    return location [location.length-1].get();
  }

  PVector getTail ()
  {
    return location [0].get();
  }

  // SET ---------------------

  void setColor (color c)
  {
    c1 = c2 = c;
  }

  void setColor (color C1, color C2)
  {
    c1 = C1;
    c2 = C2;
  }

  void setRandomColor ()
  {
    int colorDice = (int) random (4);

    if (colorDice == 0) c1 = #ffedbc;
    else if (colorDice == 1) c1 = #A75265;
    else if (colorDice == 2) c1 = #ec7263;
    else c1 = #febe7e;

    float dice = random (100);
    if (dice < 25)
    {
      colorDice = (int) random (4);

      if (colorDice == 0) c2 = #ffedbc;
      else if (colorDice == 1) c2 = #A75265;
      else if (colorDice == 2) c2 = #ec7263;
      else c2 = #febe7e;
    }
    else c2 = c1;
  }

  void setHead (PVector pos)
  {
    location [location.length-1]= pos.get();

    updateBody ();
  }

  // HELPERS ---------------

  void updateBody ()
  {
    for (int i = 0; i < location.length-1; i++)
    {
      location [i] = location [i+1];
    }
  }

  void resetBody ()
  {
    for (int i = 0; i < location.length-1; i++)
    {
      location [i] = location [location.length-1].get();
    }
  }

  // DISPLAY --------------------

  void display ()
  {
    noStroke();
    for (int i = 0; i < location.length; i++)
    {
      color c = lerpColor (c1, c2, map (i, 0, location.length, 1, 0 ) );
      float s = map (i, 0, location.length, 1, ellipseSize  );

      fill (c);
      ellipse (location[i].x, location [i].y, s, s);
    }
  }
}

class Mover
{
  PVector direction;

  float speed;
  float SPEED;

  float noiseScale;
  float noiseStrength;
  float forceStrength;

  Fish f;

  boolean doDie = true; // soll Ã�Â¼berprÃ�Â¼ft werden, ob der punkt sich auÃ�ï¿½erhalb der zeichenflÃ�Â¤che befindet
  boolean isDead = false; // ist der punkt auÃ�ï¿½erhalb der zeichenflÃ�Â¤che

    Mover () // Konstruktor = setup der Mover Klasse
  {
    setRandomValues();
  }

  Mover (float x, float y) // Konstruktor = setup der Mover Klasse
  {
    setRandomValues ();
    f.setHead (new PVector (x, y));
    f.resetBody();
  }

  // SET ---------------------------

  void setRandomValues ()
  {
    f = new Fish (random (width), random (height));
    f.ellipseSize = random (8, 30);

    float angle = random (TWO_PI);
    direction = new PVector (cos (angle), sin (angle));

    speed = random (4, 7);
    SPEED = speed;
    noiseScale = random (4, 300);
    noiseStrength = random (0.5, 5);
    forceStrength = random (0.1, 2);
  }

  void setColor (color c)
  {
    f.setColor (c);
  }

  void setColor (color c1, color c2)
  {
    f.setColor (c1, c2);
  }

  void setFishSize (float s)
  {
    f.ellipseSize = s;
  }

  // GET --------------------------------

  float getSize ()
  {
    return f.getSize();
  }

  PVector getLocation ()
  {
    return f.getHead();
  }

  // GENEREL ------------------------------


  void update ()
  {
    addNoise (); // richtungsÃ�Â¤nderung des punktes basierend auf einen (zufÃ�Â¤lligen) noise feldes
    move();      // bewegung
    checkEdgesAndDie ();     // kantenÃ�Â¼berÃ�Â¼berprÃ�Â¼fung
    display();        // zeichnen
  }


  // HOW TO MOVE ----------------------------

  void addNoise ()
  {
    PVector location = f.getHead();

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
    PVector location = f.getHead();

    PVector velocity = direction.get();
    velocity.mult (speed);
    location.add (velocity);

    f.setHead (location);
  }

  // CHECK --------------------------------------------------------

  void checkEdgesAndDie ()
  {
    PVector location = f.getTail();
    float diameter = f.ellipseSize;

    if (location.x < -diameter/2)
    {
      isDead = true;
    }
    else if (location.x > width+diameter/2)
    {
      isDead = true;
    }

    if (location.y < -diameter/2)
    {
      isDead = true;
    }
    else if (location.y > height + diameter/2)
    {
      isDead = true;
    }
    if ( diameter < 1)isDead = true;
  }

  // DISPLAY ---------------------------------------------------------------

  void display ()
  {
    f.display();
  }
}

