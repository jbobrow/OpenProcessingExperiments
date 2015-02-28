
//newyear2014 greeting
//by XinhanYen,Email:archi730@hotmail.com
//inspire from
// Exercise Program for the lecture on "Fractals"
// a program to explore pentegon disections
// Pearson calls this Sutcliffe Pentagons (after Alan Sutcliffe)
// for Design Programming Design, Fall 2013 NCKU
// schien@mail.ncku.edu.tw

FractalRoot pentagon;
float _strutFactor = 0.4;
float _strutNoise;
int _maxLevels = 3;

void setup() { 
  size(400, 400); 
  _strutNoise = random(20);
}

void draw() {
  background(20);
  _strutNoise += 0.02; 
  _strutFactor = (noise(_strutNoise)*3)-1;
  pentagon = new FractalRoot(frameCount); 
  pentagon.drawShape();
  frameRate(5);
}

class FractalRoot { 
  PointObj[] pointArr = new PointObj[5]; 
  Branch rootBranch;

  FractalRoot(float startAngle) { 
    float centX = 100+random(50); 
    float centY = 150+random(50); 
    int count = 0; 
    for (int i = 0; i<360; i+=72) {
      float x = centX+(800*cos(radians(startAngle+i))); 
      float y = centY+(800*sin(radians(startAngle+i))); 
      pointArr[count] = new PointObj(x, y); 
      count++;
    } 

    rootBranch = new Branch(0, 0, pointArr);
  }

  void drawShape() { 
    stroke(128+random(100), 103+random(100), random(66), 10);
    rootBranch.drawMe();
  }
}
class PointObj {
  float x, y;
  PointObj(float ex, float ey) {
    x = ex;
    y = ey;
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
    level= lev;
    num = n;
    outerPoints = points;
    midPoints = calcMidPoints();
    projPoints = calcProjPoints();
    if (level < _maxLevels) {
      Branch childBranch = new Branch(level+1, 0, projPoints); 
      myBranches = (Branch[])append(myBranches, childBranch);

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
    for (int i=0; i<outerPoints.length; i++) {
      int nexti = i+1;
      if (nexti == outerPoints.length) {
        nexti = 0;
      }
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    }
    for (int k=0; k<myBranches.length; k++) {
      myBranches[k].drawMe();
    }
  }
  PointObj calcProjPoint(PointObj mp, PointObj op) { 
    float px, py; 
    px = mp.x + ((op.x - mp.x) * _strutFactor); 
    py = mp.y + ((op.y - mp.y) * _strutFactor); 
    return new PointObj(px, py);
  }
  PointObj[] calcProjPoints() {
    PointObj[] strutArray = new PointObj[midPoints.length]; 
    for (int i=0; i<midPoints.length; i++) {
      int nexti = (i+3)%midPoints.length; 
      PointObj thisSP = calcProjPoint(midPoints[i], outerPoints[nexti]); 
      strutArray[i] = thisSP;
    }
    return strutArray;
  }

  PointObj calcMidPoint(PointObj end1, PointObj end2) { 
    float mx, my; 
    mx = (end1.x + end2.x)/2; 
    my = (end1.y + end2.y)/2;
    return new PointObj(mx, my);
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
}



