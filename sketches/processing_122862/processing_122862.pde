
void setup()
{
  size(200,200);
}


void draw()
{
  background(0,150,0);
  stroke(0);
  fill(0);
  rect(mouseX,mouseY,50,50);
  rect(mouseX+100,mouseY,50,50);
  rect(mouseX+50,mouseY+50,50,25);
  rect(mouseX+25,mouseY+75,100,50);
  rect(mouseX+25,mouseY+125,25,25);
  rect(mouseX+100,mouseY+125,25,25);
}
