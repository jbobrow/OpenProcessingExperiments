
void setup()
{
  size(500, 500);
  background(0);
  noStroke();
}

void draw()
{
  myEllipse();
}

void myEllipse()
{
  if(key=='r')
  {
    background(0);
  }
  if (mousePressed==true)
  {
    fill(mouseX,mouseY,255-mouseY);
    ellipse(mouseX,mouseY,25,25);
    fill(255-mouseX,mouseY,mouseX);
    ellipse(500-mouseX,mouseY,25,25);
    fill(mouseX,255-mouseX,mouseY);
    ellipse(500-mouseX,500-mouseY,25,25);
    fill(mouseY,255-mouseY,255-mouseX);
    ellipse(mouseX,500-mouseY,25,25);
  }
}

/**
Press:<br>
-mouse and drag around.<br>
-"re" to clear page.<br>
Have fun!
*/
