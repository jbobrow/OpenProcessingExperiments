
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int radius;
int c=125;

void setup()
{
  radius = 20;
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();

}
 
void draw()
{
  if (xpos.size() % 2 == 1)
   background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
    fill(155,255,200);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    if (xpos.get(i) > width)
    {
      xpos.set(i,0);
    }
  

  if (xpos.size() > 5)
  {
    fill(225);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));

  }

   if (xpos.size() > 10)
   {
    fill(0,0,204);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));

   }

   if(xpos.size() % 2 == 0)
   {
    rectMode(CENTER);
    rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    if (xpos.get(i) > width)
    {
      xpos.set(i,0);
    }
     
     if (xpos.size() > 5)
    {
      fill(225);
      rectMode(CENTER);
      rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
      xpos.set(i,xpos.get(i)+xvelocity.get(i));
      ypos.set(i,ypos.get(i)+yvelocity.get(i));
      
    }
      if (xpos.size() > 10)
    {
      fill(0,0,204);
      rectMode(CENTER);
      rect(xpos.get(i),ypos.get(i),radius*2,radius*2); 
      xpos.set(i,xpos.get(i)+xvelocity.get(i));
      ypos.set(i,ypos.get(i)+yvelocity.get(i));

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
  xvelocity.add(1);
  yvelocity.add(-1);
}



  

