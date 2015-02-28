
int SIZE = 400;
int middleX, middleY;
int sideNb = 2;
boolean bGrowing = true;
int MAX_SIDE_NB = 32;
int lastTime;
int DISPLAY_TIME = 1000; // One second per polygon

void setup()
{
  size(820, 820);
  smooth();
  textFont(createFont("Arial", 18));
  
  middleX = width / 2;
  middleY = height / 2;
}

void draw()
{
  if (millis() - lastTime > DISPLAY_TIME)
  {
    lastTime = millis();
    if (bGrowing)
    {
      sideNb++;
      if (sideNb == MAX_SIDE_NB)
      {
        bGrowing = false;
      }
    }
    else
    {
      sideNb--;
      if (sideNb == 3)
      {
        bGrowing = true;
      }
    }
  }
  else
  {
    return;
  }

  background(255);
  stroke(#8855CC);
  fill(#552288);
  text(sideNb, 10, 30);
  
  float angleStart = -PI / 2;
  float angleStep = TWO_PI / sideNb;
  float a = angleStart;
  float px = middleX;
  float py = middleY - SIZE;
  float[][] corners = new float[sideNb+1][2];
  for (int i = 0; i <= sideNb; a += angleStep, i++)
  {
    float x = middleX + SIZE * cos(a);
    float y = middleY + SIZE * sin(a);
    line(px, py, x, y);
    px = x;
    py = y;
    corners[i][0] = x;
    corners[i][1] = y;
  }
  for (int i = 0; i < sideNb; i++)
  {
    for (int j = i + 1; j < sideNb; j++) // Thanks, kooogy!
    {
      line(corners[i][0], corners[i][1], corners[j][0], corners[j][1]);
    }
  }
}
