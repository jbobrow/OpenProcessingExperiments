
float x, y;
float x_velocity, y_velocity;
float gravity;
float radius;
void setup()
{
size(600, 300);
x = 2;
y = 10;
x_velocity = 10;
y_velocity = 0;
gravity = .2;
radius = 10;
}
void draw()
{
background (200);
y_velocity += gravity;
x += x_velocity ;
y += y_velocity ;
if( y>(height-radius) )
{
  y =height-radius;
  y_velocity *= -0.7;
}
if( x<radius )
{
  x = radius;
  x_velocity *= -0.5;
}
if( x>(width-radius) )
{
  x = width-radius;
  x_velocity *= -0.5;
}
ball(x, y);
ball(x+100, y);

}
void ball(float x,float y)
{
pushMatrix();
translate(x, y);
ellipseMode(RADIUS);
ellipse (0, 0, radius, radius);
fill(255,0,0);
triangle(100,10,160,-25, 100, 60);
fill(0,255,0);
rect(0, 0, 100,-60);
fill(0,0,0);
popMatrix();
}




