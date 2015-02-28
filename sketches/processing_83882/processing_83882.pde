
void setup()
{
 size(400, 600);
 background(0, 0, 0);
 smooth();
}

void draw()
{
 stroke(255, 255, 255);
 line(0, 0, mouseX, mouseY);
 stroke(32, 75, 168);
 line(54, 12, mouseX, mouseY);
stroke(random(255),random(255),random(255));
 line(284, 99, mouseX, mouseY);
}
