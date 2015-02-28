
   void setup() 
  {
    size(400, 200);
    background(255);
    stroke(0);
  }
  
    float point1x = 55;
    float point1y = 20;
    float point2x = 325;
    float point2y = 189;
  
   void draw()
  {
      background(255);
      stroke(random(255),random(255),random(255));
    
    ellipse(point1x, point1y, 3, 3);
    ellipse(point2x, point2y, 3, 3);
    
    float step = 1;
    
    float currPointX = point1x;
    float currPointY = point1y;
    
    float shake = 1.6f;
    
    while(shake < abs(point2x - currPointX))
    {
        float ratio = (point2y - currPointY)/(point2x - currPointX);
        
        float nextPointX = currPointX + step + random(-shake, shake);
        float nextPointY = currPointY + ratio * step + random(-shake, shake);
        
      line(currPointX, currPointY, nextPointX, nextPointY);
      
      currPointX = nextPointX;
      currPointY = nextPointY;
    }
    
      line(currPointX, currPointY, point2x, point2y);
  }


