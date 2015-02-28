
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int radius;
int c=125;
 
void setup()
{
  radius = 20;
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
}
 
void draw()
{
  background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
    fill(155,255,200);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
  }
}

void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
}

