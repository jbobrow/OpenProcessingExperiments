
class IKChain
{
  IKPoint[] pts;
  float  vx, vy, theta, speed;
  float life = 0;
  int maxRan = 180;

  IKChain(float xP, float yP, float thet, float spd, float unit, int unitCount)
  {  
    
    
    theta = thet;
    speed = spd;
    
    vx = cos(theta)*speed;
    vy = sin(theta)*speed;
    
    pts = new IKPoint[unitCount];

    for(int i = 0; i < pts.length; i++)
    {
      pts[i] = new IKPoint(xP,yP,unit);
      
      if(i>0)
      {
        pts[i].addNeighbour(pts[i-1]);
        pts[i-1].addNeighbour(pts[i]);
      }
    }
  }
  
  void drawMe()
  {
    
    beginShape();
    
    for(int i = 0; i < pts.length; i+=2)
    {
      if(white)
        stroke(255, 10);
      else
        stroke(0, 10);
        
     //   stroke(255);
        
      curveVertex(pts[i].x, pts[i].y);
    }
    
    endShape();
  }
  
  void advance()
  {
    life+= .5;
    
    float chaos = PI/random(5,maxRan);
    
    chaos = Math.floor(random(2)) == 0 ? chaos : - chaos;
    
    theta += chaos;
    vx = cos(theta)*speed;
    vy = sin(theta)*speed;
    
   
    pts[pts.length-1].move(vx,vy);
  }
}

