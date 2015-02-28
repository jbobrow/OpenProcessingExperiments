
//Ryan S, 100 Random Shapes, CP1 mods 16-17
int a=1;
void setup()
{
  size(500, 500);
  background(0);
}
void draw()
{
  while (a<=100) 
  {
    float b=random(width);
    float c=random(height);
    fill(255, 0, 0);
    bezier(b, c, b+5, c-25, b+35, c-25, b+40, c);
    fill(255);
    bezier(b, c, b+5, c+25, b+35, c+25, b+40, c);
    ellipse(b+20, c, 12, 12);
    a++;
  }
}
void mousePressed()
{
  a=1;
  background(0);
}
