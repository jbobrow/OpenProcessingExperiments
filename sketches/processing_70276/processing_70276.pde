
/* Christopher N, User Input, CP1 Mods 4-5
 Url: http://cnprogramming.webs.com */
/**
 User Input<p>
 Holding 'T' while right clicking once enables a T shape.<br>
 Holding 'S' while right clicking once enables a rectangle.<p>
 Pressing 'r' causes the screen to "reset".
 */

void setup()
{
  background(255);
  size(500, 500);
  //int x = 0;
  //float r = 0;
  //float g = 0;
  //float b = 255;
  //while (x<500)
  //{
  //stroke(r, g, b);
  //line(x, 0, x, 500);
  //x = x+1;
  //r=r+(255-0)/500.0;
  //g=g+(0-0)/500.0;
  //b=b+(0-255)/500.0;
  //}
}
void draw()
{
  cursor(CROSS);
  //fill(mouseX,0,255-mouseX);
  //ellipse(mouseX,mouseY,30,30);
}

void keyPressed()
{
  if (key == 'r') {
    background(255);
  }
  if (key == 'T') {
    if (mouseButton==RIGHT)
    {
      fill(0);
      beginShape();
      vertex(mouseX, mouseY);
      vertex(mouseX+5, mouseY);
      vertex(mouseX+5, mouseY+10);
      vertex(mouseX+15, mouseY+10);
      vertex(mouseX+15, mouseY+20);
      vertex(mouseX-15, mouseY+20);
      vertex(mouseX-15, mouseY+10);
      vertex(mouseX-5, mouseY+10);
      vertex(mouseX-5, mouseY);
      endShape();
    }
  }
  if (key =='S') {
    if (mouseButton==LEFT)
    {
      rect(mouseX, mouseY, 10, 10);
    }
  }
}

  void mousePressed()
  {
    if (mouseButton==LEFT)
    {
      fill(mouseX, 0, 255-mouseX);
      ellipse(mouseX, mouseY, 30, 30);
    }
  }

  void mouseDragged()
  {
    ellipse(mouseX, mouseY, 30, 30);
  }
