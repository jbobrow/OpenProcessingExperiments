
//Season's Greetings
//MERRY CHRISTMAS !
//TREE, STAR, DECORATION AND SMALL SYLPH
//lin wenyu  (ken3101462@gmail.com)


FractalRoot pentagon;
float _strutFactor = 0.01;
float _strutNoise;
int _maxLevels = 3;
PFont font;
PImage img;


void setup() { 
  size(800, 600); 
  _strutNoise = random(10);
  font= loadFont("AngsanaNew-BoldItalic-48.vlw");
  textFont(font);
  img= loadImage("Signature.png");
}

void draw() {
  background(0);
  _strutNoise += 0.01; 
  _strutFactor = (noise(_strutNoise)*3)-1;
  pentagon = new FractalRoot(frameCount); 
  pentagon.drawShape();

  fill(255);
  textSize(36);
  text("MERRY CHRISTMAS !", 35, 570);

  fill(255);
  image(img, width-120, height-70, 100, 50);
}

class FractalRoot { 
  PointObj[] pointArr = new PointObj[8]; 
  Branch rootBranch;

  FractalRoot(float startAngle) { 
    float centX = width/2; 
    float centY = height/2; 
    int count = 0; 
    for (int i = 0; i<360; i+=45) {
      float x = centX+(280*cos(radians(startAngle+i))); 
      float y = centY+(280*sin(radians(startAngle+i))); 
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
    //strokeWeight(5 - level);
    for (int i=0; i<outerPoints.length; i++) {
      int nexti = i+1;
      if (nexti == outerPoints.length) {
        nexti = 0;
      }
      //Christmas tree
      strokeWeight(3 - level);
      stroke(255);
      //stroke(20, random(170, 200), 60, 20);
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);

      //Christmas decoration
      noStroke();
      fill(255, random(10), random(10), random(50, 100));
      ellipse(outerPoints[i].x, outerPoints[i].y, random(5, 8), random(5, 8));
      fill(255, random(10), random(10), random(50, 80));
      ellipse(outerPoints[nexti].x, outerPoints[nexti].y, random(8, 10), random(8, 10));

      //Christmas tree star
      strokeWeight(1);
      stroke(255, 255, 0);
      line(width/2+(outerPoints[i].x/20)-20, height/2+(outerPoints[i].y/20)-16, 
      width/2+(outerPoints[nexti].x/20)-20, height/2+(outerPoints[nexti].y/20)-16);

      //SYLPH
      fill(255, 50);
      ellipse(outerPoints[i].x*2, outerPoints[i].y*2, random(3), random(3));
      fill(255, 50);
      ellipse(outerPoints[nexti].x*2, outerPoints[nexti].y*2, random(3), random(3));
      fill(255, 50);
      ellipse(outerPoints[i].x-width/3, outerPoints[i].y-height/3, random(3), random(3));
      fill(255, 50);
      ellipse(outerPoints[nexti].x+width/3, outerPoints[nexti].y-height/1.5, random(3), random(3));
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



