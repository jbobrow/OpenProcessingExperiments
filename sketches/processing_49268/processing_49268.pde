
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  strokeWeight(5);
}

void draw()
{
  fill(255,255,255,50);
  rect(0,0,width,height);
  fill(0, 0, 255);
  ellipse(mouseX,mouseY,50,50);
 
}

