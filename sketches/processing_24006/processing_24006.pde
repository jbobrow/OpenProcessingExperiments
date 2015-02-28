
////////////////
PImage bacteria;
////////////////

//////////////////////////////////////
public class Bacteria
{
  float x, y, vx;
  float r;
  Bacteria(float x, float y, float vx)
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    r = 90;
  }
//////////////////////////////////////  

//////////////////////////////
  void show()
  {
    x -= vx;
    image(bacteria, x,y,r,r);
  }
}
//////////////////////////////

