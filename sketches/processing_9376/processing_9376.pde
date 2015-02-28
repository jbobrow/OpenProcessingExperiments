
class Wave
{
  float x;
  float y;
  float outerRing;
  float innerRing;
  private boolean released;
  
  Wave(float inX, float inY)
  {
    x = inX;
    y = inY;
    released = false;
    outerRing = 0;
    innerRing = 0;
  }
  
  void onwards()
  {
    if(!released)
      grow();
    else
      ripple();
  }
  
  void release()
  {
    released = true;
  }
  
  private void grow()
  {
    outerRing+=0.02;
  }
  
  private void ripple()
  {
    outerRing+=0.02;
    innerRing+=0.02;
  }
}



