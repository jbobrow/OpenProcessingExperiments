
Mover m;
Mover m2;
 

 
 
void setup ()
{
  size (600, 200);
  smooth();
 
  m = new Mover (#ffedbc);
  m2 = new Mover (#A75265);
 
  background (#57385c);
  frameRate (30);
}
 
void draw ()
{
 
  background (#57385c);
 
  m.move();
  m.checkEdgesAndBounce();
  m.display();
  
  m2.move();
  m2.checkEdgesAndBounce();
  m2.display();
}
 
 
class Mover
{
  PVector direction;
  PVector location;
 
  float speed;
  float ellipseSize;
  
  color c; 
  
  boolean mouseOver;
 
  Mover (color tempC) // Konstruktor = setup der Mover Klasse
  {
    c = tempC; 
    location = new PVector (random (width), random (height));
    //ellipseSize = random (4, 15);
    ellipseSize = 15;
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
    //fill (#ffedbc);
    fill (c);   
    noStroke();
    ellipse (location.x, location.y, ellipseSize, ellipseSize);
  }
  
 
}
