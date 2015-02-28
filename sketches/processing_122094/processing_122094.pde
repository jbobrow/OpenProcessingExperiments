
int counter;

float x,y;
float x_velocity, y_velocity;
float gravity;
float radius;
void setup()
{
  size(500,350);
  x = 4;
  y = 20;
  x_velocity = 500;
  y_velocity = 10;
  gravity = .06;
  radius = 10;
}

void draw()
{
  background(211,6,6);
  y_velocity += gravity;
  x+= x_velocity ; 
  y += y_velocity ; 
  
  if (y>(height-radius) )
  {
    y= height-radius;
    y_velocity *= -0.7;
  }
  if ( x<radius )
  {
    x = radius;
    x_velocity *= -0.8;
  }
  if ( x>(width-radius) )
  {
    x = width-radius;
    x_velocity *= -0.8;
  }
  ball(x, y);
}

void ball(float x, float y)
{
  pushMatrix();
  translate(x,y);
  fill(8,7,7);
  ellipseMode(RADIUS);
  ellipse(5, 10, radius, radius);
  popMatrix();
}

