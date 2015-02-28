
float x_value;

void setup()
{
  size(400,400);
  background(0);
  stroke(255);
}

void draw()
{
  x_value = (x_value+20) % 400;
  line(x_value, 100, x_value+15, 300);
}

void keyPressed()
{
  if(key == 'x')
  {
    stroke(random(255),random(255),random(255));
  }
}

