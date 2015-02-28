
class Ball
{
  PVector loc, vel;
  color clr;
  float size=random(15,20);
  Ball(float x,float y,float vx,float vy,color clr)
  {
    loc=new PVector(x,y);
    vel=new PVector(vx,vy);
    this.clr=clr;
  }
  void show()
  {
    noStroke();
    fill(clr);
    ellipse(loc.x,loc.y,size,size);
    loc.add(vel);
    if (loc.x<size/2)
    {
      vel.x*=-1;
      loc.x=size/2;
    }
    else if (loc.x>width-size/2)
    {
      vel.x*=-1;
      loc.x=width-size/2;
    }
    if (loc.y<size/2)
    {
      vel.y*=-1;
      loc.y=size/2;
    }
    else if (loc.y>height-size/2)
    {
      vel.y*=-1;
      loc.y=height-size/2;
    }
    vel.y+=gravity;
  }
}

