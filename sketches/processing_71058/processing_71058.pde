
//Sydney C, User Input, CP1 4/5
int c = 0;
int s = 0;
int r = 0;
int g = 0;
int b = 0;

void setup()
{
  size(400,400);
  fill(255);
  rect(0,0,400,400);
}

void draw()
{
}
void mouseDragged()
{
  strokeWeight(1);
  stroke(0+s);
  s = s + 1;
  if(s>255)
  {
    s = 0;
  }
  fill(34-c,240-c,234-c);
  c = c + 1;
  if(c>240)
  {
    c = 0;
  }
  rect(mouseX,mouseY,70,40);
  ellipse(400-mouseX,mouseY,40,70);
  rect(mouseX,400-mouseY,40,70);
  ellipse(400-mouseX,400-mouseY,70,40);

}
  void keyPressed()
  {
    if(key == 's')
    {
      stroke(245,12,218);
      strokeWeight(3);
      fill(247,181,12);
      rect(mouseX,mouseY,40,40);
      rect(400-mouseX,mouseY,40,40);
    }
    if(key == 'l')
    {
      strokeWeight(4);
      stroke(r,g,b);
      r = r+1;
      g = g+2;
      b = b+3;
      if(b>255)
      {
        r = 240;
        g = 0;
        b = 0;
      }
      if(r>255)
      {
        r = 0;
        g = 240;
        b = 0;
      }
      if (g>255)
      {
        r=0;
        g=0;
        b=240;
      }
      line(mouseX,mouseY,pmouseX,pmouseY);
    }
  }
