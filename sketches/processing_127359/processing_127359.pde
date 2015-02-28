
//Season's Greetings
/*There are four choose of greetings,when click mouse's left button will change 
 the text,and click the right will take a photo at the same time.*/
//By the way,if you click mouse over four times,the text will go back to the first text.
//Reference: IK explosions by Ben Jack http://www.openprocessing.org/sketch/8351
//Reference: Exercise Program for the lecture on "Fractals" by Professor Chien
//Chiming Lu

FractalRoot pentagon;
float _strutFactor = 0.2;
float _strutNoise;
int _maxLevels = 4;
IKChain[] ch;

float thet = 0;
int chainCount = 400;
int startRad = -5;
float spd = 10;
int len = 35;
int cnt = 40;
int mousenum=0;

void setup() { 
  size(800, 600); 
  _strutNoise = random(10);
  background(100, 0, 0);
  ch = new IKChain[00];
  stroke(255, 25);
  noFill();

  float centX = width/2; 
  float centY = height/2; 
  ch = new IKChain[chainCount];

  for (int i = 1; i < ch.length; i++) {
    float theta = TWO_PI/(ch.length+0.0) * i;
    float xP = centX;
    float yP = centY;
    ch[i] = new IKChain(xP, yP, theta, spd, len, cnt);
  }
}

void draw() {

  //background(100, 0, 0);
  _strutNoise += 0.01; 
  _strutFactor = (noise(_strutNoise)*3)-1;

  pentagon = new FractalRoot(frameCount); 
  pentagon.drawShape();
  switch(mousenum) {
  

  case 0:
    textSize(12);
    text("HAPPY NEW YEAR", width/2-50, height/2-10) ;
    break ;

  case 1:
    textSize(32);
    text("Merry Xmas", width/2-90, height/2-10) ;
    break ;

  case 2:
    textSize(20);
    text("Happy Holidays", width/2-50, height/2+20) ;
    break ;

  case 3:
    textSize(24);
    text("Season's Greetings", width/2, height/2) ;
    break ;
  }


  for (int i = 1; i < ch.length; i++) {
    if (ch[i] != null) {
      ch[i].advance();
      ch[i].drawMe();
    }
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    //noLoop();
    saveFrame("img-###.png");
  }
  else if (mouseButton == LEFT) {
    background(100, 0, 0);
    mousenum = mousenum + 1 ;
    if (mousenum > 3) {
      mousenum = 0 ;
    }
  }
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
      float x = centX+(280*cos(radians(startAngle+i))); 
      float y = centY+(280*sin(radians(startAngle+i))); 
      pointArr[count] = new PointObj(x, y); 
      count++;
    } 

    rootBranch = new Branch(1, 0, pointArr);
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

    IKPoint[] pts;
    strokeWeight(5 - level);
    stroke(100, 0, 0);
    //beginShape();
    for (int i=0; i<outerPoints.length; i++) {
      int nexti = i+1;
      if (nexti == outerPoints.length) {
        nexti = 0;
      }
      //ellipse(outerPoints[i].x, outerPoints[i].y,10,10);

      //line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);

      //curveVertex(outerPoints[i].x, outerPoints[i].y);

      point(outerPoints[i].x, outerPoints[i].y);
    }
    //endShape();

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




//class01----------------------------------------------------------------------------------------------------------------------------------

class IKChain {

  IKPoint[] pts;
  float  vx, vy, theta, speed;
  float life = 0;
  int maxRan = 180;

  IKChain(float xP, float yP, float thet, float spd, float unit, int unitCount) { 
    theta = thet;
    speed = spd;
    vx = cos(theta)*speed;
    vy = sin(theta)*speed;
    pts = new IKPoint[unitCount];

    for (int i = 0; i < pts.length; i++) {
      pts[i] = new IKPoint(xP, yP, unit);

      if (i>0) {
        pts[i].addNeighbour(pts[i-1]);
        pts[i-1].addNeighbour(pts[i]);
      }
    }
  }

  void drawMe() {

    beginShape();
    for (int i = 0; i < pts.length; i+=2) {
      /*if (white)
       stroke(255, 10);
       else
       stroke(0, 10);*/
      stroke(255, 10);
      curveVertex(pts[i].x, pts[i].y);
      //ellipse(pts[i].x, pts[i].y,10,10);
    }
    endShape();
  }

  void advance() {
    life+=0.4;
    float chaos = PI/random(5, maxRan);
    chaos = Math.floor(random(2)) == 0 ? chaos : - chaos;
    theta += chaos;
    vx = cos(theta)*speed;
    vy = sin(theta)*speed;
    pts[pts.length-1].move(vx, vy);
  }
}

//class02----------------------------------------------------------------------------------------------------------------------------------

class IKPoint {
  float x, y;
  float d;
  ArrayList neighbours;
  IKPoint(float xP, float yP, float dst) {
    d = dst;
    neighbours = new ArrayList();
    this.x = xP;
    this.y = yP;
  }

  void addNeighbour(IKPoint pt) {
    this.neighbours.add(pt);
  }

  void move(IKPoint parent) {
    makeMove(this, parent);
    for (int i = 0; i<neighbours.size();i++) {
      IKPoint pt = (IKPoint)neighbours.get(i);
      if (parent!=pt)
        pt.move(this);
    }
  }

  void move(float xP, float yP) {
    this.x += xP;
    this.y += yP;
    for (int i = 0; i<neighbours.size();i++) {
      IKPoint pt = (IKPoint)neighbours.get(i);
      pt.move(this);
    }
  }

  void makeMove(IKPoint child, IKPoint parent) {
    float dx = child.x-parent.x;
    float dy = child.y-parent.y;
    float theta = atan2(dy, dx);
    child.x = parent.x+cos(theta)*d;
    child.y = parent.y+sin(theta)*d;
  }
}



