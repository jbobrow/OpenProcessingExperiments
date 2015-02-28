
float x,y;
float x_velocity, y_velocity;
float gravity;
float radius;
void setup()
{
size(1000,500);
x = 0;
y = 500;
x_velocity = 25;
y_velocity = -25;
gravity = 1;
radius = 10;
}
void draw()
{
  background(200);
  y_velocity += gravity;
  x += x_velocity;
  y += y_velocity;
  if (y>height-radius)
  {
    y = height-radius;
    y_velocity *= -0.75;
  }
  if (x<radius)
  {
    x = radius;
    x_velocity *= -0.5;
  }
  if (x>(width-radius))
  {
    x = width-radius;
    x_velocity *= -0.5;
  }
  ball(x,y);
}
void ball(float x, float y)
{
  pushMatrix();
  translate(x,y);
  stroke(100);
  stroke(color(255,0,0));
  ellipseMode(RADIUS);
  fill(255,0,0);
  ellipse(0,0,radius,radius);
  popMatrix();
}


