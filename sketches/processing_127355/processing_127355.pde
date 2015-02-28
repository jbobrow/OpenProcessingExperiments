
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int c=125;
int len;
int radius;
void setup()
{
  radius = 20;
  size(1000,1000);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  fill(155,255,200);
  len = 0;
}
 
void draw()
{
  stroke(0,0,0);
  strokeWeight(1);
  int len = xpos.size();
  if (len % 7 == 0)
  {
    background(255,255,255);
  }
  if (len % 7 != 0)
  {
    background(0,0,0);
  }
  if (len % 2 != 0)
  {
    for (int i = 0; i < xpos.size() ; i++)
    {
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
  }
  if (len % 2 == 0)
  {
    for (int i = 0; i < xpos.size() ; i++)
    {
      rectMode(CENTER);
      rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
  }
  if (len > 5 && len < 10)
  {
    fill(255,255,255);
  }
  if (len > 10 && len < 15)
  {
    fill(0,0,255);
  }
  if (len > 15)
  {
    xpos.clear();
    ypos.clear();
    fill(155,255,200);
  }
  if (len > 1 && len < 16)
  {
    strokeWeight(5);
    stroke(255,0,0);
    int linex = xpos.get(len - 1);
    int liney = ypos.get(len - 1);
    int linex2 = xpos.get(len - 2);
    int liney2 = ypos.get(len - 2);
    line(linex,liney,linex2,liney2);
  }
}

void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
}

void keyPressed()
{
  if (key == 'a' && radius > 4)
  {
    radius = radius - 2;
  }
  if (key == 'd' && radius < 100)
  {
    radius = radius + 2;
  }
} 
