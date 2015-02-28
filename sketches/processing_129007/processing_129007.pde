
float x, y;
float x_velocity, y_velocity;
float gravity;
float radius;

void setup()
{
  size(600,300);
  x=7;
  y=10;
  x_velocity =  10;
  y_velocity=0;
  gravity = 0.1;
  radius = 10;
}

void draw()
{
  background(200);
  y_velocity += gravity;
  x += x_velocity;
 y += y_velocity;
 if (y>height)
 {
   y=height;
   y_velocity =-y_velocity;
 }
 if (x<radius)
 {
   x= radius;
   x_velocity =-x_velocity;
 }
 if (x>(width-radius))
 {
   x=width-radius;
   x_velocity =-x_velocity;
 }
  ball(x,y);
}

void ball(float x, float y)
{
  pushMatrix();
  translate(x,y);
  ellipseMode(RADIUS);
  ellipse(0,0,radius,radius);
  popMatrix();
 
}




