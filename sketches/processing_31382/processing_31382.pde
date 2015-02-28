
void setup()
{
  size(800,800);
  background(255);
  smooth();
}
void draw()
{
 background(255);
  line(0,0,mouseX,mouseY);
  line(800,800,mouseX,mouseY);
  line(800,0,mouseX,mouseY);
  line(0,800,mouseX,mouseY);
  line(0,400,mouseX,mouseY);
  line(400,0,mouseX,mouseY);
  line(400,800,mouseX,mouseY);
  line(800,400,mouseX,mouseY);
  
}

