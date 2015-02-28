

//-----------------------
//  class Hunter   v1.0
//-----------------------

boolean colorize = false;

class Hunter 
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius = 8.0;
  float topSpeed = 4.0;
  color fillColor;

  //---------------------
  // create a new hunter
  //---------------------
  Hunter() 
  {
    restart();
  }

  //-------------------------
  // randomize hunter values
  //-------------------------
  void restart() 
  {
    location = new PVector(random (width), random(height), random(width/2));
    velocity = new PVector(random(-1,1),random(-1,1));
    acceleration = new PVector(random(-1,1),random(-1,1));
    topSpeed = 1.0 + random(3.0);
    radius = 12.0 - 2*topSpeed;
    randomColor();
  }

  //------------------
  // set random color
  //------------------
  void randomColor() 
  {
    if (colorize) 
         fillColor = color(random(155),random(155),random(155),222);
    else fillColor = color(random(155));
  }

  //-------------------------------
  // move hunter to mouse position
  //-------------------------------
  void move() 
  {
    if (mouseY > 0)
    {
      PVector mouse = new PVector(mouseX,mouseY, (mouseX+mouseY)/2);
      PVector dir = PVector.sub(mouse,location);
      dir.normalize();
      dir.mult(0.2);
      acceleration = dir;
    }
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    
    // check limits and correct position
    if      (location.x > width)  location.x = 0;
    else if (location.x < 0)      location.x = width;
    if      (location.y > height) location.y = 0;
    else if (location.y < 0)      location.y = height;
  }

  //-------------
  // draw hunter
  //-------------
  void draw() 
  {
    fill(fillColor);
    ellipse(location.x, location.y, radius, radius);
  }
}


