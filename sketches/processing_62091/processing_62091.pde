
class Car 
{
  float velocity, xpos, ypos, rot;
  PImage car;
  boolean toRight, toLeft, forward, backward;
  
  Car() 
  {
    xpos = ypos = 250;
    rot=0;
    velocity=0;
    car= loadImage("car.png");
    toRight = toLeft = forward = backward = false;
  }

  void update() 
  {
    if (toRight)
      rot+=.06;
    else if (toLeft)
      rot-=.06;
    else if (forward)
      velocity+=0.25;
    else if (backward)
      velocity-=0.25;
    
    if (velocity > 5)
      velocity = 5;
    else if (velocity < -3)
      velocity = -3;  
  }

  void display()
  {
    imageMode(CENTER);
    image(car, xpos, ypos);
  }
  
}


