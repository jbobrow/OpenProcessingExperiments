
void setup()
{
    size(400,500);
    smooth();
}
void draw()
{
    if(mousePressed)
    {
       background(255);
    }
    else
    {
      fill(mouseX-100, mouseY-200, (mouseX+mouseY)/2);
      ellipse(mouseX,mouseY,50,50);
    }
}
