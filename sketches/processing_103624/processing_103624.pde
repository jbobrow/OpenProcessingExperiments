
float xPos = 0;
float yPos = 0;

void setup ()
{
  size(800, 800);
  background(255);
}

void draw ()
{
  xPos = mouseX;
  yPos = mouseY;
  
  //background(255);
  
  if(mousePressed)
  {
    fill(random(3, 47), random(3, 225), random(252, 253));
    ellipse(xPos, yPos, 50, 50);
  }
  else
  {
    fill(random(3, 122), random(252, 252), random(3, 209));
    ellipse(xPos, yPos, 50, 50);
  }
}

void mouseClicked()
{
  fill(random(197, 252), random(3, 4), random(252, 3));
  ellipse(xPos, yPos, 75, 75);
}
