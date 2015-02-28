
void setup()
{
size(600,400);
background(0,0,0);
frameRate(20);
fill(5,228,255);
smooth();
}
void draw()
{
ellipse(mouseX,mouseY,mouseX,mouseY);
stroke(255,255,255);
}
