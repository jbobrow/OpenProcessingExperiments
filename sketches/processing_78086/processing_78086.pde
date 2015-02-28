
void setup()
{
  size(800, 600);
  background (0);
}

void draw()
{
  float a = random(25);
  frameRate(120);
  noStroke();
  ellipse(mouseX, mouseY, a, a);
  if (mousePressed) {
    fill(random(255), random(255), random(255));
  } 
}
