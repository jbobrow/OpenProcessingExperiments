
float x,y;
float y_velocity, x_velocity;
float gravity;
float radius;

void setup()
{
  size(400,300);
  x = 200;
  y = 10;
  x_velocity = 0;
  y_velocity = 5;
  gravity = 2;
  radius = 10;
}

void draw()
{
  background(225);
y_velocity += gravity;
x += x_velocity ;
y += y_velocity ;
if ( y>(height-radius) )
{
y = height-radius;
y_velocity *= -0.7;
}
if ( x<radius )
{
x = radius;
x_velocity *= -0.5;
}
if ( x>(width-radius) )
{
x = width-radius;
x_velocity *= -0.5;
}
if(mousePressed == true)
{
  x = mouseX;
  y = mouseY;
}

ball(x, y);
}

void ball(float x, float y)
{
  pushMatrix();
  translate(x,y);
  ellipseMode(RADIUS);
  ellipse(0, 0, radius, radius);
  popMatrix();
}




