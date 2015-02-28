
void setup()
{
  size(400, 500);
  background(255, 255, 255);
  smooth();
  noStroke();
  frameRate(100);
}

void draw()
{
stroke(255);
  fill(random(98), random(100), random(237), random(75));
  quad(mouseX, mouseY, mouseX, mouseY, 175,150,50,50);
  ellipse(mouseX, mouseY, 35, 35);
}
