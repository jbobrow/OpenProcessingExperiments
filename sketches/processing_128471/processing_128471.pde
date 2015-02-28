
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int radius;
int c=125;


  
void setup()
{
  radius = 20;
  size(600,600);
  background(162,162,162);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>  ();
}
  
void draw()
{
  background(162,162,162);
  for (int i = 0; i < xpos.size() ; i++)
  {
    fill(155,255,200);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    if (xpos.size() % 7 == 0)
    {
      background(255);
    }
    if (xpos.size() > 4)
    {
      fill(255,255,255);
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
    if (xpos.size() > 10)
    {
      fill(0,0,255);
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
    if (xpos.size() % 2 == 0)
    {
      rectMode(CENTER);
      rect(xpos.get(i),ypos.get(i),45,45);
    }
    if (keyPressed == true)
    {
      fill(random(255),random(255),random(255));
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
      if (xpos.size() % 2 == 0)
      {
        rectMode(CENTER);
        rect(xpos.get(i),ypos.get(i),45,45);
      }
    }     
    if (xpos.size() > 14)
    {
      background(162,162,162);
      xpos.clear();
      ypos.clear();
    }
     
  }

}
 
void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
  
  
}

