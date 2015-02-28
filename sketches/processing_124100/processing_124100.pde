
// Exercise Program for the lecture on "Fractals"
// a program to explore pentegon disections
// Pearson calls this Sutcliffe Pentagons (after Alan Sutcliffe)
// for Design Programming Design, Fall 2013 NCKU
// schien@mail.ncku.edu.tw

FractalRoot pentagon;
float _strutFactor = 0.2;
float _strutNoise;
int _maxLevels = 4;

void setup() { 
  size(900, 900); 
  _strutNoise = random(10);
}

void draw() {
  background(0,0,50);
  _strutNoise += 0.01; 
  _strutFactor = (noise(_strutNoise)*3)-1;
  pentagon = new FractalRoot(frameCount); 
  pentagon.drawShape();
}



// the class to represent the pentagons
class FractalRoot { 
  PointObj[] pointArr = new PointObj[5]; 
  Branch rootBranch;

  FractalRoot(float startAngle) { 
    float centX = width/2; 
    float centY = height/2; 
    int count = 0; 
    for (int i = 0; i<360; i+=72) {
      float x = centX+(380*cos(radians(startAngle+i))); 
      float y = centY+(380*sin(radians(startAngle+i))); 
      pointArr[count] = new PointObj(x, y); 
      count++;
    } 

    rootBranch = new Branch(0, 0, pointArr);
  }

  void drawShape() { 
    rootBranch.drawMe();
  }
}

// supporting class to store points
class PointObj {
  float x, y;
  PointObj(float ex, float ey) {
    x = ex;
    y = ey;
  }
}

// supporting class to store branches
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
    strokeWeight(level/3.0);
    stroke(255, 255/(level+1));
    for (int i=0; i<outerPoints.length; i++) {
      int nexti = i+1;
      if (nexti == outerPoints.length) {
        nexti = 0;
      }
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    }

    /*
    // draw midpoints and projected lines
     strokeWeight(0.5); 
     fill(255, 150); 
     for (int j=0; j<midPoints.length; j++) {
     // draw midpoint
     ellipse(midPoints[j].x, midPoints[j].y, 15, 15);
     // draw projected line
     line(midPoints[j].x, midPoints[j].y, projPoints[j].x, projPoints[j].y); 
     ellipse(projPoints[j].x, projPoints[j].y, 15, 15);
     }
     */

    // ask the branches to draw themselves
    for (int k=0; k<myBranches.length; k++) {
      myBranches[k].drawMe();
    }
  }

  // methods for midpoint extrusion
  // the extrusion for any two points
  PointObj calcProjPoint(PointObj mp, PointObj op) { 
    float px, py; 
    px = mp.x + ((op.x - mp.x) * _strutFactor); 
    py = mp.y + ((op.y - mp.y) * _strutFactor); 
    return new PointObj(px, py);
  }
  // the extrusions for all midpoints
  PointObj[] calcProjPoints() {
    PointObj[] strutArray = new PointObj[midPoints.length]; 
    for (int i=0; i<midPoints.length; i++) {
      int nexti = (i+3)%midPoints.length; 
      PointObj thisSP = calcProjPoint(midPoints[i], outerPoints[nexti]); 
      strutArray[i] = thisSP;
    }
    return strutArray;
  }

  // methods for midpoint calculations
  // the midpoint between two points
  PointObj calcMidPoint(PointObj end1, PointObj end2) { 
    float mx, my; 
    mx = (end1.x + end2.x)/2; 
    my = (end1.y + end2.y)/2;
    return new PointObj(mx, my);
  }
  // the midpoints for all edges
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



