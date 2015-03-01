
//variables
float x = 400;
float y = 400;
float speed = 5;
float radius = 20;
float offset = 2;

//setup
void setup()
{
  size(800,800);
  smooth();
  ellipseMode(RADIUS);
}

//drawing
void draw()
{
x += speed;
y += offset;
fill(255,0,0);
ellipse(x,y, radius, radius);

if(x >= 799)
  {
    speed = -(speed);
  }
if(x <= 1)
  {
    speed = -(speed);
  }
if(y >= 799)
  {
    offset -= 4;
  }
if(y <= 1)
  {
    offset += 4;
  }
}
