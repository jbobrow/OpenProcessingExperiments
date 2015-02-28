
FractalRoot pentagon;
FractalRoot pentagon1;
int _maxLevels = 4;
int _numSides;
int Rad;
float _strutFactor = 0.2;
float _strutNoise;
float xdirection = 1;
float ydirection = 1;
float xspeed = 2.2;
float yspeed = 2.5;
float red1, blue1, green1;
float red2, blue2, green2;
float red3, blue3, green3;
float red4, blue4, green4;
float red5, blue5, green5;
float red6, blue6, green6;

void setup() {
  background(255);
  frameRate(90);
  size(1000, 1000);
  smooth();
  _strutNoise = random(30);
  _numSides = int(random(3, 10));
  Rad = int(random(200, 300));

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
}

class PointObj {
  float x, y;
  PointObj(float ex, float why) {
    x = ex;
    y = why;

    int rad = 15;
    fill(red1, green1, blue1);  // red
    if (ex > width - rad || why < rad) {
      xdirection  *= -1;
    }
    if (why > height - rad || why < rad) {
      ydirection *= -1;
    }
    ellipse(ex + (xdirection*xspeed), why + (ydirection*yspeed), rad, rad);
  }
}

class FractalRoot {
  PointObj[] pointArr = {
  };
  Branch rootBranch;

  FractalRoot(float startAngle) {
    float centX = width/2;
    float centY = height/2;
    float angleStep = 360.00/_numSides;
    for (float i = 0; i < 360; i += angleStep) {
      float x = centX + (Rad*cos(radians(startAngle + i)));
      float y = centY + (Rad*sin(radians(startAngle + i)));
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

    // THIS IS ADDED IN AFTER YOU PUT IN ALL THE CALC FUNCTIONS.
    if ((level+1) < _maxLevels) {
      Branch childBranch = new Branch(level+1, 0, projPoints);
      myBranches = (Branch[])append(myBranches, childBranch);
      // THIS IS ADDED AFTER THE PREVIOUS LINES: CREATES FIGURE 8.10
      //      for (int k = 0; k < outerPoints.length; k++) {  // 
      //        int nextk = k-1;
      //        if (nextk < 0) {
      //          nextk += outerPoints.length;  //
      //        }
      //        PointObj[] newPoints = { 
      //          projPoints[k], midPoints[k], 
      //          outerPoints[k], midPoints[nextk], projPoints[nextk]
      //        };
      //        childBranch = new Branch(level + 1, k + 1, newPoints);
      //        myBranches = (Branch[])append(myBranches, childBranch);
      //      }
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
    stroke(red2, blue2);
    //stroke(0);
    strokeWeight(5 - level);
    // draw outer shape
    for (int i = 0; i < outerPoints.length; i++) {  // 
      int nexti = i+1;
      if (nexti == outerPoints.length) {
        nexti = 0;
      }
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    }
    stroke(red3, green3, blue3);
    //stroke(0, 0, 255);
    strokeWeight(0.5);
    //    red1 = random(255);
    //    green1 = random(255);
    //    blue1 = random(255);
    fill(red3, green3, blue3);
    //fill(0, 0, 255);  // blue
    for (int j = 0; j < midPoints.length; j++) {
      ellipse(midPoints[j].x, midPoints[j].y, 15, 15);
    }
    // struts
    //stroke(red4, green4, blue4);
    ;
    //stroke(0, 255, 0);
    strokeWeight(0.5);
    //    red1 = random(255);
    //    green1 = random(255);
    //    blue1 = random(255);
    //fill(red5, green5, blue5);
    //fill(0, 255, 0);
    for (int j = 0; j < midPoints.length; j++) {
      stroke(red4, green4, blue4);
      fill(red4, green4, blue4);  // green
      ellipse(midPoints[j].x, midPoints[j].y, 10, 10);
      stroke(red5, green5, green5);
      line(midPoints[j].x, midPoints[j].y, projPoints[j].x, projPoints[j].y);
      stroke(red6, green6, blue6);
      fill(red6, green6, blue6);  // pink 
      ellipse(projPoints[j].x, projPoints[j].y, 10, 10);
    }
    for (int k = 0; k < myBranches.length; k++) {
      myBranches[k].drawMe();
    }
  }
}

void draw() {
  //background(255);
  pentagon = new FractalRoot(frameCount);
  _strutNoise += 0.01;
  _strutFactor = noise(_strutNoise)*2;
  translate(xdirection, ydirection);
  pentagon.drawShape();
}


void keyPressed() {
  //if (keyCode == ENTER) {
    //saveFrame("Sutcliffe Stiff Panarama ####.tif");
  //}
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


    xdirection *= 5;
    _strutNoise = random(30);
    _numSides = int(random(3, 10));
    Rad = int(random(200, 300));
    pentagon.drawShape();
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

    ydirection *= 5;
    _strutNoise = random(30);
    _numSides = int(random(3, 10));
    Rad = int(random(200, 300));
    pentagon.drawShape();
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

    xdirection *= -5;
    _strutNoise = random(30);
    _numSides = int(random(3, 10));
    Rad = int(random(200, 300));
    pentagon.drawShape();
    redraw();
  }
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

    ydirection *= -5;
    _strutNoise = random(30);
    _numSides = int(random(3, 10));
    Rad = int(random(200, 300));
    pentagon.drawShape();
    redraw();
  }
}

void mousePressed() {
  //background(255);
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

  pentagon1 = new FractalRoot(frameCount);
  pentagon1.drawShape();
  xdirection = int(random(-300, 300));
  ydirection = int(random(-300, 300));
  Rad = int(random(200, 400));
  redraw();
}
