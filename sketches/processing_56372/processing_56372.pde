
int num=20;
ComLines[]cl=new ComLines[num];

void setup() {
  size(600, 400);
  background(255);
  smooth();
  for (int i=0; i<num; i++) {
    cl[i]=new ComLines(random(width), random(height), random(-2, 2), 
    random(-2, 2), random(width), random(height), random(50), random(2));
  }
}

void draw() {
  for (int i=0; i<num; i++) {
    cl[i].update();
    cl[i].display();
  }
}

void mousePressed() {
  background(255);
  for (int i=0; i<num; i++) {
    cl[i]=new ComLines(random(width), random(height), random(-2, 2), 
    random(-2, 2), random(width), random(height), random(50), random(2));
  }
}

class ComLines {
  float X, Y, amX, amY, sX, sY, sAmX, sw;
  ComLines(float nX, float nY, float nAmX, float nAmY, float nSX, float nSY, 
  float nSAmX, float nSw) {
    X=nX;
    Y=nY;
    amX=nAmX;
    amY=nAmY;
    sX=nSX;
    sY=nSY;
    sAmX=nSAmX;
    sw=nSw;
  }

  void update() {
    if (X<sX && X+sAmX>sX) {
      amX=0;
      Y=Y+amY;
    } 
    else {
      X=X+amX;
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

  void display() {
    stroke(0, 100);
    strokeWeight(sw);
    point(X, Y);
  }
}

