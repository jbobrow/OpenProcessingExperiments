
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

  line(mouseX, 20, pmouseX, 80);
  line(mouseX + 40, 20, pmouseX + 40, 80);
  line(mouseX - 40, 20, pmouseX - 40, 80);

  line(mouseX, 580, pmouseX, 520);
  line(mouseX + 40, 580, pmouseX + 40, 520);
  line(mouseX - 40, 580, pmouseX - 40, 520);

  line(20, mouseY, 80, pmouseY);
  line(20, mouseY + 40, 80, pmouseY + 40);
  line(20, mouseY - 40, 80, pmouseY - 40);

  line(580, mouseY, 520, pmouseY);
  line(580, mouseY + 40, 520, pmouseY + 40);
  line(580, mouseY - 40, 520, pmouseY - 40);

  if (mousePressed)
  {
    line(mouseX, mouseY, 0, 0);
    line(mouseX, mouseY, 0, 600);
    line(mouseX, mouseY, 600, 0);
    line(mouseX, mouseY, 600, 600);
  }
}


