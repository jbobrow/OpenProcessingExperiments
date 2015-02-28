
//Author: Dulce Andino
//Purpose: Fractals. Assignment: Season's Greetings
//Concept: Holy Star
//Reference: example code from listing 8.7 of Pearson (2011: 173-174)
// Sutcliffe Pentagons variations
// varying the strut length

FractalRoot2 pentagon2;
FractalRoot pentagon;
float _strutFactor = 0.5;
float _strutNoise;
int _maxLevels = 3;

// ====================== main program ===================
void setup() {
  size(500, 500);
  smooth();
  _strutNoise = random(13);
  frameRate(24);
}

void draw() {
  fill(6, 33, 46, 50);
  noStroke();
  rect(0, 0, width, height);
  stars();

  _strutNoise += 0.01;
  _strutFactor = (noise(_strutNoise)*3)-1;

  pentagon2= new FractalRoot2(frameCount);
  pentagon2.drawShape2();

  pentagon = new FractalRoot(frameCount);  
  pentagon.drawShape();
}

void stars () {
  int s= millis();
  fill(s%255, 100);
  noStroke ();
  float p= random(2, 20);
  ellipse(random(width), random(height), p, p);
  ellipse(random(width), random(height), p, p);
  ellipse(random(width), random(height), p, p);
  ellipse(random(width), random(height), p, p);
  ellipse(random(width), random(height), p, p);
  ellipse(random(width), random(height), p, p);
  ellipse(random(width), random(height), p, p);
  ellipse(random(width), random(height), p, p);
  ellipse(random(width), random(height), p, p);
  ellipse(random(width), random(height), p, p);
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
      float x = centX + (170 * cos(radians(startAngle+i)));   
      float y = centY + (170 * sin(radians(startAngle+i)));   
      pointArr[count] = new PointObj(x, y);       
      count++;
    }   
    rootBranch = new Branch(0, 0, pointArr);
  }                               

  void drawShape() {      
    rootBranch.drawMe();
  }
}


class FractalRoot2 {                       
  PointObj[] pointArr = new PointObj[5];   
  Branch rootBranch;

  FractalRoot2(float startAngle) {                       
    float centX = width/2;               
    float centY = height/2;               
    int count = 0;                   
    for (int i = 0; i<359; i+=72) {           
      float x = centX + (250 * cos(radians(startAngle+i)));   
      float y = centY + (250 * sin(radians(startAngle+i)));   
      pointArr[count] = new PointObj(x, y);       
      count++;
    }   
    rootBranch = new Branch(0, 0, pointArr);
  }                               

  void drawShape2() {      
    rootBranch.drawMe2();
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
        int nextk = (k+8)%outerPoints.length;
        PointObj[] newPoints = {
          outerPoints[k], midPoints[k], projPoints[k], projPoints[nextk], midPoints[nextk]
        };
        childBranch = new Branch(level+1, k+1, newPoints);
        myBranches = (Branch[])append(myBranches, childBranch);
      }
    }
  }                                                      

  void drawMe() {
    strokeWeight(1);  
    stroke(0);  
    // draw outer shape
    for (int i = 0; i < outerPoints.length; i++) {        
      int nexti = i+1;                                     
      if (nexti == outerPoints.length) {
        nexti = 0;
      } 
      stroke (255, 80); 
      strokeWeight(0.05);    
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    }
    // draw substructure
    for (int k=0; k<myBranches.length; k++) {
      myBranches[k].drawMe();
    }
  }

  void drawMe2() {
    strokeWeight(1);  
    stroke(0);  
    // draw outer shape
    for (int i = 0; i < outerPoints.length; i++) {        
      int nexti = i+1;                                     
      if (nexti == outerPoints.length) {
        nexti = 0;
      } 
      stroke (126, 149, 160, 70);
      strokeWeight(.0);    
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    }
    // draw substructure
    for (int k=0; k<myBranches.length; k++) {
      myBranches[k].drawMe2();
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
    for (int i=0; i<midPoints.length; i++) {
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


