
// example code from listing 8.4 of Pearson (2011: 173-174)
// draw a pentagon using rotation
// adding methods to calculate midpoints (Pearson 2011:175-176)
// adding methods to project midpoints (Pearson 2011:177-178)
// adding recursive structure (Pearson 2011:179-180)
// schien@mail.ncku.edu.tw

FractalRoot pentagon; 
float _strutFactor = 0.2;
int _maxLevels = 4;

// ====================== main program ===================
void setup() { 
  size(500, 500); 
  smooth(); 
  pentagon = new FractalRoot();                             
  pentagon.drawShape();
} 

// ======================= objects ======================

class PointObj {                                            
  float x, y;                                              
  PointObj(float ex, float why) {                          
    x = ex; 
    y = why;
  }
}  

class FractalRoot {                        
  PointObj[] pointArr = new PointObj[5];            
  Branch rootBranch;                    

  FractalRoot() {                        
    float centX = width/2;                
    float centY = height/2;                
    int count = 0;                    
    for (int i = 0; i<360; i+=72) {            
      float x = centX + (220 * cos(radians(i)));    
      float y = centY + (220 * sin(radians(i)));    
      pointArr[count] = new PointObj(x, y);        
      count++;
    }                            
    rootBranch = new Branch(0, 0, pointArr);
  }                                

  void drawShape() {                    
    rootBranch.drawMe();
  }
}

class Branch {                                            
  int level, num;                                         
  PointObj[] outerPoints = {
  };  
  PointObj[] midPoints = {
  };  
  PointObj[] projPoints = {
  };
  Branch[] myBranches = {
  };

  Branch(int lev, int n, PointObj[] points) {             
    level = lev;                                          
    num = n;                                              
    outerPoints = points;
    midPoints = calcMidPoints();
    projPoints = calcStrutPoints();
    if (level < _maxLevels) {
      // central polygon
      Branch childBranch = new Branch(level+1, 0, projPoints);
      myBranches = (Branch[])append(myBranches, childBranch);
      // surrounding polygons
      for (int k=0; k<outerPoints.length; k++) {
        int nextk = (k+4)%outerPoints.length;
        PointObj[] newPoints = {
          outerPoints[k], midPoints[k], projPoints[k], projPoints[nextk], midPoints[nextk]
        };
        childBranch = new Branch(level+1, k+1, newPoints);
        myBranches = (Branch[])append(myBranches, childBranch);
      }
    }
  }                                                       

  void drawMe() { 
    strokeWeight(5 - level);      
    // draw outer shape 
    for (int i = 0; i < outerPoints.length; i++) {         
      int nexti = i+1;                                      
      if (nexti == outerPoints.length) { 
        nexti = 0;
      }       
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    }
    // draw midpoints
    strokeWeight(0.5);
    fill(255, 150);
    for(int j=0; j<midPoints.length; j++) {
      //ellipse(midPoints[j].x, midPoints[j].y, 15, 15);
      //line(midPoints[j].x, midPoints[j].y, projPoints[j].x, projPoints[j].y);
      //ellipse(projPoints[j].x, projPoints[j].y, 15, 15);
    }
    // draw substructure
    for(int k=0; k<myBranches.length; k++) {
      myBranches[k].drawMe();
    }
  }

  PointObj[] calcMidPoints() {                        
    PointObj[] mpArray = new PointObj[outerPoints.length];        
    for (int i = 0; i < outerPoints.length; i++) {            
      int nexti = i+1;                            
      if (nexti == outerPoints.length) { 
        nexti = 0;
      }        
      PointObj thisMP = calcMidPoint(outerPoints[i], outerPoints[nexti]);        
      mpArray[i] = thisMP;
    }                                     
    return mpArray;
  }

  PointObj calcMidPoint(PointObj end1, PointObj end2) {
    float mx, my;
    mx = (end1.x + end2.x)/2;
    my = (end1.y + end2.y)/2;
    return new PointObj(mx, my);
  }

  PointObj[] calcStrutPoints() {
    PointObj[] strutArray = new PointObj[midPoints.length];
    for(int i=0; i<midPoints.length; i++) {
      int nexti = (i+3)%midPoints.length;
      PointObj thisSP = calcProjPoint(midPoints[i], outerPoints[nexti]);
      strutArray[i] = thisSP;
    }
    return strutArray;
  }

  PointObj calcProjPoint(PointObj mp, PointObj op) {
    float px, py;
    px = mp.x + ((op.x - mp.x) * _strutFactor);
    py = mp.y + ((op.y - mp.y) * _strutFactor);
    return new PointObj(px, py);
  }
}


