
void setup()
{
size(400,400);
background(0,0,0);
smooth();
}

void draw()
{
stroke(random(168),random(86),random(212));
line(mouseX, mouseY, mouseX, mouseY);
strokeWeight(50);
smooth();
}
