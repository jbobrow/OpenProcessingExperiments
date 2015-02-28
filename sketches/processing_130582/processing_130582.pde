
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int radius;
int c=125;
int grow;
int xchange;
int ychange;
 
   
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
  background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
    diff();
    velo();
    rectMode(CENTER);
    if (ypos.size() <= 5)                            // 0-5 Works
    {
      fill(100);
      ellipse(xpos.get(i),ypos.get(i),40 + grow,40 + grow);
    }
    if (ypos.size() > 5 && ypos.size() <= 10)        // 5-9 Works 
    {
      if (ypos.size() % 2 == 0)
      {
        fill(250);
        rect(xpos.get(i),ypos.get(i),40 + grow,40 + grow);
      }
      else
      {
        if (ypos.size() % 7 == 0)
        {
          background(250);
          fill(250);
          ellipse(xpos.get(i),ypos.get(i),40 + grow,40 + grow);
        }
        else
        {
          background(0);
          fill(250);
          ellipse(xpos.get(i),ypos.get(i),40 + grow,40 + grow);
        }
      }
    }
     if (ypos.size() > 10 && ypos.size() < 15)        // 10- 15 Works
      {
        if (ypos.size() % 2 == 0)
        {
          fill(155,255,200);
          rect(xpos.get(i),ypos.get(i),40 + grow,40 + grow);
         }
        else
        {
          if (ypos.size() % 7 == 0)
        {
          background(250);
          fill(155,255,200);
          ellipse(xpos.get(i),ypos.get(i),40 + grow,40 + grow);
        }
        else
        {
          background(0);
          fill(155,255,200);
          ellipse(xpos.get(i),ypos.get(i),40 + grow,40 + grow);
        }
      }
    }
      xpos.set(i,xpos.get(i)+xvelocity.get(i));
      ypos.set(i,ypos.get(i)+yvelocity.get(i));    //Warp code Works
      if (xpos.get(i) > width)
      {
        xpos.set(i,0);
      }
      if (xpos.get(i) < 0 )
      {
        xpos.set(i,width);
      }
      if (ypos.get(i) > width)
      {
        ypos.set(i,0);
      }
      if (ypos.get(i) < 0 )
      {
        ypos.set(i,width);
      }
  }
  if (ypos.size() == 15)                        //Restarts works
  {
    xpos.clear();
    ypos.clear();
  }
  if (xpos.size() == 5)
  {
    xvelocity.clear();                   
    yvelocity.clear();
    xvelocity.add(1);
    yvelocity.add(0);
    ychange = 0;
    xchange = -1;
  }
  if (xpos.size() == 9)
  {
    xvelocity.clear();                   
    yvelocity.clear();
  }
  if (xpos.size() == 0)
  {
    ychange = 0;
    xchange = 1;
    xvelocity.clear();                   
    yvelocity.clear();
  }
}
  
void mouseClicked()
{
  xchange = 1;
  ychange = 0;
  xpos.add(mouseX);
  ypos.add(mouseY);
  xvelocity.add(1);
  yvelocity.add(0);
}
 
 
void velo()                                //Velocity speeds
{
  if (xpos.size() >= 0 && xpos.size() < 5)         //Working.
  {
    xchange = xchange * -1;
    ychange = ychange + 1;
    xvelocity.add(xchange);
    yvelocity.add(ychange);
  }
  if (xpos.size() >= 5 && xpos.size() < 9)        //Too fast with y value
  {
    xchange = xchange * -1;
    ychange = ychange - 1;
    xvelocity.add(xchange);
    yvelocity.add(ychange);
  }
  if (xpos.size() >= 9 && xpos.size() < 15)
  {
    xvelocity.add(int(random(-5, 5)));          //Spazzz at 9
    yvelocity.add(int(random(-5, 5)));
  }
}
 
 
 
 
void diff()                                  //Works
{
      if (keyPressed)
  {
    if (key == 's')
    {
      grow = 0;    
    }
  }
    if (keyPressed)
  {
    if (key == 'd')
    {
      grow = grow + 1;    
    }
  }
    if (keyPressed)
  {
    if (key == 'a')
    {
      grow = grow - 1;
    }
  }
}

