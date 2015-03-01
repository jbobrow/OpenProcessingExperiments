
int noWalkers = 15;
SplineWalker[] sw = new SplineWalker[noWalkers];
void setup()
{
  size(800,800);
  background(0);    
  
  for (int i = 0; i < noWalkers; i++)
  {
    sw[i] = new SplineWalker(new PVector(width/4,0),new PVector(1,2),random(350,550));
  }
   
}

void draw()
{
  
  strokeWeight(1);
  sw[0].update();  
  float t = sw[0].t;
  float tInc = mapSpeed(t);
  sw[0].tInc = tInc;
  stroke(255,10);
  for (int i = 1; i < noWalkers; i++)
  {
    if(sw[i].active())
    {
      sw[i].update();   
      sw[i].tInc = tInc; 
      line(sw[i].x, sw[i].y,sw[i-1].x, sw[i-1].y);
    }
  }
}

float mapSpeed(float t)
{
  float baseSpeed = 0.001;
  if(t<0.75)
    return map(t,0,0.75,baseSpeed,baseSpeed/5.0);
   
  if(t<0.8)
    return map(t,0.75,0.8,baseSpeed/5.0, baseSpeed/2.0);
    
  if(t<0.95)
     return map(t,0.8,0.95,baseSpeed/2.0, baseSpeed*2.0);
    
 
  return map(t,0.95,1,baseSpeed*2.0, baseSpeed*5.0);
}


class SplineWalker
{  
  
  PVector p1;
  PVector p2;
  PVector p3;
  PVector p4;
  
  float t = 0;
  float tInc = 0.001;
  float x;
  float y;
  
  SplineWalker(PVector location, PVector direction, float avgLength)
  {
    direction.normalize();
    direction.mult(avgLength);
    
    p1 = new PVector(location.x, location.y);
    p2 = PVector.add(p1, PVector.mult(direction,random(0.2,0.8)));
    
    PVector p3Dir = new PVector(direction.x, direction.y);
    p3Dir.rotate(HALF_PI*(random(-0.7,0.7)));
    
    p3 = PVector.add(p1, p3Dir);
    
    p3Dir.lerp(direction, random(0,1));
    
    //direction.rotate(HALF_PI*(random(-0.5,0.5)));
    
    p4 = PVector.add(p1, PVector.mult(p3Dir,random(1.2,1.7)));    
  }
  
  void update()
  {
    if (active())
    {
      x = bezierPoint(p1.x, p2.x, p3.x, p4.x, t);
      y = bezierPoint(p1.y, p2.y, p3.y, p4.y, t);     
      
      t += tInc;
    }
  }
  
  boolean active()
  {
    return t<1;
  }
  
  void draw()
  {
    update();
    if (active())
    {     
      point(x,y);      
    }
  }
}


