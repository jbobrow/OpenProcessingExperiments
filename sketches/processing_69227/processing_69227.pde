
void setup()
{
  size(600, 600);
}

void draw()
{
  background(255);
  fill(0);
  line(mouseX, mouseY + 20, mouseX, mouseY - 20);
  line(mouseX + 20, mouseY, mouseX - 20, mouseY);

  ellipse(mouseX + 30, mouseY, 5, 5);
  ellipse(mouseX - 30, mouseY, 5, 5);
  ellipse(mouseX, mouseY + 30, 5, 5);
  ellipse(mouseX, mouseY - 30, 5, 5);
  
}

