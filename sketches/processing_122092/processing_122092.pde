
float x,y;
float x_velocity, y_velocity;
float gravity;
float radius;
void setup()
{ 
  size(600,800);
  x = width/2;
  y = 10;
  x_velocity = 5;
  y_velocity = 0;
  gravity = .2;
  radius = 10;
  }

void draw()
{
  background(168,214,170);
  strokeWeight(2);
  stroke(250);
  fill(0);
  rect(mouseX,height-10,60,height-10,10);
  y_velocity += gravity;
  x += x_velocity;
  y += y_velocity;
   if ( y>height-radius)
{
  if( (x>mouseX) && (x<mouseX+60))
  { 
    y_velocity *= -1.1;
    y = height-radius;

  }
 else
  {
  y_velocity *= -0.7;
  y = height-radius;
}

x_velocity *= 0.985;
}
if (x<radius)
{
  x= radius;
  x_velocity *= -1.05;
}
if (x>(width-radius))
{
  x=width-radius;
  x_velocity *= -1.05;
}
  ball(x,y);
  }

void ball(float x, float y)
{
  pushMatrix();
  translate(x,y);
  stroke(0);
  fill(0);
  ellipseMode(RADIUS);
  ellipse(0,0,radius,radius);
  popMatrix();
}



