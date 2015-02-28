
int Size;

void setup() 
{
  Size = 9;
  size(800,800);
  smooth();
  stroke(255, 255, 255);
  background(0);
  frameRate(999999999);
}

void draw() 
{
  if (Size <= 1)
  {
    Size = Size + 5;
  }
  if (mousePressed == true) 
  {
    line(mouseX, mouseY, mouseX, mouseY);
  } 
  strokeWeight(Size);
}

void keyPressed()
{
  if (key == 'r' || key == 'R')
  {
    background(0);
  }
  if (key == 'c' || key == 'C')
  {
    stroke(random(255), random(255), random(255));
  }
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      Size = Size + 5;
    } else if (keyCode == DOWN) {
      Size = Size - 5;
    }
  }
}

