
class Automata
{
  private PImage img;
  float startTimeX, startTimeY, speedX, speedY;
  int dirX = 1, dirY = 1, maxA;

  Automata (int w, int h, int maxA, float speedX, float speedY)
  {
    this.maxA = maxA;
    startTimeX = random (1000);
    startTimeY = random (1000);
    this.speedX = speedX;
    this.speedY = speedY;
    createNoiseImage (w, h);
  }

  void changeDirX ()
  {
    dirX *= -1;
  }

  void changeDirY ()
  {
    dirY *= -1;
  }

  void update (float sx, float sy)
  {
    startTimeX+= sx*dirX;
    startTimeY+= sy*dirY;
   createNoiseImage(img.width, img.height);
  }

  void createNoiseImage (int w, int h)
  {
    if (img == null) img = createImage(w, h, ARGB);
    float timeX = startTimeX, timeY = startTimeY;
    float minVal = 255, maxVal = -2;
    float [] val = new float [w*h];
    int k = 0;
    img.loadPixels();
    noiseDetail (4, 0.6);
    for (int i = 0; i < img.height; i++)
    {
      timeX = startTimeX;
      for (int j = 0; j < img.width; j++)
      {
        val [k] = noise (timeX, timeY);
        if (val [k] > maxVal) maxVal = val [k];
        if (val [k] < minVal) minVal = val [k];
        k++;
        timeX+=speedX;
      }
      timeY+=speedY;
    }
    k = 0;

    for (int i = 0; i < img.height; i++)
    {
      for (int j = 0; j < img.width; j++)
      {
        val [k] = map  (val [k], minVal, maxVal, 0, maxA);
        //if (k == 10) println ("create: " + val [k]);
        img.pixels[k] = color (255, 255, 255, val[k]);
        k++;
      }
    }

   img.updatePixels();

  }

  void draw ()
  {
    image (img, 0, 0);
  }
}


