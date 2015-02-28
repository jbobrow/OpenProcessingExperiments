
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
  rectMode(CENTER); 
} 
void keyPressed()
{
 if(key == ENTER)
 {
  background(random(100,255));
 }
}
void draw()
{
  strokeWeight(10);
  stroke(100,255,200);
  background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
    fill(255,0,0);
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
     xpos.set(i,xpos.get(i)+xvelocity.get(i));
     ypos.set(i,ypos.get(i)+yvelocity.get(i));
    }
    if(xpos.size() % 2 != 0)
    {
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
      xpos.set(i,xpos.get(i)+xvelocity.get(i));
      ypos.set(i,ypos.get(i)+yvelocity.get(i));
    }
    if(xpos.size() % 7 == 0)
    {
     background(255); 
    }
    if (xpos.get(i) > width)
    {
      xpos.set(i,0);
    }
    if (xpos.get(i) < 0)
    {
     xpos.set(i,width); 
    }
    if (ypos.get(i) < 0)
    {
     ypos.set(i,height); 
    }
    if (ypos.get(i) > height)
    {
     ypos.set(i,0); 
    }
    if(xpos.size() > 14)
    { 
     xpos = new ArrayList<Integer>();
     ypos = new ArrayList<Integer>(); 
    }
  }
  velocity();
}
void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
  xvelocity.add(1);
  yvelocity.add(-1);
}
void velocity()
{
  One();
  Two();
  Three();
  Four();
  Five();
  Six();
  Seven();
  Eight();
  More();
}
void One()
{
 if(xpos.size() == 1)
{
 xvelocity.add(0);
 yvelocity.add(1);
} 
}
void Two()
{
 if(xpos.size() == 1)
{
 xvelocity.add(-1);
 yvelocity.add(1);
} 
}
void Three()
{
 if(xpos.size() == 3)
{
 xvelocity.add(1);
 yvelocity.add(2);
} 
}
void Four()
{
 if(xpos.size() == 4)
{
 xvelocity.add(-1);
 yvelocity.add(3);
} 
}
void Five()
{
 if(xpos.size() == 5)
{
 xvelocity.add(-1);
 yvelocity.add(0);
} 
}
void Six()
{
 if(xpos.size() == 6)
{
 xvelocity.add(1);
 yvelocity.add(-1);
} 
}
void Seven()
{
  if(xpos.size() == 7)
  {
   xvelocity.add(-1);
  yvelocity.add(-2); 
  }
}
void Eight()
{
 if(xpos.size() == 8)
{
 xvelocity.add(1);
 yvelocity.add(-3);
} 
}
void More()
{
 if(xpos.size() > 8)
{
 xvelocity.add(int(random(-5,5)));
 yvelocity.add(int(random(-5,5)));
} 
}

