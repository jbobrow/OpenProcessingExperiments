
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
  rectMode(CENTER);
  
}
 
void draw()
{
  strokeWeight(10);
  stroke(100,255,200);
  background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
    fill(random(255),random(255),random(255));
    if((xpos.size() >= 5) && (xpos.size() < 10))
    {
     fill(255,255,255);
    }
    
    if((xpos.size() >= 10) && (xpos.size() < 15))
    {
     fill(0,0,255); 
    }
    if(xpos.size() % 2 == 0)
    {
     rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
     fill(255);
     line(xpos.get(i),ypos.get(i),10,10);
    }
    if(xpos.size() % 2 != 0)
    {
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
      fill(255);
      line(xpos.get(i),ypos.get(i),10,10);
    }
    if(xpos.size() > 14)
    {
     xpos = new ArrayList<Integer>();
     ypos = new ArrayList<Integer>();; 
    }
    if(xpos.size() % 7 == 0)
    {
     background(255); 
    }
  }
}

void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
}
