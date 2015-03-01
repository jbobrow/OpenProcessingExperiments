
int num = 300;
myLine[] L = new myLine[num];
myArc[] A = new myArc[num];
void setup() {
  size(500, 500, P2D);
  background(0);
  noFill();
  strokeWeight(2);
  stroke(255);
  for(int i = 0; i < num; i++) {
    L[i] = new myLine(width, height, width/2, height/2);
    A[i] = new myArc(width, height, width/2, height/2);
  }
}


void draw() {
  
  background(0);
  for(int i = 0; i < num; i++) {
    if(L[i].nFrame <= L[i].slice) {
      L[i].update();
    } else {
      L[i] = new myLine(width, height, mouseX, mouseY);
    }
    
    if(A[i].nFrame <= A[i].piece) {
      A[i].update();
    } else {
//      println(frameRate);
      A[i] = new myArc(width, height, mouseX, mouseY);
    }
  } 
  
}


class myLine {
  
  PVector startPoint;
  PVector[] movingPoint = new PVector[2];
  PVector direction;
  float myLength;
  float timeStep;
  int nFrame = 1;
  int slice;
  color c;
  int weight;

  myLine(int wid, int hei, float Xc, float Yc) {

    startPoint = new PVector( random(-100.0, (float)wid + 100), random(-100.0, (float)hei + 100));
    direction = new PVector(Xc - startPoint.x, Yc - startPoint.y);
    myLength = direction.mag();
    slice = (int)random(50, 100);
    timeStep = myLength / (float)slice;
    direction.normalize();
    movingPoint[0] = startPoint;
    movingPoint[1] = PVector.add(startPoint, PVector.mult(direction, timeStep));
    c = color(150, 200, random(200, 250));
    weight = (int)random(1, 5);
  }
  
  void update() {
//    pushStyle(); 
    stroke(c, 255.0 - 255*cos( (float)nFrame * timeStep*TWO_PI/myLength) );       
    strokeWeight(weight);   
    line(movingPoint[0].x, movingPoint[0].y, movingPoint[1].x, movingPoint[1].y);
//    popStyle();
    movingPoint[0] = movingPoint[1];
    movingPoint[1] = PVector.add(movingPoint[0], PVector.mult(direction, timeStep));
    nFrame ++;  
  }
  
}
    
class myArc {
  PVector startPoint;
  PVector[] movingPoint = new PVector[2];
  float myRange;
  int piece;
  float myMag;
  float myAngle;
  float timeStep;
  int nFrame = 1;
  int slice;
  color c;
  int weight;
  float Rx, Ry;
  
  myArc(int wid, int hei, float Xc, float Yc) {
    wid *= 0.2;
    hei *= 0.2;
    Rx = Xc;
    Ry = Yc;
    PVector reference = new PVector(1.0, 0.0);
    startPoint = new PVector( random(-(float)wid, (float)wid), random(-(float)hei, (float)hei));
    myAngle = PVector.angleBetween(startPoint, reference);
    if(startPoint.y < 0) {
      myAngle *= -1.0;
    }
    myMag = startPoint.mag();
    myRange = random(-TWO_PI, TWO_PI);
    piece = (int)random(50, 100);
    timeStep = myRange / (float)piece;
    c = color(250, 250, random(100, 150));
    weight = (int)random(1, 5);
    movingPoint[0] = new PVector(startPoint.x + Rx, startPoint.y + Ry);
    startPoint.set(myMag * cos(myAngle + timeStep), myMag * sin(myAngle + timeStep));
    movingPoint[1] = new PVector(startPoint.x + Rx, startPoint.y + Ry);
    
  }
  
  void update() {
//    pushStyle(); 
    stroke(c, 255.0 - 255*cos( (float)nFrame * timeStep*TWO_PI/myRange) );
    strokeWeight(weight);
    line(movingPoint[0].x, movingPoint[0].y, movingPoint[1].x, movingPoint[1].y);
//    popStyle();
    movingPoint[0] = movingPoint[1];
    startPoint.set(myMag * cos(myAngle + nFrame * timeStep), myMag * sin(myAngle + nFrame * timeStep) ); 
    movingPoint[1] = new PVector(startPoint.x + Rx, startPoint.y + Ry);
    nFrame ++;  
    
  }
  
}



