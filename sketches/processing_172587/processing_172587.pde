
int x = 10;
int y = 10;
void setup()
{
  size(500, 500);
  background(0);
  while (x <= 450)
  {
    fill(255);
    rect(x+9, y+9, 15, 15);
    x=x+50;
    y=y+50;
  }
}

void draw()
{ 
  if (mousePressed) 
  {
    fill(0, 67, 245);
  } else 
  {
    fill(207, 245, 0);
  }
  ellipse(mouseX, mouseY, 30, 30);
}

