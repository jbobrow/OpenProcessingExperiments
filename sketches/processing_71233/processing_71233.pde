
int x=1;
void setup()
{
  size(540,500);
  background(0,0,0,10);
}
void draw()
{
  if (key=='a')
  {
    fill(255,255,255,30);
    stroke(56,203,242);
    rect(pmouseX,mouseY,50,50);
    rect(500-mouseX,mouseY,50,50);
  }
  noStroke();
  if (key=='b')
  {   
    fill(242,153,68,30);
    ellipse(mouseX,mouseY,50,50);
    ellipse(500-mouseX,mouseY,50,50);
  }
  if (key=='y')
  {
    fill(203,23,35,30);
    rect(mouseX,mouseY,40,40);
  }
  if (key=='c')
  {
    fill(75,240,76,30);
    ellipse(mouseX,mouseY,30,30);
  }
}
void mouseMoved()
{
  if (key=='x')
  {
    stroke(100,100,x,50);
    line(mouseX,mouseY,0,0);
    fill(x,50,200,30);
    ellipse(mouseX,pmouseY,20,20);
    x=x+1;
  }
}
void mousePressed()
{
  if (mouseButton==RIGHT)
  {
    fill(255,0,243,30);
    ellipse(mouseX,mouseY,70,70);
  }
}
void mouseDragged()
{
  stroke(255,20,x,50);
  line(mouseX,mouseY,pmouseX,pmouseY);
  x=x+1;
}
/**
  For symmetric orange circle, press "B" to turn on
  
  For red rectangle, press "Y" to turn on
  
  For symmetric white rectangles, press "A" to turn on
  
  For green circle, press "C" to turn on
  
  For changing color circles (blue to purple/pink) with purple line from top left corner attached, press "X" to turn on
  
  For pink circle, press RIGHT MOUSE button to turn on
  
  To draw freely, press and hold LEFT MOUSE button
  
  Press any other key to turn off
*/
