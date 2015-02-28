
// AlanChen
//mousedrag
//14/15ComputerProgrammingClass
//http://alansprogrammingsite.webs.com/

void setup()
{
  size(500,500);
  background(0);

}
void draw()
{
}

void mouseDragged()
{
  if (mouseButton==RIGHT)
  {
  fill(90,76,250);
  stroke(255,46,75);
  rect(mouseX,mouseY,40,40);
  }
  if (mouseButton==LEFT)
  {
  fill(73,255,45);
  stroke(255,75,255);
  ellipse(mouseX,mouseY,40,40);
  }
}
void keyPressed()
{
  if (key=='a')
  {
    stroke(255);
    fill (242,250,40);
    ellipse(pmouseX, pmouseY, 40, 40);
    
  }
  if (key=='s')
  {
    stroke(255);
    fill (240,99,184);
    rect(pmouseX, pmouseY, 40, 40);
    
  }
}
