
float x,y;
float y_velocity;
float x_velocity;
float gravity;
float radius;
void setup()
{
  size(500,300);
  x = 1;
  y = 10;
  y_velocity = 1;
  x_velocity = 10;
  gravity = 0.5;
  radius = 10;
}

void draw()
{
  background(200);
  y_velocity += gravity;
  x += x_velocity;
  y += y_velocity;
  if (y>(height-radius))
  {
    y = height-radius;
    y_velocity *= -0.9;
  }
  if (x>(width-radius))
  {
    x = width-radius;
    x_velocity *= -0.7;
  }
  if (x<radius)
  { 
    x = radius;
    x_velocity *= -0.7;
  }
  ball(x,y);
   
}

void ball(float x, float y)
{
  pushMatrix();
  translate(x,y);
  ellipseMode(RADIUS);
  ellipse(0,0, radius, radius);
  popMatrix();
}


