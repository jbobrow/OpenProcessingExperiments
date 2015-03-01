
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

PVector direction;
float speed;
float forceStrength;

Fish f;

void setup ()
{
  size (600, 200);
  smooth();

  f = new Fish (random (width), random (height));
  speed = 5;
  float angle = random (TWO_PI);
  direction = new PVector (cos (angle), sin (angle));
  forceStrength = 0.2;

  frameRate (30);
}

void draw ()
{
  background (#57385c);

  move();
  steer (mouseX, mouseY);
  f.display();
}

class Fish
{
  PVector [] location;
  float ellipseSize;

  color c1;
  color c2;

  Fish (float x, float y)
  {
    location = new PVector [round (random (15, 25))];
    location[0] = new PVector (x, y);

    for (int i = 1; i < location.length; i++)
    {
      location[i] = location[0].get ();
    }
    ellipseSize = random (6, 40);
    c1 = #ffedbc;
    c2 = #A75265;
  }

  PVector getHead ()
  {
    return location [location.length-1].get();
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

void steer (float x, float y)
{
  PVector location = f.getHead();

  float angle = atan2 (y-location.y, x -location.x);

  PVector force = new PVector (cos (angle), sin (angle));
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

