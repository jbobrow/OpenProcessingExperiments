
class Bullet
{
  int x;
  int y;
  float angle;
  float velocity;
  float diameter;

  Bullet(int X, int Y, float Angle)
  {
    x=X;
    y=Y;
    angle=Angle;
    velocity = 8;
    diameter = 5;
  }
  Bullet(float X, float Y, float Angle)
  {
    x=(int)X;
    y=(int)Y;
    angle=Angle;
    velocity = 8;
    diameter = 5;
  }
  void move()
  {
    fill(255,255,0);
    x+= velocity * cos(angle);
    y+= velocity * sin(angle);
    ellipse(x,y,diameter,diameter);
  }
  int getX()
  {
    return x;
  }
  int getY()
  {
    return y;
  }
  float getAngle()
  {
    return angle;
  }
  void setVelocity(float vel)
  {
    velocity = vel;
  }
}


