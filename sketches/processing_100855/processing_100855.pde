
float bgHue = 0;
  
void setup()
{
  size(1024, 786);
}

void draw()
{
  colorMode(HSB, 100);
  background(bgHue, 80, 90);
  bgHue = (bgHue + 0.07) % 100;
}
