
//Eli N-M, CP1 4-5, User Input
void setup()
{
  smooth();
  size(500,500);
  background(0);

  
}
void draw()
{
  int num = int(random(150,256));
  fill(num,num,130);
  text("PRESS X TO ERASE, RIGHT CLICK FOR RECTANGLES, LEFT CLICK FOR ELLIPSES",20,200);
}
void mouseDragged()
{
  if(mouseButton==LEFT)
  {
    fill(190,mouseY,mouseX);
    ellipse(mouseX,mouseY,50,mouseX);
  }
   if(mouseButton==RIGHT)
  {
    fill(mouseY,mouseX,140);
    rect(mouseX,mouseY,mouseY,50);
  } 
}
void keyPressed()
{
  if(key=='x')
  {
    background(0);
  }
}
