
void setup()
{
size(250,250);
background(#F0FAB1);
}
void draw()
{ 
{
float i = random(1, 500);
line(i, mouseX, i, mouseY);
line(mouseX, i, mouseY, i);
}
}


