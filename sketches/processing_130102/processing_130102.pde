
/*
SEASON GREET
 The flocking circle around the space
 type your season greeting with your keyboard
 and save it by clicking your mouse to share it
 
 by KokFu Lok
 */

FractalRoot pentagon;
float _strutFactor = 0.1;
float _strutNoise;
int _maxLevels = 3;
float r1=random(width);
float r2=random(height);
String typing = "";
String saved = "";
PFont arial;


void setup() { 
  size(600, 600);
  background(0);
  frameRate(8);
  _strutNoise = random(10);
  arial= loadFont("Arial-BoldItalicMT-24.vlw");
}

void draw() {
  fill(255);
  textFont(arial);
  text(typing, width/4, height/3+30);
  text(saved, width/4, height/3);
  int s=second();
  fill(0, 40);
  rect(0, 0, width, height);
  stroke(s*0.5, 100.23, s*0.23, 20);
  _strutNoise += 0.001; 
  _strutFactor = (noise(_strutNoise)*5)-1;
  pentagon = new FractalRoot(frameCount, r1, r2); 
  pentagon.drawShape();
  // pentagon = new FractalRoot(frameCount, r1-100, r2-100); 
  // pentagon.drawShape();
  pentagon = new FractalRoot(frameCount, width/4, height/3); 
  pentagon.drawShape();
}

void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (key == '\n' ) {
    saved = typing;
    // A String can be cleared by setting it equal to ""
    typing = "";
  } 
  else if ((key == BACKSPACE) &&(typing.length()>0))
  {
    typing = typing.substring(0, typing.length()-1);
  }

  else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = typing + key;
  }
}

void mousePressed() {
  saveFrame("season##.png");
}

// the class to represent the pentagons
class FractalRoot { 
  int pointL=8;
  PointObj[] pointArr = new PointObj[pointL]; 
  Branch rootBranch;

  FractalRoot(float startAngle, float tempcenx, float tempceny) { 
    float centX = tempcenx; 
    float centY = tempceny; 
    int count = 0; 
    for (int i = 0; i<360; i+=360/pointL) {
      float x = centX+(500*cos(radians(startAngle-i))); 
      float y = centY+(280*sin(radians(startAngle+i))); 
      pointArr[count] = new PointObj(x, y); 
      count++;
    } 

    rootBranch = new Branch(0, 3, pointArr);
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
        int nextk = (k+7)%outerPoints.length; 
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
      stroke(outerPoints[i].x, outerPoints[i].y, 100, 90);
      //  line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    }


    // draw midpoints and projected lines
    strokeWeight(0.5); 

    for (int j=0; j<midPoints.length; j++) {
      // draw midpoint
      fill(midPoints[j].x, midPoints[j].y, 100, 20); 
      ellipse(midPoints[j].x, midPoints[j].y, 10, 10);
      // draw projected line
      stroke(255, 6);
      line(midPoints[j].x, midPoints[j].y, projPoints[j].x, projPoints[j].y); 
      //ellipse(projPoints[j].x, projPoints[j].y, 15, 15);
    }


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



