
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw()
{
  ellipse(mouseX, mouseY, 20, 20); 
}

void mousePressed()
{
  fill( random(255), random(255), random(255) );
}
