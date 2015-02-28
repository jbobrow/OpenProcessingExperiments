
int x = 0, speedX = 1, r= 0;

void setup()
{
 size(200,200); 
}

void fillShape()
  {
    for(int x = 0; x < 100000; x++ )
    if(frameCount  > 100 * x)
    r = (int)random(255);
  }
void draw()
{
      fill(0,0,0);
  background(255);
  ellipse(x,height/2 - 20, 10,10);
  ellipse((width - x), height/2 + 20,10,10);
  x = x + speedX;
  if(x > width || x < 0)
  speedX = speedX * -1;


}
