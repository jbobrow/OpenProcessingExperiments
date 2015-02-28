
public class Tracer
{
  float angle , rad , step , shrink;
  PVector pos , pPos;
  boolean ALIVE;
  
  Tracer()
  {
    //angle = random(-PI,0);
    angle = random(-1.6,-1.53);
    rad = random(3,7);
    step = random(-.1,.1);
    while(step<.02&&step>-.02) step = random(-.1,.1);
    shrink = map(rad,5,8,.98,.995);//random(.98,1);
    pos = new PVector(width/2 , random(height/2,height*3/4));
    pPos = new PVector(0,0);
    pPos.set(pos);
    ALIVE = true;
  }
  
  Tracer(Tracer trcr)
  {
    angle = trcr.angle;
    rad = trcr.rad;
    step = new Float(-trcr.step);
    shrink = map(rad,5,8,.98,.999);
    pos = new PVector(trcr.pos.x,trcr.pos.y);
    pPos = new PVector(trcr.pos.x,trcr.pos.y);
    ALIVE = true;
  }
  
  void draw()
  {
    //strokeWeight(2);
    stroke(0);
    line(pos.x , pos.y , pPos.x , pPos.y);
  }
  
  void calculate()
  {
    pPos.set(pos);
    pos.x += rad*cos(angle);
    pos.y += rad*sin(angle);
    angle+=step;
    rad*=shrink;
    if (rad<.01||angle>8*TWO_PI||angle<-8*TWO_PI)
    {
      ALIVE = false;
      noStroke();
      fill(100,30,30);
      ellipse(pos.x,pos.y,4,4);
    }
  }
  
}


