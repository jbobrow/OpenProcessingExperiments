
Pixel[] grid;
float maxX;
float maxY;

int pixelSize = 12;

float timer;
float timerInc = .02;
void setup()
{
  size(600, 600);
  frameRate(60);
  int pixelsX = 50;
  int pixelsY = 50;
  noStroke();
  grid = new Pixel[pixelsX * pixelsY];

  for (int  i = 0; i < grid.length; i++)
  {
    grid[i] = new Pixel();
    grid[i].index = i % 3;
    grid[i].y = (int)(i / pixelsX) * pixelSize;
    grid[i].x = (int)(i % pixelsX) * pixelSize;

    maxX = max(grid[i].x, maxX);
    maxY = max(grid[i].y, maxY);
  }
}

void draw()
{
  timer += timerInc;

  for (int i = 0; i < grid.length;i++)
  {
    float maxDist = dist(width/2, height /2, maxX, maxY);
    float t = dist(width/2, height/2, grid[i].x, grid[i].y) / maxDist;

    float hue = (720 * t) - timer * 2000;
    while (hue < 0)
      hue += 360;

    grid[i].SetColor(hue);
    grid[i].Draw();
  }
}

class Pixel
{
  public float r = 255;
  public float g = 255;
  public float b = 255;
  public float x;
  public float y;

  public int index;
  public void Draw()
  {
    float fluc = 0;
    float inc = pixelSize / 3;
    SetFill(0);
    rect(x + random(-fluc, fluc), y + random(-fluc, fluc), pixelSize, inc);
    SetFill(1);
    rect(x + random(-fluc, fluc), y + inc + random(-fluc, fluc), pixelSize, inc);
    SetFill(2);
    rect(x + random(-fluc, fluc), y + inc * 2 + random(-fluc, fluc), pixelSize, inc);
  }

  void SetFill(int subPixIndex)
  {
    if (subPixIndex == 0)
      fill(r, 0, 0);
    else if (subPixIndex ==1)
      fill(0, g, 0);
    else
      fill(0, 0, b);
  }

  public void SetColor(float r, float g, float b)
  {
    this.r = r;
    this.g = g;
    this.b = b;
  }
  public void SetColor(float h)
  {
    float v = 255;
    
    
    float s = lerp(0, 1, timer);
    if ((int)s % 2 == 0)
      s %= 1;
    else
      s = 1 - s % 1;
    int hi = floor(h / 60.0) % 6;
    float f =  (h / 60.0) - floor(h / 60.0);
    float p = v * (1.0 - s);
    float q = v * (1.0 - (f*s));
    float t = v * (1.0 - ((1.0 - f) * s));

    if (hi == 0)
      SetColor(v, t, p);
    else if (hi ==1)
      SetColor(q, v, p);
    else if (hi == 2)
      SetColor(p, v, t);
    else if (hi == 3)
      SetColor(p, q, v);
    else if (hi == 4)
      SetColor(t, p, v);
    else
      SetColor(v, p, q);
  }
}



