
FractalRoot pentagon;
int _maxLevels = 4;
float _strutFactor = 0.2;
float _strutNoise;
float radius;
int _numSides;
;
float red1, blue1, green1;
float red2, blue2, green2;
float red3, blue3, green3;
float red4, blue4, green4;
float red5, blue5, green5;
float red6, blue6, green6;
int Rad;

void setup() {
  background(0);
  size(1000, 1000);
  smooth();
  _strutNoise = random(10);
  red1 = random(255);
  green1 = random(255);
  blue1 = random(255);
  red2 = random(255);
  green2 = random(255);
  blue2 = random(255);
  red3 = random(255);
  green3 = random(255);
  blue3 = random(255);
  red4 = random(255);
  green4 = random(255);
  blue4 = random(255);
  red5 = random(255);
  green5 = random(255);
  blue5 = random(255);
  red6 = random(255);
  green6 = random(255);
  blue6 = random(255);

  Rad = int(random(100, 300));
  _numSides = int(random(5, 7));
  clearBackground();
}

void clearBackground() {
  background(255);
}

class PointObj {
  float x, y;
  PointObj(float ex, float why) {
    x = ex;
    y = why;
  }
}


class FractalRoot {
  PointObj[] pointArr = {
  };
  //  PointObj[] pointArr = new PointObj[5];
  Branch rootBranch;

  FractalRoot(float startAngle) {
    float centX = width/2;
    float centY = height/2;
    int count = 0;
    //    for (int i = 0; i < 360; i += 72) {
    float angleStep = 360.00/_numSides;
    for (float i = 0; i < 360; i += angleStep) {
      float x = centX + (Rad*cos(radians(startAngle + i)));
      float y = centY + (Rad*sin(radians(startAngle + i)));
      //    pointArr[count] = new PointObj(x, y);
      //   count++;
      pointArr = (PointObj[])append(pointArr, new PointObj(x, y));
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

  Branch(int lev, int n, PointObj[]points) {  // (properties, ", ");
    level = lev;
    num = n;
    outerPoints = points;
    midPoints = calcMidPoints();
    projPoints = calcStrutPoints();

    if ((level+1) < _maxLevels) {
      Branch childBranch = new Branch(level+1, 0, projPoints);
      myBranches = (Branch[])append(myBranches, childBranch);
      for (int k = 0; k < outerPoints.length; k++) {
        int nextk = k-2;
        if (nextk < 0) {
          nextk += outerPoints.length;
        }
        PointObj[] newPoints = { 
          projPoints[k], midPoints[k], 
          outerPoints[k], midPoints[nextk], projPoints[nextk]
        };
        childBranch = new Branch(level + 1, k + 1, newPoints);
        myBranches = (Branch[])append(myBranches, childBranch);
      }
    }
  }

  PointObj[] calcStrutPoints() {
    PointObj[] strutArray = new PointObj[midPoints.length];
    for (int i = 0; i < midPoints.length; i++) {
      int nexti = i + 3;
      if (nexti >= midPoints.length) {
        nexti -= midPoints.length;
      }
      PointObj thisSP = calcProjPoint(midPoints[i], outerPoints[nexti]);
      strutArray[i] = thisSP;
    }
    return strutArray;
  } 

  PointObj calcProjPoint(PointObj mp, PointObj op) {
    float px, py;
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
    if (op.x > mp.x) {
      px = mp.x + (opp * _strutFactor); // noise (1-20)*8)-1) *
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
    return new PointObj(px, py);
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
    if (end1.x > end2.x) {
      mx = end2.x + ((end1.x - end2.x) /2);
    } 
    else {
      mx = end1.x + ((end2.x - end1.x) /2);
    }
    if (end1.y > end2.y) {
      my = end2.y + ((end1.y - end2.y) /2);
    } 
    else {
      my = end1.y + ((end2.y - end1.y) /2);
    }
    return new PointObj(mx, my);
  } 

  void drawMe() {
    stroke(red1, blue1);
    strokeWeight(3 - level);
    // draw outer shape
    for (int i = 0; i < outerPoints.length; i++) {
      int nexti = i+1;
      if (nexti == outerPoints.length) {
        nexti = 0;
      }
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    }
    // draw midpoints
    stroke(red2, green1, blue2);
    strokeWeight(0.5);
    fill(red2, green2, blue2);
    for (int j = 0; j < midPoints.length; j++) {
      ellipse(midPoints[j].x, midPoints[j].y, radius, radius);
      midPoints[j].x++;
    }
    stroke(red3, green3, blue3);
    strokeWeight(0.5);
    for (int j = 0; j < midPoints.length; j++) {
      fill(red4, green4, blue4);
      ellipse(midPoints[j].x, midPoints[j].y, radius, radius);
      line(midPoints[j].x, midPoints[j].y, projPoints[j].x, projPoints[j].y);
      fill(red5, green5, blue5);
      ellipse(projPoints[j].x, projPoints[j].y, radius, radius);
    }
    for (int k = 0; k < myBranches.length; k++) {
      myBranches[k].drawMe();
    }
  }
}


void draw() {
  pentagon = new FractalRoot(frameCount);
  radius = 5;
  _strutNoise += 0.02;
  _strutFactor = noise(_strutNoise);  
  pentagon.drawShape();
  red2 = random(255);
  green2 = random(255);
  blue2 = random(255);
}

void keyPressed() {
  //if (keyCode == ENTER) {
    //saveFrame("Noise Warp .5_2-####.tif");
  //}
  if (keyCode == UP) {
    red1 = random(255);
    green1 = random(255);
    blue1 = random(255);
    red2 = random(255);
    green2 = random(255);
    blue2 = random(255);
    red3 = random(255);
    green3 = random(255);
    blue3 = random(255);
    red4 = random(255);
    green4 = random(255);
    blue4 = random(255);
    red5 = random(255);
    green5 = random(255);
    blue5 = random(255);
    red6 = random(255);
    green6 = random(255);
    blue6 = random(255);

    Rad = int(random(100, 300));
    _numSides = int(random(5, 7));
    _strutFactor = noise(_strutNoise)*.5;
    redraw();
  }
  if (keyCode == RIGHT) {
    red1 = random(255);
    green1 = random(255);
    blue1 = random(255);
    red2 = random(255);
    green2 = random(255);
    blue2 = random(255);
    red3 = random(255);
    green3 = random(255);
    blue3 = random(255);
    red4 = random(255);
    green4 = random(255);
    blue4 = random(255);
    red5 = random(255);
    green5 = random(255);
    blue5 = random(255);
    red6 = random(255);
    green6 = random(255);
    blue6 = random(255);


    Rad = int(random(100, 300));
    _numSides = int(random(5, 7));
    _strutFactor = noise(_strutNoise)*1;
    redraw();
  } 
  if (keyCode == DOWN) {
    red1 = random(255);
    green1 = random(255);
    blue1 = random(255);
    red2 = random(255);
    green2 = random(255);
    blue2 = random(255);
    red3 = random(255);
    green3 = random(255);
    blue3 = random(255);
    red4 = random(255);
    green4 = random(255);
    blue4 = random(255);
    red5 = random(255);
    green5 = random(255);
    blue5 = random(255);
    red6 = random(255);
    green6 = random(255);
    blue6 = random(255);


    Rad = int(random(100, 300));
    _numSides = int(random(5, 7));
    _strutFactor = noise(_strutNoise)*1.5;
    redraw();
  }
  if (keyCode == LEFT) {
    red1 = random(255);
    green1 = random(255);
    blue1 = random(255);
    red2 = random(255);
    green2 = random(255);
    blue2 = random(255);
    red3 = random(255);
    green3 = random(255);
    blue3 = random(255);
    red4 = random(255);
    green4 = random(255);
    blue4 = random(255);
    red5 = random(255);
    green5 = random(255);
    blue5 = random(255);
    red6 = random(255);
    green6 = random(255);
    blue6 = random(255);


    Rad = int(random(100, 300));
    _numSides = int(random(5, 7));
    _strutFactor = noise(_strutNoise)*2;
    redraw();
  }
}

void mousePressed() {
  clearBackground();
}
