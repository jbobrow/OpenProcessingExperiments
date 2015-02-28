
public class Branch
{
  PVector pos,pPos;
  float angle;
  float bwidth;
  float bheight;
  
  Branch()
  {
    pos = new PVector(random(width),height);
    pPos = new PVector(width/2,height);
    angle = -HALF_PI;
    bwidth = random(40,70);
    bheight = bwidth*random(6,12)/5;
  }
  
  Branch(float posx , float posy , float pangle , float pwidth)
  {
    pos = new PVector(posx,posy);
    pPos = new PVector(posx,posy);
    angle = pangle;
    bwidth = pwidth;
    bheight = pwidth*random(10,20)/5;
  }
  
  void calculate()
  {
    pPos.set(pos);
    pos.x = pPos.x + 2 * cos(angle+random(-.5,.5));
    pos.y = pPos.y + 2 * sin(angle+random(-.5,.5));
    bheight -= abs(dist(pPos.x,pPos.y,pos.x,pos.y));
    bwidth*=.985;
  }
  
  void display()
  {
    fill(90/2.55,52/2.55,15/2.55);
    ellipse(pos.x,pos.y,bwidth,bwidth);
    float sx = pos.x + bwidth/2*cos(angle-HALF_PI);
    float sy = pos.y + bwidth/2*sin(angle-HALF_PI);
    fill(90/2/2.55,52/2/2.55,15/2/2.55);
    ellipse(sx,sy,bwidth/2,bwidth/2);
  }
}

