
void setup()
{
  size (200, 200);
}

void draw()
{
if (mouseX > 20 && mouseX < 60 && mouseY > 160 && mouseY < 180)
{
  background (255);
}
else background (0);
fill (255, 255, 0);
rect (80, 40, 40, 40);
rect (80, 90, 40, 60);
fill (255, 0, 0);
ellipseMode(CENTER);
ellipse (100, 105, 10, 10);
ellipse (100, 135, 10, 10);
fill (0, 0, 255);
ellipse (90, 50, 10, 10);
ellipse (110, 50, 10, 10);
triangle(100, 60, 110, 70, 90, 70);
fill (255);
rect (20, 160, 40, 20);
}
