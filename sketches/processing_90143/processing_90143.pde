
class Encre
{
  float x, y ;
  float dry ;
  float radius ;
  
  Encre (float x, float y, float dry, float radius )
  {
    this.x = x ;
    this.y = y ;
    this.dry = dry ;
    this.radius = radius ;
  }
  /*
  float dry() 
  {
    return dry ;
  }
  */
  void jitter()
  {
    if (radius > 0 ) radius -= dry ;
    float rad;
    float angle;
    {
      // rad = prng.random() * radius;
      //angle = prng.random() * ( 2 * PI );
      rad = random(-1,1) * radius;
      angle = random(-1,1) * ( 2 * PI );
      x += rad * cos(angle);
      y += rad * sin(angle);
    }
  }
  
}

