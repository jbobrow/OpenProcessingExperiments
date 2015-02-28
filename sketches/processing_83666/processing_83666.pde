
void setup()
{
size(400, 600);
background(0, 0, 0);
smooth();
}

void draw()
{
stroke(255, 255, 255);
noFill();
ellipse(mouseX, mouseY, mouseX, mouseY);
line(0, 0, mouseX , mouseY);
}
