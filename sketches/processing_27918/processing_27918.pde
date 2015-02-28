
class Point
{
  float x;
  float y;
  float z;
  float dir;
  float currDist;
  float maxDist;
  
  Point(float xP, float yP, float zP, float dirIn, float dst)
  {
    maxDist = dst;
    currDist = 0;
    x = xP;
    y = yP;
    z = zP;
    dir = dirIn;
  }
  
  void step(float horiStep)
  {
    if(currDist < maxDist)
    {
      this.x += cos(dir)*horiStep;
      this.y += sin(dir)*horiStep;
      currDist += horiStep;
    }
  }
}

