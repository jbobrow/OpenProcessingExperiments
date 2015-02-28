
void setup()
{
size(400, 600);
background(0, 0, 0);
smooth();
}

void draw()
{
stroke(0, 255, 0);
line(0, 0, mouseX, mouseY);
ellipse(mouseX, mouseY, 100, 100);
}
