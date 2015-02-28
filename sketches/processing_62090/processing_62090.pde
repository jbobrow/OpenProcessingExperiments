
class Car 
{
  float velocity, xpos, ypos, rot;
  PImage car;
  boolean toRight, toLeft;
  
  Car() 
  {
    xpos = 250;
    ypos = 400;
    rot=0;
    velocity=4;
    car= loadImage("car.png");
    toRight = toLeft = false;
  }

  void update() 
  {
    velocity -= 0.001;
    
    if(toLeft && rot>-1)
      rot-=.03;
    else if(toRight && rot<1)
      rot+=.03;
  }
  
  void modVel(float mod)
  {
    velocity += mod;
    if (velocity > 9)
      velocity = 9;
    else if (velocity < 3)
      velocity = 3;
  }
  
  void display() {
    imageMode(CENTER);
    image(car, xpos, ypos);
  }
  
}


