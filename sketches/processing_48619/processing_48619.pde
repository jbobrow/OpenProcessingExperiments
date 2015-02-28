
// example code from listing 8.7 of Pearson (2011: 173-174)
// Sutcliffe Pentagons variations
// varying the strut length
// schien@mail.ncku.edu.tw

FractalRoot pentagon; 
float _strutFactor = 0.2;
float _strutNoise;
int _maxLevels = 4;

// ====================== main program ===================
void setup() { 
  size(600, 600); 
  smooth(); 
  _strutNoise = random(10);
}

void draw() {
  background(255);

  _strutNoise += 0.01;
  _strutFactor = (noise(_strutNoise)*3)-1;

  pentagon = new FractalRoot(frameCount);                             
  pentagon.drawShape();
  
  //saveFrame("screen####.png");
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

  FractalRoot(float startAngle) {                        
    float centX = width/2;                
    float centY = height/2;                
    int count = 0;                    
    for (int i = 0; i<360; i+=72) {            
      float x = centX + (280 * cos(radians(startAngle+i)));    
      float y = centY + (280 * sin(radians(startAngle+i)));    
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
    strokeWeight(0.5);   
    stroke(0, 150);   
    // draw outer shape 
    for (int i = 0; i < outerPoints.length; i++) {         
      int nexti = i+1;                                      
      if (nexti == outerPoints.length) { 
        nexti = 0;
      }       
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
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


