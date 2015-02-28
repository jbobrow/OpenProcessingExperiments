
void setup(){
  size(360,500);
}

void draw()
{
}

void Musterfuller(int x, int y, int dx, int dy)
{
  for( int xx = 0; xx < dx; xx++)
  {
    for(int yy = 0; yy < float(dy)/dx*xx; yy++)
    {
      stroke(float(xx)/dx*255,float(yy)/dy*255,0);
      point(x+xx,y+yy);
    }
  }
  
}   

void keyPressed()
{
  for(int x = 0; x < 36; x++)
   {
    Musterfuller(int(random(360)), int(random(500)), int(random(360)), int(random(500)));
   }
}
