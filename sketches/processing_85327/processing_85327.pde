

int numCircles = 4;
int numPntsInCircle = 15;
float radius = 20;
float radiusStep = 50;
PVector center = new PVector(-100,40);
int numPnts =  numCircles*numPntsInCircle;
float[] cu = new float[numPnts];
float[] cv = new float[numPnts];
float slope = 0;
float offsetV = -10;
float offsetU = -90;
float stepSize = 20;



float xPos = 100;
float yPos = 100;
float xStart;
float yStart;
float xCurrent;
float yCurrent;
float scaleFactor = 2;

fourBar linkage;

void setup() {
  size(800, 900);
  smooth();
  
  /*
  for (int i=0; i< cu.length; i++) {
    cu[i] = (i%(cu.length/2)*stepSize)+offsetU;
    if (i>cu.length/2) {
      cv[i] = cu[i]*slope-offsetV;
    }
    else {
      cv[i] = cu[i]*slope + offsetV;
    }
  }*/
  
  float angleIncrement = TWO_PI/numPntsInCircle;
  float angle = 0;
  int pntIndex = 0;
  for(int i = 0; i< numCircles; i++){
    for(int j=0; j< numPntsInCircle; j++){
      angle += angleIncrement;
      cu[pntIndex] = center.x+radius*cos(angle);
      cv[pntIndex] = center.y+radius*sin(angle);
      pntIndex+=1;
    }
    radius += radiusStep;
    //angle += angleIncrement/2;
  }
  

  linkage = new fourBar(30, 70, 80, 79, cu, cv);
  linkage.updateGeometry(true);
}



void draw() {
  /*if (record) {
    beginRecord(PDF, "frameLinkage-####.pdf");
  }*/
  
  background(255);
  translate(xPos, yPos);
  scale(scaleFactor);
  linkage.drawLinks();
  linkage.incrementAngle();
  if (linkage.count < linkage.numPoints) {
    linkage.addPointToPath();
    linkage.count +=1;
  }else{
    //println("done saving paths");
  }
  linkage.updateGeometry(false);
  linkage.drawPaths(1);

  /*if (record) {
    endRecord();
    record = false;
  }*/
}

void mousePressed() {
  xStart = mouseX;
  yStart = mouseY;
}
void mouseDragged() {
  xPos = mouseX-xStart+xCurrent;
  yPos = mouseY-yStart+yCurrent;
}

void mouseReleased() {
  xCurrent = xPos;
  yCurrent = yPos;
}

void keyPressed() {
  //translate to the first pivot
  if (key == 'p') {
    xPos = 10;
    yPos = 10;
    scaleFactor=3;
  }
  if (key == 'r') {
    //record = true;
  }
}

void mouseScrolled() {
  if (mouseScroll > 0) {
    // scroll up
    println(mouseScroll);
  } else if (mouseScroll < 0) {
    // scroll down
    println("down");
  }
  
  float scaleDelta = mouseScroll*.1;
  float oldSF = scaleFactor;
  scaleFactor= constrain(scaleFactor+scaleDelta, .02, 20);

  //this is so that zoom to mouse position
  float xRel = (1/oldSF)*(mouseX-xPos)*scaleFactor+xPos;
  float yRel = (1/oldSF)*(mouseY-yPos)*scaleFactor+yPos;
  float xTrans = mouseX-xRel;
  float yTrans = mouseY-yRel;
  xPos += xTrans;
  yPos += yTrans;
  
  
}

void zoom(int delta) {
  //println("mouse moved by " +delta + "units");
  float scaleDelta = delta*.1;
  float oldSF = scaleFactor;
  scaleFactor= constrain(scaleFactor+scaleDelta, .02, 20);

  //this is so that zoom to mouse position
  float xRel = (1/oldSF)*(mouseX-xPos)*scaleFactor+xPos;
  float yRel = (1/oldSF)*(mouseY-yPos)*scaleFactor+yPos;
  float xTrans = mouseX-xRel;
  float yTrans = mouseY-yRel;
  xPos += xTrans;
  yPos += yTrans;
}

class fourBar {
  // GLOBAL VARIABLES
  float lp;
  float lq;
  float lr;
  float ls;
  float lt;
  float[] cu;
  float[] cv;
  int numTraces;
  int count = 0;

  PVector O = new PVector(0, 0);
  PVector A;
  PVector B;
  PVector[] traces;
  PVector D;

  float phi = radians(90);
  float theta;
  float psi;
  boolean isDirect = true;
  float angleStep = 1;
  int numPoints = 360/(int)angleStep;
  float tolerance = .001;
  PVector[][] paths;

  //CONSTRUCTOR
  fourBar(float _lp, float _lq, float _lr, float _ls, 
  float[] _cu, float[] _cv) {
    lp = _lp;
    lq = _lq;
    lr = _lr;
    ls = _ls;
    cu = _cu;
    cv = _cv;
    numTraces = cu.length;
    traces = new PVector[numTraces];
    paths = new PVector[numPoints][numTraces];
  }

  //FUNCTIONS
  void addPointToPath() {
    for (int i=0; i< numTraces; i++) {
      paths[count][i] = traces[i].get();
      //println(traces[i]);
    }
  }

  void incrementAngle() {
    phi += radians(angleStep);
  }
  void updateGeometry(boolean isInit) {
    if (isInit) {
      D = new PVector(O.x+ls, 0);
      A = new PVector(lp*cos(phi), lp*sin(phi), 0.0);
      calculatePsi();
      B = new PVector(lr*cos(psi)+ls, lr*sin(psi));
      calculateTheta();
      for (int i = 0; i< numTraces; i++) {
        PVector C = new PVector(A.x+cu[i]*cos(theta)-cv[i]*sin(theta), 
        A.y+cu[i]*sin(theta)+cv[i]*cos(theta));
        traces[i] = C;
      }
    }
    else {
      A.set(lp*cos(phi), lp*sin(phi), 0.0);
      calculatePsi();
      B.set(lr*cos(psi)+ls, lr*sin(psi), 0.0);
      calculateTheta();
      for (int i = 0; i< numTraces; i++) {
        traces[i].set(A.x+cu[i]*cos(theta)-cv[i]*sin(theta), 
        A.y+cu[i]*sin(theta)+cv[i]*cos(theta), 0.0);
      }
    }
  }

  void calculatePsi() {
    float beta;
    float alph;
    lt  = dist(A.x, A.y, D.x, D.y);
    beta = acos((pow(lt, 2)-pow(lq, 2)+pow(lr, 2))/2/lr/lt);
    alph = atan2(A.y, A.x-D.x);
    if (isDirect) {
      //beta *= -1;
    }

    psi = alph+beta;
  }

  void calculateTheta() {
    PVector AB = PVector.sub(B, A);
    theta = atan2(AB.y, AB.x);
  }

  boolean isAbove() {
    return ((D.x-A.x)*(B.y-A.y)-(D.y-A.y)*(B.x-A.x))>0;
  }

  void drawPaths(float r) {
    fill(0, 0, 0,100);
    noStroke();
    for (int i=0; i< numTraces; i++) {
      for (int j=0; j< count; j++) {
        //println(paths[0][i]);
        ellipse(paths[j][i].x, paths[j][i].y, r, r);
      }
    }
  }

  void drawLinks() {
    float rLink = 2;
    float rTrace = 3;
    float linkThickness = 3;
    color linkCol = color(0, 0, 0, 100);
    strokeWeight(linkThickness);
    float lpDist = dist(O.x, O.y, A.x, A.y);
    if (abs(lpDist-lp)>tolerance) {
      stroke(linkCol);
    } 
    else {
      stroke(200);
    }
    line(O.x, O.y, A.x, A.y);

    float lqDist = dist(A.x, A.y, B.x, B.y);
    if (abs(lqDist-lq)>tolerance) {
      stroke(linkCol);
    } 
    else {
      stroke(200);
    }

    line(A.x, A.y, B.x, B.y);

    float lrDist = dist(B.x, B.y, D.x, D.y);
    if (abs(lrDist-lr)>tolerance) {
      stroke(linkCol);
    } 
    else {
      stroke(200);
    }
    line(B.x, B.y, D.x, D.y);

    noFill();
    strokeWeight(1);
    stroke(0);
    ellipse(O.x, O.y, rLink, rLink);
    ellipse(A.x, A.y, rLink, rLink);
    ellipse(B.x, B.y, rLink, rLink);
    stroke(100, 100, 100);
    strokeWeight(.5);
    for (int i=0; i < numTraces; i++) {
      ellipse(traces[i].x, traces[i].y, rTrace, rTrace);
    }

    stroke(0);
    ellipse(D.x, D.y, rLink, rLink);




    for (int i = 0; i < numTraces; i++) {
      noFill();
      noStroke();
      beginShape();
      vertex(A.x, A.y);
      vertex(traces[i].x, traces[i].y);
      vertex(B.x, B.y);
      endShape(CLOSE);
    }
  }
}



