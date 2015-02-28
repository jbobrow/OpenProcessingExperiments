
class Jellyfish {
  
  int pointAmt;
  float radius;
  float startRadius;
  ShapePoint[] points;
  float degreeCount = 0;
  float pointSize;
  float grayFill;
  float centerX;
  float centerY;
  float degreeAmt;
  float rotationSpeed;

  
  Jellyfish(float _x, float _y, float _radius)
  {
     centerX = _x;
     centerY = _y;
     pointAmt = round(random(6, 30));
     this.radius = _radius;
     this.startRadius = _radius;
     rotationSpeed = random(1.6) - 0.8;
     println(rotationSpeed);
     degreeAmt = (360f/pointAmt);
     
     // loop though and make a circle for every point
     grayFill = random(30, 70);
     stroke(0, grayFill);
     fill(0, grayFill - 30);
     ellipse(centerX, centerY, radius*2, radius*2);
     pointSize = random(2.0, 20.0);
     points = new ShapePoint[pointAmt];
     for(int i=0; i<pointAmt; i++)
     {
       float curDegree = degreeCount+ (degreeAmt * (i));
       float xPos = _x + cos((float)(curDegree * (Math.PI/180))) * radius;
       float yPos = _y + sin((float)(curDegree * (Math.PI/180))) * radius;
       float lineX = _x + cos((float)(curDegree * (Math.PI/180))) * (radius - (pointSize/2));
       float lineY = _y + sin((float)(curDegree * (Math.PI/180))) * (radius - (pointSize/2));
      
       stroke(0, grayFill);
       line(_x, _y, lineX, lineY);
       
       ShapePoint p = new ShapePoint(xPos, yPos, pointSize);
       points[i] = p;
       
     }
      radius++;
     // add points to an array
     
     
     // place every point in a circle around the central point
    
  }
  
  
  void update(float rWave, int order)
  {
   
    fill(0, grayFill - 30);
     
     ellipse(centerX, centerY, radius*2, radius*2);
     //println(degreeCount);
     radius = startRadius + (20*(cos(rWave+(order*.2)))); 
     for(int i=0; i<pointAmt; i++)
     {
       
       ShapePoint p = points[i];
       
       float curDegree = degreeCount + (degreeAmt * (i));
       float xPos = centerX + cos((float)(curDegree * (Math.PI/180))) * radius;
       float yPos = centerY + sin((float)(curDegree * (Math.PI/180))) * radius;
       float lineX = centerX + cos((float)(curDegree * (Math.PI/180))) * (radius - (pointSize/2));
       float lineY = centerY + sin((float)(curDegree * (Math.PI/180))) * (radius - (pointSize/2));
       //println(curDegree + " " + xPos + " " + yPos);
      
       stroke(0, grayFill);
       line(centerX, centerY, lineX, lineY);
       p.drawPoint(xPos, yPos, pointSize);
       
        
     }
     degreeCount += rotationSpeed;
     //radius++;
     //if(radius > 200) radius = 30;
       //radius += (30 - radius) * .1;
     
     
  }
  
}

