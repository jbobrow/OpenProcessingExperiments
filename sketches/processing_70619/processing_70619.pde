
void setup()
{
  strokeWeight(2);
  size(640,480);
  background(50,50,50,30);
  
}


void draw()

{
  
  stroke(mouseY, 120, mouseX, 70);
  line(0,200, mouseX,mouseY);
  line(mouseX,mouseY,200,480);
  line(mouseX,mouseY,640,320);

  
}

