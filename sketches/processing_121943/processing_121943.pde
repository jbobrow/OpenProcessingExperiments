
float x,y;
float y_velocity, x_velocity;
float gravity;
float radius;
void setup()
{
  size(400,300);
  x = 10;
  y = 10;
  x_velocity = 5;
  y_velocity = 5;
  gravity = .04;
  radius = 10;
}

void draw()
{
  background(255,255,0);
  y_velocity += gravity;
  x += x_velocity;
  y += y_velocity;
  
  if(y>(height-radius))
  {
    y = height-radius;
    y_velocity *= -1;
  }
  if(y<radius)
  {
    y = radius;
    y_velocity *= -1;
  }
  if(x<radius)
  {
    x=radius;
    x_velocity *= -1;
  }
  if(x>(width-radius))
  {
    x = width-radius;
    x_velocity *= -1;
  }
  ball(x, y);
}

void ball(float x, float y)
{
  pushMatrix();
  translate(x,y);
  ellipseMode(CENTER);
  fill(0);
  ellipse(0,0,40,40);
  popMatrix();
}




