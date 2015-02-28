
void setup()
{
  size(800, 600);
}


void draw()
{
   for (int i = 0; i <= 1; i++)
  {
    int r = (int) random(50, 255);
    int g = (int) random(50, 255);
    int b = (int) random(50, 255);
    float size = random(0, 800);
    float x = random(0, 800);
    float y = random(0, 600);
      
    drawCircle(x, y, size, color(r, g, b));
    
  } 
}


void drawCircle(float x, float y, float size, color circleColor)
{
  fill(circleColor);
  text(x, y, size, size);
}
