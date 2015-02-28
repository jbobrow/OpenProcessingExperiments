
//1211 Inclass Practice
//N76014087  Te Pang Chiang
//Use red circle and square to make star shape emergence
//Reference to Sutcliffe Pentagons (AbandonedArt.org)

FractalRoot pentagon;
float _strutFactor = 0.2;
float _strutNoise;
int _maxlevels = 2;

void setup() {
  size(500, 500); 
  smooth();
  _strutNoise = random(15);

  pentagon = new FractalRoot(0);
  pentagon.drawShape();
}

void draw() {
  background(0);

  _strutNoise += 0.01;
  _strutFactor = noise(_strutNoise) * 2;

  pentagon = new FractalRoot(frameCount);
  pentagon.drawShape();
  
  _strutNoise += 0.02;
  _strutFactor = noise(_strutNoise) * 3;

  pentagon = new FractalRoot(frameCount);
  pentagon.drawShape();
    
  _strutNoise += 0.02;
  _strutFactor = noise(_strutNoise) * 4;

  pentagon = new FractalRoot(frameCount);
  pentagon.drawShape();
  
}    

class Point {
  float x, y;
  Point(float ex, float why) {
    x = ex; 
    y = why;
  }
}


class FractalRoot {
  Point[] pointArr = new Point[5];
  Branch rootBranch;

  FractalRoot(float startAngle) {
    float centX = width/2;
    float centY = height/2;
    int count = 0;
    for (int i = 0; i<360; i+=72) {
      float x = centX + (400 * cos(radians(startAngle + i)));
      float y = centY + (200 * sin(radians(startAngle + i)));
      pointArr[count] = new Point(x, y);
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
  Point[] outerPoints = {
  };
  Point[] midPoints = {
  };
  Point[] projPoints = {
  };
  Branch[] myBranches = {
  };

  Branch(int lev, int n, Point[] points) {
    level = lev;
    num = n;
    outerPoints = points;
    midPoints = calcMidPoints();
    projPoints = calcStrutPoints();

    // next generation
    if ((level+1) < _maxlevels) {
      Branch childBranch = new Branch(level+1, 0, projPoints);
      myBranches = (Branch[])append(myBranches, childBranch);

      // fill other pentagons
      for (int k = 0; k < outerPoints.length; k++) {
        int nextk = k-1;
        if (nextk < 0) { 
          nextk += outerPoints.length;
        }
        Point[] newPoints = {  
          projPoints[k], midPoints[k], outerPoints[k], midPoints[nextk], projPoints[nextk]
        };
        childBranch = new Branch(level+1, k+1, newPoints);
        myBranches = (Branch[])append(myBranches, childBranch);
      }
    }
  }

  Point[] calcMidPoints() {
    Point[] mpArray = new Point[outerPoints.length];
    for (int i = 0; i < outerPoints.length; i++) {
      int nexti = i+1;
      if (nexti == outerPoints.length) { 
        nexti = 0;
      }
      Point thisMP = calcMidPoint(outerPoints[i], outerPoints[nexti]);
      mpArray[i] = thisMP;
    } 
    return mpArray;
  }

  Point[] calcStrutPoints() {
    Point[] strutArray = new Point[midPoints.length];
    for (int i = 0; i < midPoints.length; i++) {
      int nexti = i+3;
      if (nexti >= midPoints.length) { 
        nexti -= midPoints.length;
      }
      Point thisSP = calcProjPoint(midPoints[i], outerPoints[nexti]);  
      // draw from midpoint to opposite point on outer shape
      strutArray[i] = thisSP;
    } 
    return strutArray;
  }

  Point calcMidPoint(Point end1, Point end2) {
    float mx, my;
    if (end1.x > end2.x) {
      mx = end2.x + ((end1.x - end2.x)/2);
    } 
    else {
      mx = end1.x + ((end2.x - end1.x)/2);
    }
    if (end1.y > end2.y) {
      my = end2.y + ((end1.y - end2.y)/2);
    } 
    else {
      my = end1.y + ((end2.y - end1.y)/2);
    }
    return new Point(mx, my);
  }


  Point calcProjPoint(Point mp, Point op) {
    float px, py;
    // trig triangle, get opposite and adjacent
    float adj, opp;    
    if (op.x > mp.x) { 
      opp = op.x - mp.x;
    } 
    else {
      opp = mp.x - op.x;
    }
    if (op.y > mp.y) {
      adj = op.y - mp.y;
    } 
    else {
      adj = mp.y - op.y;
    }
    // project point
    if (op.x > mp.x) { 
      px = mp.x + (opp * _strutFactor);
    } 
    else {
      px = mp.x - (opp * _strutFactor);
    }
    if (op.y > mp.y) {
      py = mp.y + (adj * _strutFactor);
    } 
    else {
      py = mp.y - (adj * _strutFactor);
    }  
    return new Point(px, py);
  }


  void drawMe() {
    int myWeight = _maxlevels - level;
    strokeWeight(myWeight);      // stroke weight according to level
    // draw outer shape
    for (int i = 0; i < outerPoints.length; i++) {
      int nexti = i+1;
      if (nexti == outerPoints.length) { 
        nexti = 0;
      }
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    } 
    // draw midpoints and their projection points
    strokeWeight(0.5);
    fill(random(203, 208), random(16, 64), random(66, 76), 150);   
    for (int j = 0; j < midPoints.length; j++) {
      rectMode(CENTER);
      rect(midPoints[j].x, midPoints[j].y, myWeight*10, myWeight*10);
      line(midPoints[j].x, midPoints[j].y, projPoints[j].x, projPoints[j].y);
      ellipse(projPoints[j].x, projPoints[j].y, myWeight*10, myWeight*10);
    } 

    // draw children
    for (int k = 0; k < myBranches.length; k++) {
      myBranches[k].drawMe();
    }
  }
}



