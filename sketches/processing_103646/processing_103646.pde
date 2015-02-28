
float xPos = 0;
float yPos = 0;


void setup()
{
  size(800, 800);
  background(255);
}

void draw()
{
  //xPos = xPos + 1;
  //yPos = yPos + 2;
  
  xPos = mouseX;
  yPos = mouseY;
  
  
  if (mousePressed)
  
  
  {
    fill(0);
    rect(xPos, yPos, 50, 50);
  }
  else
  {
    fill(255);
      fill(216, 15, 19);
  ellipse(xPos, yPos, 350, 350);
  fill(250, 107, 35);
  ellipse(xPos, yPos, 300, 300);
  fill(242, 250, 35);
  ellipse(xPos, yPos, 250, 250);
  fill(44, 214, 11);
  ellipse(xPos, yPos, 200, 200);
  fill(34, 61, 209);
  ellipse(xPos, yPos, 150, 150);
  fill(9, 99, 170);
  ellipse(xPos, yPos, 100, 100);
  fill(138, 24, 201);
  ellipse(xPos, yPos, 50, 50);
  fill(0, 0, 0);
  ellipse(xPos, yPos, 10, 10);
  }
  
}


void mouseClicked()
{
  fill(211, 19, 19);
  ellipse(mouseX, mouseY, 100, 100);
}
