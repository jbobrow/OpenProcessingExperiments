
class XGraph
{
  int centerX = width/2;
  int centerY = height/2;

  float R1, R2, ro;
  float A1, A2, A3, A4;
  float f1, f2, f3, f4;
  float p1, p2, p3, p4;
  float d1, d2, d3, d4;

  float x, y, oldX, oldY;
  float radstep;

  boolean first;


  XGraph(float R1, float R2, float ro,
      float A1, float A2, float A3, float A4,
      float f1, float f2, float f3, float f4,
      float p1, float p2, float p3, float p4,
      float d1, float d2, float d3, float d4)
  {
    this.R1 = R1;
    this.R2 = R2;
    this.ro = ro;

    this.A1 = A1;
    this.A2 = A2;
    this.A3 = A3;
    this.A4 = A4;

    this.f1 = f1;
    this.f2 = f2;
    this.f3 = f3;
    this.f4 = f4;

    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
    this.p4 = p4;

    this.d1 = d1;
    this.d2 = d2;
    this.d3 = d3;
    this.d4 = d4;

    x = 0;
    y = 0;
    oldX = 0;
    oldY = 0;
    radstep = 0;
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
          drawHypotrochoid(rads);
          break;
        case 2:
          drawEpitrochoid(rads);
          break;
        case 3:
          drawHarmonograph(rads);
          break;
      }

      rads += incr;
    }
  }

  public void step(int iter, float incr, int R, int G, int B, int alph, float type, boolean grad)
  {
      stroke(R, G, B, alph);

      switch((int)type)
      {
        case 1:
          drawHypotrochoid(radstep);
          break;
        case 2:
          drawEpitrochoid(radstep);
          break;
        case 3:
          drawHarmonograph(radstep);
          break;
      }

      radstep += incr;
  }

  public void resetStep()
  {
    x = 0;
    y = 0;
    oldX = 0;
    oldY = 0;
    first = true;
  }

  private void drawHypotrochoid(float rads)
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

  private void drawEpitrochoid(float rads)
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

  private void drawHarmonograph(float rads)
  {
    float x = centerX + A1 * sin(rads * f1 + p1) * exp(-1 * d1 * rads) + A2 * sin(rads * f2 + p2) * exp(-1 * d2 * rads);
    float y = centerY + A3 * sin(rads * f3 + p3) * exp(-1 * d3 * rads) + A4 * sin(rads * f4 + p4) * exp(-1 * d4 * rads);

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


