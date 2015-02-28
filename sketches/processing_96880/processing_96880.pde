
FractalRoot pentagon;
FractalRoot pentagon1;
int _maxLevels = 4;
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
float red7, blue7, green7;

void setup() {
  background(255);
  size(1000, 1000);
  _strutNoise = random(10);
  smooth();
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
  red7 = random(255);
  green7 = random(255);
  blue7 = random(255);
}

class PointObj {
  float x, y;
  PointObj(float ex, float why) {
    x = ex;
    y = why;

    int rad = 15;
    fill(red1, green1, blue1); 
    ellipse(ex, why, rad, rad);
  }
}

class FractalRoot {
  PointObj[] pointArr = new PointObj[5];
  Branch rootBranch;

  FractalRoot(float startAngle) {
    float centX = width/2;
    float centY = height/2;
    int count = 0;
    for (int i = 0; i < 360; i += 72) {
      float x = centX + (200*cos(radians(startAngle + i)));
      float y = centY + (200*sin(radians(startAngle + i)));
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

  Branch(int lev, int n, PointObj[]points) {  
    level = lev;
    num = n;
    outerPoints = points;
    midPoints = calcMidPoints();
    projPoints = calcStrutPoints();

    if ((level+1) < _maxLevels) {
      Branch childBranch = new Branch(level+1, 0, projPoints);
      myBranches = (Branch[])append(myBranches, childBranch);
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
    strokeWeight(5 - level);
    // draw outer shape
    for (int i = 0; i < outerPoints.length; i++) {   
      int nexti = i+1;
      if (nexti == outerPoints.length) {
        nexti = 0;
      }
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    }
    stroke(red3, green3, blue3);
    strokeWeight(0.5);
    fill(red3, green3, blue3);
    for (int j = 0; j < midPoints.length; j++) {
      ellipse(midPoints[j].x, midPoints[j].y, 15, 15);
    }
    // struts
    stroke(red4, green4, blue4);
    ;
    strokeWeight(0.5);
    for (int j = 0; j < midPoints.length; j++) {
      fill(red5, green5, blue5);  // green
      ellipse(midPoints[j].x, midPoints[j].y, 10, 10);
      line(midPoints[j].x, midPoints[j].y, projPoints[j].x, projPoints[j].y);
      fill(red6, green6, blue6);  // pink 
      ellipse(projPoints[j].x, projPoints[j].y, 10, 10);
    }
    for (int k = 0; k < myBranches.length; k++) {
      myBranches[k].drawMe();
    }
  }
}

void draw() {
  pentagon = new FractalRoot(frameCount);
  _strutNoise += 0.01;
  _strutFactor = noise(_strutNoise)*2;
  pentagon.drawShape();
  xdirection = xdirection + 1;
  ydirection = ydirection + 1;
  if (xdirection > width) {
    xdirection *= -1;
  }
  if (ydirection > height) {
    ydirection *= -1;
  }
  pentagon.drawShape();
  pentagon.drawShape();
  
  // Comment out this command to take continuous screenshots. 
  //saveFrame("Coin Screen ####.tif");
}


//void keyPressed() {
  //if (keyCode == ENTER) {
    //saveFrame("Coin ####.tif");
  //}
//}

void mousePressed() {
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
  red7 = random(255);
  green7 = random(255);
  blue7 = random(255);
  background(red7, green7, blue7);
  redraw();
}
