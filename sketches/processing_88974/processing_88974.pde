
void setup()
{
  size(500, 500);
}

void draw()
{
  if ((mouseX >= width/2 + 10) || (mouseX <= width/2 - 10)) // I tried to make it this include 10 below and above the centre on the Y-axis as well, but I could not get it to work so I simplified it to this.
  {
    background(0);

    fill(0, 0, 255);
    stroke(255);
    ellipse(mouseX, mouseY, 50, 50);

    fill(255, 0, 0);
    noStroke();
    rect(mouseX - 15, mouseY - 15, 30, 30);

    fill(255);
    stroke(255);
    line(mouseX, mouseY - 10, mouseX, mouseY + 10);
    line(mouseX - 10, mouseY, mouseX + 10, mouseY);
  }
  else
  {
    background(255);
  }
}
