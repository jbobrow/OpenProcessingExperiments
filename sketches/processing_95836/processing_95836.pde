
void setup()
{
  size (600, 600); // Size
  background(0); // Background color
  smooth(); // // Improve edge smoothness
}
void draw()
{
  float a=random(155); // Random size of circle
  float b=random(120); // Random size of circle
  stroke (a, random(mouseX/55, mouseY/55), random(mouseX/55, mouseY), 6); // Speed of ring radiation
  strokeWeight(2); // Outline
  fill(10, 158, 255); // Color
  fill(25, 8, 6); // Color
  fill (a, random(mouseX/10,mouseY/10), random(mouseX/10,mouseY), 25); // Color
  ellipse (mouseX, mouseY, b, b); // Shape
}


