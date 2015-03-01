

int hw = 0;
int hh = 0;
double d = 0;

void setup()
{
  colorMode(RGB);
  size(400, 400);
  
  hw = width / 2;
  hh = height / 2;
  
  fill(0, 0, 0, 48);
  textSize(100);
}

void draw()
{
  d += 0.2;
  background(0);
  color c;
  int t;
  loadPixels();
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      int tx = x - hw;
      int ty = y - hh;
      
      double deg = tx * tx + ty * ty + d;
      t = (int)((sin((float)deg)) * 255);
      c = color(t, t, t);
      pixels[y * width + x] = c;
    }
  }
  updatePixels();
  
  
  text("Advent Calendar", sin((float)d / 10.0 +   0) * 600 + 50, hw - 120);
  text("Advent Calendar", sin((float)d / 10.0 + 100) * 600 + 50, hw - 60);
  text("Advent Calendar", sin((float)d / 10.0 + 200) * 600 + 50, hw);
  text("Advent Calendar", sin((float)d / 10.0 + 300) * 600 + 50, hw + 60);
  text("Advent Calendar", sin((float)d / 10.0 + 400) * 600 + 50, hw + 120);
  text("Advent Calendar", sin((float)d / 10.0 + 500) * 600 + 50, hw + 180);
}
