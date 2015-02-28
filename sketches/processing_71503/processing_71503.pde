
//Jinhe Weber, Computer Processing 1, Block 7

void setup()
{
  background(0,0,0);
  size(500,500);
  fill(199,110,232);
  stroke(199,110,232);
}

void draw()
{
}
void mouseDragged()
{
  ellipse(mouseX,mouseY,25,25);
  ellipse(500-mouseX,mouseY,25,25);
}
void keyPressed()
{
  if(key=='g')
  {
    stroke(38,211,114);
    fill(38,211,114);
  }
  if(key=='p')
  {
    stroke(222,13,187);
    fill(222,13,187);
  }
  if(key=='l')
  {
    stroke(199,110,232);
    fill(199,110,232);
  }
}

//Directions: click and drag mouse to draw circles. 
//Press 'g' to change color to green
//Press 'p' to change color to pink
//Press 'l' to change color back to purple
//Refresh page to clear drawing.
