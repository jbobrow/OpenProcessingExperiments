
int num=10;
ComLines[]cl=new ComLines[num];

void setup() {
  size(600, 400);
  background(255);
  smooth();
  for (int i=0; i<num; i++) {
    cl[i]=new ComLines(random(width), random(height), random(-2, 2), 
    random(-2, 2), random(width), random(height), random(50), random(2, 10), 
    random(255), random(255), random(255));
  }
}

void draw() {
  for (int i=0; i<num; i++) {
    cl[i].display();
  }
}

void mousePressed() {
  background(255);
  for (int i=0; i<num; i++) {
    cl[i]=new ComLines(random(width), random(height), random(-2, 2), 
    random(-2, 2), random(width), random(height), random(50), random(2, 10), 
    random(255), random(255), random(255));
  }
}

class ComLines {
  float X, Y, amX, amY, sX, sY, sAmX, sw, R, G, B;
  ComLines(float nX, float nY, float nAmX, float nAmY, float nSX, float nSY, 
  float nSAmX, float nSw, float nR, float nG, float nB) {
    X=nX;
    Y=nY;
    amX=nAmX;
    amY=nAmY;
    sX=nSX;
    sY=nSY;
    sAmX=nSAmX;
    sw=nSw;
    R=nR;
    G=nG;
    B=nB;
  }

  void display() {
    stroke(R, G, B, 100);
    if (X<sX && X+sAmX>sX) {
      amX=0;
      Y=Y+amY;
      line(X-sw, Y, X+sw, Y);
    } 
    else {
      X=X+amX;
      line(X, Y-sw, X, Y+sw);
    }
    if (X>width || X<0) {
      amX=-amX;
    }
    if (Y>height || Y<0) {
      amY=-amY;
      amX=random(-2, 2);
      amY=random(-2, 2);
      sX=random(width);
      sY=random(height);
      sAmX=random(50);
    }
  }
}

