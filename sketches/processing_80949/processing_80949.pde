
void setup()
{
  size(300,300);
  background(0);
} 

void draw()
{
  {
    if (key=='r') //Press R to reset and then W to continue
    background(0);
  if (key=='w') //press W to start
    {
  fill(222,20,20);    
  rect(mouseX,mouseY,30,30);
  fill(53,222,20);
  ellipse(width-mouseX,mouseY,30,30);
    }
  }
}



