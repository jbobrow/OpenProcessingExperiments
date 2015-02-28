
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
  if (xpos.size() % 2 == 1)
   background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
    fill(155,255,200);
    ellipseMode(CENTER);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
  

  if (xpos.size() > 5)
  {
    fill(225);
    ellipseMode(CENTER);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);

  }

   if (xpos.size() > 10)
   {
    fill(0,0,204);
    ellipseMode(CENTER);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2); 

   }

   if(xpos.size() % 2 == 0)
   {
    rectMode(CENTER);
    rect(xpos.get(i),ypos.get(i),45,45);
     if (xpos.size() > 5)
    {
      fill(225);
      rectMode(CENTER);
      rect(xpos.get(i),ypos.get(i),45,45);
    }
      if (xpos.size() > 10)
    {
      fill(0,0,204);
      rectMode(CENTER);
      rect(xpos.get(i),ypos.get(i),45, 45); 

     }
   
  
   }

if (xpos.size() > 15)
{
  xpos.clear();
  ypos.clear();
}
if(xpos.size() % 7 == 0)
{
  background(225);
}

}
}

void mousePressed()
{
  xpos.add(mouseX);
  ypos.add(mouseY);

}

  
