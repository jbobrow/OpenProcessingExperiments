
float angle = 0;
float speed = 0.1;
float scalar = 0.005;
float offset = 0.6;
float x;
float y;
float diam;



void setup()
{
  size(400,400);
  background(#692579);
  smooth();
  fill(0);
  x = random(width);
  y = random(height);
  diam = random(10,25);
  
}
void draw()
{
  x += sin((angle)+2 + offset)  * scalar;
  y += cos(angle + offset)  * scalar;
  angle += speed;
  scalar += speed;
  
  noStroke();
  fill (255, x-y, 52, 123);
  ellipse(x,y,diam,diam);
}

