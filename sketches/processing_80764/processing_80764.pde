
void setup()
{
  size(600,600);
  background(0);
}

void draw()
{
  if(key=='q')
  {
    background(9, 65, 124);
  }
  if(key=='w')
  {
    fill(142,13,13);
  ellipse(mouseX, mouseY, 30, 30);
  fill(124,112,9);
  ellipse(width-mouseX, height-mouseY, 30, 30);
  }
 
 

}




