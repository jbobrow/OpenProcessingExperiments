
// Chun Yi Wu 
//my concept is Merry Christmas card 
//I want the message of congratulation by using the icon separating or gathering
 
PImage img2;
PImage img;
PFont font;

FractalRoot icon;
FractalRoot icon2;

float _strutFactor = 0.2;
float _strutNoise;
int _maxLevels = 4;

void setup() {
   
  size(800, 800); 
  font = loadFont("Baskerville-BoldItalic-48.vlw");
  textFont(font);
  img = loadImage("77.png");
  img2 = loadImage("66.png");
  
}

void draw() {
  background(193,8,23);
  _strutNoise += 0.01; 
  _strutFactor = (noise(_strutNoise)*3)-1;
  icon = new FractalRoot(frameCount); 
  icon2 = new FractalRoot(-1*frameCount); 
  icon.drawShape();
  icon2.drawShape2();
}



// the class to represent the pentagons
class FractalRoot { 
  PointObj[] pointArr = new PointObj[6];
  PointObj[] pointArr2 = new PointObj[6];
  Branch rootBranch;
  Branch rootBranch2;

  FractalRoot(float startAngle) { 
    float centX = width/2; 
    float centY = height/2; 
    float centX2 = width/2; 
    float centY2 = height/2; 
    int count = 0; 
    for (int i = 0; i<360; i+=60) {
      float x = centX+(200*cos(radians(startAngle+i))); 
      float y = centY+(380*sin(radians(startAngle+i))); 
      float x2= centX2+(380*cos(radians(startAngle+i))); 
      float y2= centY2+(200*sin(radians(startAngle+i))); 
      pointArr[count] = new PointObj(x, y); 
      pointArr2[count] = new PointObj(x2, y2);
      count++;
    } 

    rootBranch = new Branch(2, 0, pointArr);
    rootBranch2 = new Branch(2, 0, pointArr2);
  }

  void drawShape() { 
    rootBranch.drawMe();
  }
  void drawShape2() {
    rootBranch2.drawMe();
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

    for (int i=0; i<outerPoints.length; i++) {
      int nexti = i+1;
      if (nexti == outerPoints.length) {
        nexti = 0;
      }
      
      strokeWeight(0.5);
      stroke(1, 100, 60);
      noFill();
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
      image(img2, outerPoints[i].x-20, outerPoints[i].y-22);
      stroke(255 , 20);
      strokeWeight(0);
      line(outerPoints[i].x, outerPoints[i].y, width-41, 221);
      image(img, width-50, 200);
      textSize(20);
      fill(193,8,23);
      noStroke();
      text("Merry Christmas", width/2-80, height/2);
      
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



