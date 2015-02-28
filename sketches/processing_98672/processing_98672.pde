
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
  fill( random(255), random(255), random(255) );
}

void keyPressed()
{
  background(255, 255, 255);
}
