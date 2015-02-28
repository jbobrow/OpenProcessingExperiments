
int x=0, speedX=1;

void setup()
{
  size(200,200);
}

void draw()
{
  int m = millis();
  background(255);
  fill(m%5);
  ellipse(x, height/2 - 20, 10, 10);
  ellipse((width-x), height/2 + 20,10,10);
  x=x+speedX;
  if(x>width||x<0)
  speedX=speedX*-1;
}
