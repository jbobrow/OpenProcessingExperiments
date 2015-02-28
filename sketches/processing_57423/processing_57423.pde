

int numPoints = 5;
PVector[] points = new PVector[numPoints];
PVector[] targetPoints = new PVector[numPoints]; 
float ease = 0.1;

void setup() {  
  size(450, 400);      
  for (int i = 0; i < numPoints; i++) {    
    points[i] = new PVector(random(width), random(height));    
    targetPoints[i] = new PVector(random(width), random(height));
  }
}

void draw() {  
  smooth();  
  background(0);  
  noFill();  
  stroke(255);   
  for (int i = 0; i < numPoints; i++) {    
    float xdist = targetPoints[i].x - points[i].x;    
    float ydist = targetPoints[i].y - points[i].y;        
    points[i].x += xdist * ease;    
    points[i].y += ydist * ease;        
    float distance = xdist*xdist + ydist*ydist;    
    if (distance <= 2) {      
      points[i].x = targetPoints[i].x;      
      points[i].y = targetPoints[i].y;            
      targetPoints[i].x = random(width);      
      targetPoints[i].y = random(height);
      try{
      //Thread.sleep(500);
      }
      catch(Exception e){
      }
    }    
    ellipse(points[i].x, points[i].y, 3, 3);    
    ellipse(targetPoints[i].x, targetPoints[i].y, 3, 3);
  }    
  for (int i = 0; i < numPoints - 1; i++) {    
    for (int j = i + 1; j < numPoints; j++) {      
      line(points[i].x, points[i].y, points[j].x, points[j].y);
    }
  }
}



