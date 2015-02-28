
//Clark Li
//Season Kaleidoscope
//This practice is draw a Hexagonal. Adjusting the branch class, and recursive structure and children.
//Displace other hexagonal, and make it like a kaleidoscope.
//Reference from: http://www.openprocessing.org/sketch/126342

FractalRoot pentagon;
float _strutFactor = 1;
float _strutNoise;
int _maxLevels = 3;

void setup() {
  size(800, 800);
  _strutNoise = random(250);
}

void draw() {
  background(0);
  _strutNoise += 0.01;
  _strutFactor = (noise(_strutNoise)*3)-1;
  pentagon = new FractalRoot(frameCount);
  pentagon.drawShape();
}



class FractalRoot {
  PointObj[] pointArr = new PointObj[6];
  Branch rootBranch;

  FractalRoot(float startAngle) {
    float centX = width/2;
    float centY = height/2;
    int count = 0;
    for (int i = 0; i<360; i+=60) {
      float x = centX+(350*cos(radians(startAngle+i)));
      float y = centY+(300*sin(radians(startAngle+i)));
      pointArr[count] = new PointObj(x, y);
      count++;
    }

    rootBranch = new Branch(0, 5, pointArr);
  }

  void drawShape() {
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
    strokeWeight(3 - level);
    stroke(0, 10);
    for (int i=0; i<outerPoints.length; i++) {
      int nexti = i+1;
      if (nexti == outerPoints.length) {
        nexti = 0;
      }
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
      fill(250, 255, 250, 50);
      ellipse(outerPoints[i].x, outerPoints[i].y+height/2, random(8), random(8));
      fill(250, 240, 0, 60);
      ellipse(outerPoints[nexti].x, outerPoints[nexti].y-height/2, random(8), random(8));
      fill(240, 240, 250, 50);
      ellipse(outerPoints[nexti].x, outerPoints[nexti].y, random(15), random(15));
      fill(250, 240, 0, 60);
      ellipse(outerPoints[nexti].x+width/2, outerPoints[nexti].y, random(8), random(8));
      fill(250, 240, 0, 60);
      ellipse(outerPoints[nexti].x-width/2, outerPoints[nexti].y, random(8), random(8));
    }


    for (int k=2; k<myBranches.length; k++) {
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



