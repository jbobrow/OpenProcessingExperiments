
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int radius;
int p=1;
int c=125;

void setup()
{
  rectMode(CENTER);
  stroke(0);
  radius = 20;
  size(600,600);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();


}


void draw()
{
  background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
    if ((xpos.size()) >= 0 && (xpos.size() <= 5))
    {
      fill(255,0,0);
    }
    if (xpos.size() > 5 && xpos.size() < 10)
    {
      fill(255,255,255);
    }
    {
    if (xpos.size() %3==0)
      fill(random(225),random(255),random(255));
    }
    if (xpos.size() >=10 && xpos.size() <= 15)
    {
      fill(0,0,255);
    }
    
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
     xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    if (xpos.get(i) > width)
    {
      xpos.set(i,0);
    }
    if (xpos.get(i) < 0)
    {
      xpos.set(i,width);
    }
    if (ypos.get(i) > width)
    {
      ypos.set(i,0);
    }
    if (ypos.get(i) < 0)
    {
      ypos.set(i,width);
    }
    {
    if (xpos.size() %2==0)
    rect (xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
    
   
     if (xpos.size() == 1);
    {
      xvelocity.add(1);
      yvelocity.add(0);
    }
     if (xpos.size() == 2);
    {
      xvelocity.add(-1);
      yvelocity.add(1);
    }
     if (xpos.size() == 3);
    {
      xvelocity.add(1);
      yvelocity.add(2);
    } 
     if (xpos.size() == 4);
    {
      xvelocity.add(-1);
      yvelocity.add(3);
    }
     if (xpos.size() == 5);
    {
      xvelocity.add(-1);
      yvelocity.add(0);
    }
     if (xpos.size() == 6);
    {
      xvelocity.add(1);
      yvelocity.add(-1);
    }
     if (xpos.size() == 7);
    {
      xvelocity.add(-1);
      yvelocity.add(-2);
    }
     if (xpos.size() == 8);
    {
      xvelocity.add(1);
      yvelocity.add(-3);
    }
    if (xpos.size() > 8);
    {
      xvelocity.add(int(random(-6,6)));
      yvelocity.add(int(random(-6,6)));
    }
    
    
}
}

void keyPressed()
{
fill(255);
rect(random(600),random(600), 100,100);
}
 
    

void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
  xvelocity.add(1);
  xvelocity.add(3);
  xvelocity.add(-3);
  yvelocity.add(5);

}
