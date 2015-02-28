
void setup()
{
  background(0);
  size(400, 400);
}

void draw()
{
  if(mouseX > width/2 + 10 || mouseX < width/2 - 10 || mouseY > height/2 + 10 || mouseY < height/2 - 10)
  {
    background(0);
    int x, y;
    x = mouseX;
    y = mouseY;
    rectMode(CENTER);
    fill(255);
    rect(x, y, 70, 70);
    fill(0);
    rect(x, y, 50, 50);
    fill(0, 255, 0);
    rect(x, y, 20, 20);
    x = x + 1;
    y = y + 1;
  }
  else
  {
    background(0);
  }
}
