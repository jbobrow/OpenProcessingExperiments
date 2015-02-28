
int x = 500;
int y = 50;
void setup()
{
  size(500,500);
  background(255);
}

void draw()
{
  for (int i = 0; i < 500; i = i+10) 
  {
    ellipse(i, i, i, i);
  }
  if (mousePressed)
  {
    if (mouseButton == RIGHT)
    {
      fill(random(x),random(x),random(x));
      rect(mouseX,mouseY,y,y);
    }
  }
}
void keyPressed()
{
  if (key == TAB)
  {
    background(random(x));
  }
} 
    

