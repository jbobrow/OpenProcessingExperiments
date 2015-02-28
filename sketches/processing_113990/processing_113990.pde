
void setup()
{
size(600, 600);
background(255);
}

void draw()
{
for(int x = 0; x <= width; x = x + 100)
{
  for(int y = 0; y <= height; y = y + 100)
  {
    keywork(x, y);
  }
}
}

void keywork(int x, int y)
{
  noFill();
  strokeWeight(3);
  //stroke(r, g, b);
  ellipse(x, y, 10, 10);
  triangle(x, y-20, x-20, y+13, x+20, y+13);
  ellipse(x, y+25, 10, 10);
  ellipse(x-20, y-13, 10, 10);
  ellipse(x+20, y-13, 10, 10);
  ellipse(x, y-30, 35, 35);
  ellipse(x-22, y+13, 35, 35);
  ellipse(x+22, y+13, 35, 35);
}
