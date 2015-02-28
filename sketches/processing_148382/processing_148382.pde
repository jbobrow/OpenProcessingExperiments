
float x,y;
float x_vel, y_vel;
float grav;
float radius;

void setup()
{
size(500,500);
 x = 20;
 y = 20;
 y_vel = 5;
 x_vel = 5;
 radius = 7;
 grav = 0.4;
}


void draw()
{
  background(150);
  y_vel += grav;
  y += y_vel;
  x += x_vel;
  ball(x,y);
  if ( y>(height-radius) )
  {
    y = height-radius;
    y_vel *= -0.7;
  }
  if ( x<radius )
  {
    x = radius;
    x_vel *= -0.5;
  }
  if ( x>(width-radius) )
  {
    x = width-radius;
    x_vel *= -0.5;
  }
  ball(x, y);
}


void ball(float x, float y)
{
pushMatrix();
translate(x, y);
ellipseMode(RADIUS);
ellipse(0, 0, radius, radius);
popMatrix();
}



