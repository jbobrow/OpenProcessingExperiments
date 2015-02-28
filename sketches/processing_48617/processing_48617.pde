
//==================================
FractalRoot pentagon;
void setup() {
  size(700, 700);
  smooth();
  pentagon = new FractalRoot();
  pentagon.drawShape();
}
// ==============================
class FractalRoot {
  PointObj[] pointArr = new PointObj[5];
  Branch rootBranch;
  FractalRoot() {
    float centX = width/2;
    float centY = height/2;
    int count = 0;
    for (int i = 0; i<360; i+=72) {
      float x = centX+(300*cos(radians(i)));
      float y = centY+(300*sin(radians(i)));
      pointArr[count] = new PointObj(x, y);
      count++;
    }
    rootBranch = new Branch(0, 0, pointArr);
  }
  void drawShape() {
    rootBranch.drawMe();
  }
}
//==========================================
class PointObj {
  float x, y;
  PointObj(float ex, float why) {
    x = ex;
    y = why;
  }
}

// ==============================
class Branch {
  int level, num;
  PointObj[] outerPoints = {
  };
  PointObj[] midPoints = {
  };

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
  //=================================================

  Branch(int lev, int n, PointObj[] points) {
    level = lev;
    num = n;
    outerPoints = points;
    midPoints = calcMidPoints();
  }

  void drawMe() {
    strokeWeight(5 - level);
    for (int i = 0; i < outerPoints.length; i++) {
      int nexti = i+1;
      if (nexti == outerPoints.length) {
        nexti = 0;
      }
      line(outerPoints[i].x, outerPoints[i].y, 
      outerPoints[nexti].x, outerPoints[nexti].y);
    }
    strokeWeight(0.5);
    fill(255, 150);
    for (int j=0; j<midPoints.length; j++) {
      ellipse(midPoints[j].x, midPoints[j].y, 15, 15);
    }
  }
}


