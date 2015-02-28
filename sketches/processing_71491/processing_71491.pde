
//Dan-Tran Cong-Huyen, User Input, CP1 16/17, 

/**
Left click and drag to create a symmetrical design with two circles<br>
Right click and drag to create a design with a triangle<br>
Press the 'p' key to erase and start again
*/

void setup()
{
  size(500,500);
}
void draw()
{
  fill(190,125,214,10);
  rect(0,0,500,500);
}
void mouseDragged()
{
  if(mouseButton == LEFT)
  {
  stroke(245,49,173);
  ellipse(mouseX,mouseY,50,50);
  ellipse(500-mouseX,500-mouseY,50,50);
  }
  if(mouseButton == RIGHT)
  {
   noStroke();
   fill(134,194,203);
   triangle(mouseX,mouseY,500-mouseX,500-mouseY,200,350);
  }
}
void keyPressed()
{
  if(key == 'p')
  {
    background(190,125,214,10);
  }
}
