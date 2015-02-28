
class ball
{
  int diameter = 10;
  PVector pos = new PVector();
  PVector vel = new PVector();
  ball()
  {
    pos.x = width/2;
    pos.y = height/2;

    float a = random(TWO_PI);
    vel.x = cos(a)*5;
    vel.y = sin(a)*5;
  }
  void draw()
  {
    ellipse(pos.x, pos.y, diameter, diameter);
  }
  void move()
  {
    float dt = 1;
    pos.add(vel);
  }

  void collide()
  {
    if ( pos.x<0 || pos.x>width ) vel.x = -vel.x;
    if ( pos.y<0 || pos.y>height ) vel.y = -vel.y;
  }
}


