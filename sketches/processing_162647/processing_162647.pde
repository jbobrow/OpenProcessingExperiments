
void setup()
{
  size(600,600);
  background(255);
}

void draw()
{
  if (mousePressed) {
    float size = random(10,100);
    float clr = random(0, 255);
    background(mouseY, frameRate, mouseX, 100);
    fill(mouseX, mouseY, clr);
    ellipse(mouseX, mouseY, size, size);
  }
}
