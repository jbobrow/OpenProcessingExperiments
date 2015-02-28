
/* @pjs preload="UltimateFireball3.png"; */
//referencing processing.org/examples/storinginput.html
PImage fireball;

int num = 60;
float mx [] = new float [num];
float my [] = new float [num];

void setup()
{
    size (500, 500);
    fireball = requestImage("UltimateFireball3.png");
    background(0);
}
  
void draw ()
{
  background(0);
  
  
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++)
  {
    int index = (which+1 + i) % num;
    if (i > 0)
    {
      image(fireball, mx[index], my[index], i, i);
    }
  }
}


