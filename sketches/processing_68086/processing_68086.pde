
class Spirograph
{
  int centerX = width/2;
  int centerY = height/2;

  float R1, R2, ro;
  float x, y, oldX, oldY;

  boolean first;


  Spirograph(float R1, float R2, float ro)
  {
    this.R1 = R1;
    this.R2 = R2;
    this.ro = ro;

    first = true;
  }

  public void drawIterations(int iter, float incr, int R, int G, int B, int alph, float type, boolean grad)
  {
    float rads = 0.0;

    for (int i = 0; i < iter; ++i)
    {
      if (grad)
      {
        stroke(sin(PI * i / iter) * R, sin(PI * i / iter) * G, sin(PI * i / iter) * B, alph);
      } else
      {
        stroke(R, G, B, alph);
      }

      switch((int)type)
      {
        case 1:
          drawPointInside(rads);
          break;
        case 2:
          drawPointOutside(rads);
          break;
      }

      rads += incr;
    }
  }

  private void drawPointInside(float rads)
  {
    float x = centerX + (R1 - R2) * cos(rads) + ro * cos((R1 - R2) / R2 * rads);
    float y = centerY + (R1 - R2) * sin(rads) - ro * sin((R1 - R2) / R2 * rads);

    if (first)
    {
      first = false;
    } else
    {
      line(oldX, oldY, x, y);
    }

    oldX = x;
    oldY = y;
  }

  private void drawPointOutside(float rads)
  {
    float x = centerX + (R1 + R2) * cos(rads) - ro * cos((R1 + R2) / R2 * rads);
    float y = centerY + (R1 + R2) * sin(rads) - ro * sin((R1 + R2) / R2 * rads);

    if (first)
    {
      first = false;
    } else
    {
      line(oldX, oldY, x, y);
    }

    oldX = x;
    oldY = y;
  }
}


