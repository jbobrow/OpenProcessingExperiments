
class Particle
{
  PVector pos,vel;
  float h,r,inf;
  Particle(float x,float y,float ih,float ir)
  {
    pos = new PVector(x,y);
    h = ih;
    r = ir;
    inf = random(1);
    vel = new PVector(random(-2,2),random(-2,2));
  }
  
  void run(int rm)
  {
    checkBounds();
    move();
    render(rm);
  }
  
  void move()
  {
    pos.add(vel); //add velocity to position
  }
  
  void checkBounds()
  {
    if(pos.x>width+2*r) pos.x=-2*r;
    if(pos.x<-2*r) pos.x=width+2*r;
    if(pos.y>height+2*r) pos.y=-2*r;
    if(pos.y<-2*r) pos.y=height+2*r;
  }
  
  void render(int rm)
  {
    pushMatrix();
    colorMode(HSB,360);
    translate(pos.x,pos.y);
    
    fill(h,360,360);
    noStroke();
    if((rm & 2) == 2)
    {
      scale(r/3);
      rotate(atan2(vel.y,vel.x)); //rotate drawing matrix to direction of velocity

      //draw triangle
    
      beginShape(TRIANGLES);
        vertex(3,0);
        vertex(-3,2);
        vertex(-3,-2);
      endShape();
    }
    if((rm & 1) == 1)
      ellipse(0,0,2*r,2*r);
    colorMode(RGB,255);
    popMatrix();
  }
  
}

