
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
  if (xpos.size() % 7 == 0) {
    background(255);
  }
  if (xpos.size() % 7 != 0) {
    background(0);
  }
  for (int i = 0; i < xpos.size() ; i++)
  {    
    if (xpos.size() % 2 != 0) {      
      fill(155,255,200);
      if ((xpos.size()>=5)&&(xpos.size()<=10)) {
        fill(255);
      }
      if ((xpos.size()>=11)&&(xpos.size()<=15)) {
        fill(0,0,255);
      }
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
      
    }
    if (xpos.size() % 2 == 0) {
      rectMode(CENTER);
      fill(155,255,200);
      if ((xpos.size()>=5)&&(xpos.size()<=10)) {
        fill(255);
      }
      if ((xpos.size()>=11)&&(xpos.size()<=15)) {
        fill(0,0,255);
      }
      rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
  }
  if (xpos.size()>15) {
    setup();
    }
  }
}
void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
}

