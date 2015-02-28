
void setup()
{
  size(400,600);
  smooth();
}
void draw()
{
 fill(255,25,0,100);
ellipse(mouseY,mouseX,100,100);
fill(0,255,0,100);
ellipse(mouseX,mouseY,100,100);
}
