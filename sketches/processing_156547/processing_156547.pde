
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

boolean transparentBG = false;

int bewegungsModus = 0;
// 0 = BOUNCE
// 1 = NOISE
// 2 = STEER
// 3 = SEEK
// 4 = RADIAL
// 5 = FLOCK

void setup ()
{
  size (600, 600);
  smooth();

  bouncers = new ArrayList ();

  for (int i = 0; i < 50; i++)
  {
    Mover newMover = new Mover();
    bouncers.add (newMover);
  }

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

  // SCHWARM -----------

  for (int i = 0; i < bouncers.size (); i++)
  {
    Mover m = bouncers.get (i);

    if (bewegungsModus != 5) m.update (bewegungsModus);
    else
    {
      m.flock (bouncers);
      m.move();
      m.checkEdges();
      m.display();

    }
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
    radius = random (5, 50);
    num = round (random (3, 30));

    location = new PVector (x, y);
    ellipseSize = random (3, 10);

    startAngle = random (TWO_PI);
    angleSpeed = map (radius, 10, 50, 0.07, 0.01);

    float dice = random (100);
    if (dice < 50) angleSpeed *= -1;

    setRandomColor();
  }

  void setPosition (PVector p)
  {
    location = p.get();
  }

  void setRandomColor ()
  {
    int colorDice = (int) random (4);

    if (colorDice == 0) c = #ffedbc;
    else if (colorDice == 1) c = #A75265;
    else if (colorDice == 2) c = #ec7263;
    else c = #febe7e;
  }
  
  PVector getLocation ()
  {
    return location.get();
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

class Mover
{
  PVector direction;

  float speed;
  float SPEED;

  float noiseScale;
  float noiseStrength;
  float forceStrength;

  Circular f;

  Mover () // Konstruktor = setup der Mover Klasse
  {
    setRandomValues();
  }

  Mover (float x, float y) // Konstruktor = setup der Mover Klasse
  {
    setRandomValues ();
    f.setPosition (new PVector (x, y));
  }

  // SET ---------------------------

  void setRandomValues ()
  {
    f = new Circular (random (width), random (height));
    f.ellipseSize = random (4, 15);

    float angle = random (TWO_PI);
    direction = new PVector (cos (angle), sin (angle));

    speed = random (4, 7);
    SPEED = speed;
    noiseScale = 80;
    noiseStrength = 1;
    forceStrength = random (0.1, 0.2);
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

  // FLOCK ------------------------------

  void flock (ArrayList <Mover> boids)
  {
    PVector location = f.getLocation();

    PVector other;
    float otherSize;

    PVector cohesionSum = new PVector (0, 0);
    float cohesionCount = 0;

    PVector seperationSum = new PVector (0, 0);
    float seperationCount = 0;

    PVector alignSum = new PVector (0, 0);
    float speedSum = 0;
    float alignCount = 0;

    for (int i = 0; i < boids.size(); i++)
    {
      other = boids.get(i).f.getLocation();
      otherSize = boids.get(i).f.radius;

      float distance = PVector.dist (other, location);
 

      if (distance > 0 && distance <70) //align + cohesion
      {
        cohesionSum.add (other);
        cohesionCount++;

        alignSum.add (boids.get(i).direction);
        speedSum += boids.get(i).speed;
        alignCount++;
      }

      if (distance > 0 && distance < (f.radius+otherSize)*1.5) // seperate bei collistion
      {
        float angle = atan2 (location.y-other.y, location.x-other.x);

        seperationSum.add (cos (angle), sin (angle), 0);
        seperationCount++;
      }

      if (alignCount > 8 && seperationCount > 12) break;
    }

    // cohesion: bewege dich in die Mitte deiner Nachbarn
    // seperation: renne nicht in andere hinein
    // align: bewege dich in die Richtung deiner Nachbarn

    if (cohesionCount > 0)
    {
      cohesionSum.div (cohesionCount);
      cohesion (cohesionSum, 1);
    }

    if (alignCount > 0)
    {
      speedSum /= alignCount;
      alignSum.div (alignCount);
      align (alignSum, speedSum, 1.3);
    }

    if (seperationCount > 0)
    {
      seperationSum.div (seperationCount);
      seperation (seperationSum, 1);
    }
  }

  void cohesion (PVector force, float strength)
  {
    steer (force.x, force.y, strength);
  }

  void seperation (PVector force, float strength)
  {
    force.limit (strength*forceStrength);

    direction.add (force);
    direction.normalize();

    speed *= 1.1;
    speed = constrain (speed, 0, SPEED * 1.5);
  }

  void align (PVector force, float forceSpeed, float strength)
  {
    speed = lerp (speed, forceSpeed, strength*forceStrength);

    force.normalize();
    force.mult (strength*forceStrength);

    direction.add (force);
    direction.normalize();
  }

  // HOW TO MOVE ----------------------------

  void steer (float x, float y)
  {
    steer (x, y, 1);
  }

  void steer (float x, float y, float strength)
  {
    PVector location = f.getLocation();

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
    PVector location = f.getLocation();

    float angle = atan2 (y-location.y, x -location.x);

    PVector force = new PVector (cos (angle), sin (angle));
    force.mult (forceStrength * strength);

    direction.add (force);
    direction.normalize();
  }
  
  void addRadial ()
  {
    PVector location = f.getLocation();
    
    float m = noise (frameCount / (2*noiseScale));
    m = map (m,0, 1, - 1.2, 1.2);
    
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
    PVector location = f.getLocation();

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
    PVector location = f.getLocation();

    PVector velocity = direction.get();
    velocity.mult (speed);
    location.add (velocity);

    f.setPosition (location);
  }

  // CHECK --------------------------------------------------------

  void checkEdgesAndRelocate ()
  {
    PVector location = f.getLocation();
    float diameter = f.radius*2;

    if (location.x < -diameter/2)
    {
      location.x = random (-diameter/2, width+diameter/2);
      location.y = random (-diameter/2, height+diameter/2);

      f.setPosition(location);
    } 
    else if (location.x > width+diameter/2)
    {
      location.x = random (-diameter/2, width+diameter/2);
      location.y = random (-diameter/2, height+diameter/2);

      f.setPosition (location);
    }

    if (location.y < -diameter/2)
    {
      location.x = random (-diameter/2, width+diameter/2);
      location.y = random (-diameter/2, height+diameter/2);
      f.setPosition (location);
    } 
    else if (location.y > height + diameter/2)
    {
      location.x = random (-diameter/2, width+diameter/2);
      location.y = random (-diameter/2, height+diameter/2);
      f.setPosition (location);
    }
  }


  void checkEdges ()
  {
    PVector location = f.getLocation();
    float diameter = f.radius*2;

    if (location.x < -diameter / 2)
    {
      location.x = width+diameter /2;
      f.setPosition (location);
    } 
    else if (location.x > width+diameter /2)
    {
      location.x = -diameter /2;
      f.setPosition (location);
    }

    if (location.y < -diameter /2)
    {
      location.y = height+diameter /2;
      f.setPosition (location);
    } 
    else if (location.y > height+diameter /2)
    {
      location.y = -diameter /2;
      f.setPosition (location);
    }
  }

  void checkEdgesAndBounce ()
  {
    PVector location = f.getLocation();
    float radius = f.radius;

    if (location.x < radius)
    {
      location.x = radius;
      f.setPosition (location);
      direction.x = direction.x * -1;
    } 
    else if (location.x > width-radius)
    {
      location.x = width-radius;
      f.setPosition (location);
      direction.x *= -1;
    }

    if (location.y < radius)
    {
      location.y = radius;
      f.setPosition (location);
      direction.y *= -1;
    } 
    else if (location.y > height-radius)
    {
      location.y = height-radius;
      f.setPosition (location);
      direction.y *= -1;
    }
  }

  // DISPLAY ---------------------------------------------------------------

  void display ()
  {
    f.update();
  }
}



void keyPressed ()
{
  if (key == ' ')
  {
    bewegungsModus++;
    if (bewegungsModus > 5) bewegungsModus = 0;
  }
  if (key == 's') saveFrame ("export/####.png");
   if (key == 'n') transparentBG = !transparentBG;
}




