
class Mover
{
  PVector location, direction;
  PVector plocation;
  float speed;

  int mode = 0;

  Mover ()
  {
    speed = random (1, 5);
    location = new PVector (random (width), random (height));
    plocation = new PVector (location.x, location.y);
    //println (location);

    float angle = random (TWO_PI);

    direction = new PVector (cos (angle), sin (angle));

    float dice = random (100);

    if (dice < 50) mode = 0;
    else if (dice >= 50 && dice < 70) mode = 1;
    else if (dice >= 70 && dice < 85) mode = 2;
    else mode = 3;

    mode = 1;
  }
  
  void toggleMode ()
   {
     mode++;
     if (mode > 3) mode = 0;
   }
  
  int getIndex (int W, int M)
  {
    return (constrain ((int) location.y*W+(int)location.x, 0, M-1));
  }

  void update(PVector acceleration, float strength)
  {
    plocation.x = location.x;
    plocation.y = location.y;

    acceleration.mult (strength);
    direction.add (acceleration);
    direction.normalize();

    move ();
    checkEdges();
    display();
  }

  void update()
  {
    move ();
    checkEdges();
    display();
  }

  void checkEdges ()
  {

    float angle = random (TWO_PI);

    if (location.x < 0) 
    {
      location.x = random (width);
      location.y = random (height);
      plocation.x = location.x;
      plocation.y = location.y;
      direction = new PVector (cos (angle), sin (angle));
    }
    else if (location.x > width) 
    {
      location.x = random (width);
      location.y = random (height);
      plocation.x = location.x;
      plocation.y = location.y;
      direction = new PVector (cos (angle), sin (angle));
    }

    if (location.y < 0) 
    {
      location.x = random (width);
      location.y = random (height);
      plocation.x = location.x;
      plocation.y = location.y;
      direction = new PVector (cos (angle), sin (angle));
    }
    else if (location.y > height) 
    {
      location.x = random (width);
      location.y = random (height);
      plocation.x = location.x;
      plocation.y = location.y;
      direction = new PVector (cos (angle), sin (angle));
    }
  }

  void move ()
  {
    location.x += direction.x*speed;
    location.y += direction.y*speed;
  }

  void display ()
  {

    line (location.x, location.y, plocation.x, plocation.y);
  }
}


