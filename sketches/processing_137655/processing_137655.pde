
float x, y;
float x_velocity, y_velocity;
float gravity;
float radius;
void setup()
{
size(800, 500);
x = 2;
y = 10;
x_velocity = 20;
y_velocity = 0;
gravity = .1;
radius = 10;
}
void draw()
{
background(100,0,0);
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
x_velocity *= -0.6;
}
if ( x>(width-radius) )
{
x = width-radius;
x_velocity *= -0.5;
}
ball(x, y);
}
void ball(float x, float y)
{
pushMatrix();
translate(x, y);
ellipseMode(RADIUS);
fill(40,0,200);
ellipse(0, 0, radius, radius);
popMatrix();
}


