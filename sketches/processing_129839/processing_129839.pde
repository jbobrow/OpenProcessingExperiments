
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int radius;
int c=125;
int speed;
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
    speed();
    velo();
    rectMode(CENTER);
    if (ypos.size() <= 5)                            // 0-5
    {
      fill(100);
      ellipse(xpos.get(i),ypos.get(i),40,40);
    }
    if (ypos.size() > 5 && ypos.size() <= 10)        // 5-9
    {
      if (ypos.size() % 2 == 0)
      {
        fill(250);
        rect(xpos.get(i),ypos.get(i),40,40);
      }
      else
      {
        if (ypos.size() % 7 == 0)
        {
          background(250);
          fill(250);
          ellipse(xpos.get(i),ypos.get(i),40,40);
        }
        else
        {
          background(0);
          fill(250);
          ellipse(xpos.get(i),ypos.get(i),40,40);
        }
      }
    }
     if (ypos.size() > 10 && ypos.size() < 15)        // 10- 15
      {
        if (ypos.size() % 2 == 0)
        {
          fill(155,255,200);
          rect(xpos.get(i),ypos.get(i),40,40);
         }
        else
        {
          if (ypos.size() % 7 == 0)
        {
          background(250);
          fill(155,255,200);
          ellipse(xpos.get(i),ypos.get(i),40,40);
        }
        else
        {
          background(0);
          fill(155,255,200);
          ellipse(xpos.get(i),ypos.get(i),40,40);
        }
      }
    }
      xpos.set(i,xpos.get(i)+xvelocity.get(i));
      ypos.set(i,ypos.get(i)+yvelocity.get(i));    //Warp code
      if (xpos.get(i) > width)
      {
        xpos.set(i,0);
      }
      if (xpos.get(i) == 0)
      {
        xpos.set(i,0);
      }
//      if (ypos.get(i) == 0)            //Untested
//      {
//        xpos.set(0,600);
//      }
  }
  if (ypos.size() == 15)                        //Restarts
  {
    xpos.clear();
    ypos.clear();
  }
  if (xpos.size() == 5)
  {
    xvelocity.clear();                    
    yvelocity.clear();
    ychange = 0;
    xchange = -1;
    xvelocity.add(1);
    yvelocity.add(0);
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
  speed = 0;
  xpos.add(mouseX);
  ypos.add(mouseY);
  xvelocity.add(1);
  yvelocity.add(0);
}


void velo()                                //Velocity speeds
{
  if (xpos.size() >= 0 && xpos.size() < 5)
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




void speed()                                  //Needs tweeking
{
    if (keyPressed)
  {
    if (key == 'd')
    {
      speed = speed + 1;
      xvelocity.add(speed);
      yvelocity.add(speed);
    }
  }
    if (keyPressed)
  {
    if (key == 'a')
    {
      speed = speed - 1;
      xvelocity.add(speed);
      yvelocity.add(speed);
    }
  }
}
