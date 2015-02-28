
class FlashingAmbient
{
  private float xPos, yPos, radius;
  private float alphaValue = 0;
  private int c;
  private float kindleFactor;

  FlashingAmbient(float kf)
  {
    kindleFactor = kf;
  }

  boolean isDone()
  {
    return (alphaValue <= 0);
  }

  void init()
  {
    alphaValue = 200;
  }

  float draw()
  {
    dampAlpha();
    return max(0, alphaValue);
  }

  /***
   * it specifies how alpha decreases
   */
  private void dampAlpha()
  {
    if(alphaValue >= 0)
      alphaValue -= kindleFactor;
  } 
}


