
int nHoriz;
int nNested;
float minProp = .125f;


void setup()
{
  smooth();
  size(640, 480);
  nHoriz = 7;
  nNested = 10;
}

void draw()
{
  
  background(0);
  stroke(255);
  for (int  i = 0; i < nHoriz; i++)
  {
    float w = width / nHoriz;
    float h = w * .75f;
    float x = (width / nHoriz) * i;
    float y = height / 2 + h /2;

    for (int j = 0; j < nNested; j++)
    {
      float t = ((float)j) / (nNested - 1);
      float scale = lerp(1.0f, minProp, t);      
      DrawArc(x, y, w, h, scale, i % 2 == 1, i < nHoriz - 2);
    }
  }
}

void DrawArc(float x, float y, float w, float h, float scale, boolean flip, boolean drawExtra)
{
  if (flip)
    h *= -1;

  float insideW = w * scale;
  float insideH = h * scale;
  float insideX = x + w / 2 - insideW / 2;
  noFill();
  bezier(insideX, y, insideX, y - insideH, insideX + insideW, y - insideH, insideX + insideW, y);

  if (drawExtra)
  {
    bezier(insideX, y, insideX, y + insideH + h, insideX + w * 2, y + insideH + h, insideX + w * 2, y);
    bezier(insideX + insideW, y, insideX + insideW, y + insideH + h, insideX + insideW + w * 2, y + insideH + h, insideX + insideW + w * 2, y);
  }
}



