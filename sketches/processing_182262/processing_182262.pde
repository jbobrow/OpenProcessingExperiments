
void setup()
{
  size(800,600);
  background(254,255,64);
}

void draw()
{
  strokeWeight(1);
  stroke(0,map(mouseX,0,800,0,255)); 
  line(100,100,mouseX,mouseY);
}
