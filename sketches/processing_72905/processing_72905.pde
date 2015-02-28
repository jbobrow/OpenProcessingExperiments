
//Matheson G. Computer Programming 1 Mods:14/15
int x=10;
float y=5;
int changex=1;
float changey=.5;  
int direction=1;
void setup()
{
  size(300, 300);
}
void draw()
{if (mouseButton==LEFT)
  {
    stroke(0,0,0);
    noFill();
    ellipse(random(300), random(300), x, y);
    x=x+direction*changex;
    y=y+direction*changey;
    if((x==50)||(x==10))
    { direction=-direction;}
    
    
    
    
  }
}
void mouseDragged()
{

  if (mouseButton==RIGHT)
  { stroke(255,255,255,10);
    ellipse(random(300), random(300), 50, 30);
  }
}
