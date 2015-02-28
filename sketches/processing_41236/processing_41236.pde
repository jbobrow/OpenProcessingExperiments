
// draw with mouse
int d=0;
int x=1;
int r=100;
int g=100;
int b=100;
void setup()
{
  size(500,500);
  smooth();
}

void draw()
{
  
  fill(r,g,b);
  ellipse(mouseX, mouseY, d,d);
  d = d+x;
  if(d==100)
    x=-x;
  if(d==20)
    x=1;
  
  if(g==255 && b!=255)
  {
    b++;
    r--;
  }
  else if(b==255 && r!=255)
  {
    g--;
    r++;
  }
  else if(r==255 && g!=255)
  {
    b--;
    g++;
  }  
  else
    g++;
}
void mousePressed()
{
saveFrame();
}




