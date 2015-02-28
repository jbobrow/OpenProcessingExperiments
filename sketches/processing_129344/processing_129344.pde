
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int radius;
int c=125;
int r;
int g;
int b;
color fillit = color(155, 255, 200);
  
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
    if (keyPressed == true); {
      if (key == ' ') {
        fillit = color(random(155),random(255),random(255));
      }
    }
    if (xpos.size()>10&&xpos.size()<16) {
      fillit = color(0, 0, 255);
    }
    if (xpos.size()>15) {
      background(0);
    }
    fill(fillit);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
  }
}
    
 
void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
}

