
class Bullet
{
  int x;
  int y;
  float angle;
  float velocity;
  float diameter;
  color col;
  float speedConst;

  Bullet(int X, int Y, float Angle, color c)
  {
    x = X;
    y = Y;
    angle = Angle;
    velocity = 8;
    diameter = 5;
    col = c;
    
  }
  Bullet(float X, float Y, float Angle, color c)
  {
    x = (int)X;
    y = (int)Y;
    angle = Angle;
    velocity = 8;
    diameter = 5;
    col = c;
  }
  Bullet(int X, int Y, float Angle, color c, float v )
  {
    x = X;
    y = Y;
    angle = Angle;
    speedConst = v;
    diameter = 5;
    col = c;
  }
  Bullet(float X, float Y, float Angle, color c, float v)
  {
    x = (int)X;
    y = (int)Y;
    angle = Angle;
    speedConst = v;
    diameter = 5;
    col = c;
  }
  void move()
  {
    fill(col);
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
  float getVelocity()
  {
    return velocity;
  }
  void setSpeedConst(float constant)
  {
    speedConst = constant;
  }
  float getSpeedConst()
  {
    return speedConst;
  }
  void setVelocity(float vel)
  {
    velocity = vel;
  }
}


