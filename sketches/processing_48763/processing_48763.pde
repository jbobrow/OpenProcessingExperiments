
PImage img;
FractalRoot pentagon;
float _strutFactor = 0.2;
float _strutNoise;
float _maxLevels = 2;
int _num = 20;       
Circle[] _circleArr = {};
  
   
// ====================== main program ===================
void setup() {
  size(600, 600);
  smooth();
  _strutNoise = random(10);
   background(140);
   fill(150, 50);
  
    drawCircles();
  
}
   
void draw() {
background(0);
fill(149,50,23);
   
  _strutNoise += 0.02;
  _strutFactor = (noise(_strutNoise)*5)-1;
   
  pentagon = new FractalRoot(frameCount);                          
  pentagon.drawShape();
    
for(int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
  
   ellipse(random(0, width), random(0, height), random(0, 15), random(0, 15));
  
  //saveFrame("screen####.png");
}
void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle(); // create an instance
    thisCirc.drawMe();  // ask the instance to draw itself
    _circleArr = (Circle[])append(_circleArr, thisCirc);  // add the new instance to the array
  }
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
  PointObj[] pointArr = new PointObj[6];         
  Branch rootBranch;
   
  FractalRoot(float startAngle) {                     
    float centX = width/2;             
    float centY = height/2;             
    int count = 0;                 
    for (int i = 0; i<360; i+=60) {         
      float x = centX + (300 * cos(radians(startAngle+i))); 
      float y = centY + (300 * sin(radians(startAngle+i))); 
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
      Branch childBranch = new Branch(level+102, 0, projPoints);
      myBranches = (Branch[])append(myBranches, childBranch);
      // surrounding polygons
      for (int k=0; k<outerPoints.length; k++) {
        int nextk = (k+3)%outerPoints.length;
        PointObj[] newPoints = {
          outerPoints[k], midPoints[k], projPoints[k], projPoints[nextk], midPoints[nextk]
        };
        childBranch = new Branch(level+1, k+1, newPoints);
        myBranches = (Branch[])append(myBranches, childBranch);
      }
    }
  }                                                    
   
  void drawMe() {
    strokeWeight(0.8);
    stroke(255,0, 100);
   
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
  
class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
   
  Circle() {
    x = random(width);
    y = random(height);
    radius = random(50) + 20;
  // linecol = color(random(255), random(0), random(255));
    fillcol = color(random(255), random(255), random(255));
      
    alph = random(255);
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }
   
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
   // stroke(linecol, 150);
    noFill();
    ellipse(x, y, 8, 8);
  }
     
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width+radius)) { x = 0 - radius; }
    if (x < (0-radius)) { x = width+radius; }
    if (y > (height+radius)) { y = 0 - radius; }
    if (y < (0-radius)) { y = height+radius; }
       
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherCirc.x)/3;
          midy = (y + otherCirc.y)/3;
          stroke(255);
          fill(0,245,0,87);
          overlap *= -1;
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }
    drawMe();
  }
}


