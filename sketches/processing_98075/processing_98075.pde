
float angle = 0.0;
float offset = 200;
float scalar = 10;
float speed = 0.05; //changing speed changes shape and drawing pattern of the spiral

void setup()
{
  size(400, 400);
  fill(255,69,0);
  smooth();
}


void draw()
{
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  fill(0,69,255);
  ellipse (x, y, 30, 30);
  angle += speed;
  scalar += speed;
  
}


