
class Ball
{
  PVector pos,vel,acc;
  float radius;
  float gravity = .02;
  float h;
  Ball()
  {
    radius = random(10,35);
    pos = new PVector(-radius,-radius);
    vel = new PVector(random(.5,1),0);
    acc = new PVector(0,gravity);
  }
  void update(float[][] inxs)
  {
    pos.add(vel);
    vel.add(acc);
    checkBounce();
    render();
    if((int)pos.x%1==0 && (int)pos.x>0 && (int)pos.x<width)
    {
      inxs[(int)pos.x/1][0] +=pos.y;
      inxs[(int)pos.x/1][1] ++;
    }
  }
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    colorMode(HSB,360);
    fill(h,360,360);
    ellipse(0,0,radius,radius);
    colorMode(RGB,255);
    popMatrix();
  }
  void checkBounce()
  {
    if(pos.y>height-radius/2)
    {
      pos.y = height-radius/2;
      vel.y*=-map(radius,10,40,.9,.6);
    }
  }
}


