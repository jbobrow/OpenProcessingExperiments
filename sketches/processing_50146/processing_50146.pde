
// Homework #3
// Jung Lim copyright 2012

void setup()
{
  size(400, 400);
  smooth();
  background(219, 247, 97);
  noStroke();
  
}

void draw()
{
if (mousePressed == true) {
  fill(0, 0, 0);
} else {
  fill(255, 255, 255);
}
triangle(mouseX - random(0, 20), mouseY + random(0, 10), mouseX + random(0, 10), mouseY - random(0,20), mouseX + random(0, 20), mouseY + random(0, 10));
}
