
int num=20;
PDrawing[] pd=new PDrawing[num];

void setup() {
  size(600, 400);
  background(255);
  smooth();
  stroke(0, 100);
  strokeWeight(1.5);
  for (int i=0; i<num; i++) {
    pd[i]=new PDrawing(0, 0, random(-2, 2), random(-2, 2), 
    random(360), random(-2, 2), random(2, 30));
  }
}

void draw() {
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pd[i].update();
    pd[i].display();
  }
}

void mousePressed() {
  background(255);
  for (int i=0; i<num; i++) {
    pd[i]=new PDrawing(0, 0, random(-2, 2), random(-2, 2), 
    random(360), random(-2, 2), random(2, 30));
  }
}

class PDrawing {
  float X, Y, amX, amY, angle, anAm, anL;
  PDrawing(float nX, float nY, float nAmX, float nAmY, float nAngle, float nAnAm, 
  float nAnL) {
    X=nX;
    Y=nY;
    amX=nAmX;
    amY=nAmY;
    angle=nAngle;
    anAm=nAnAm;
    anL=nAnL;
  }

  void update() {
    if (X>100 || X<-100) {
      amX=-amX;
      amX=random(-0.2, 0.2);
    }
    if (Y>100 || Y<-100) {
      amY=-amY;
      amY=random(-0.2, 0.2);
    }
    if (angle>360 || angle<0) {
      X=X+amX;
      Y=Y+amY;
      anAm=-anAm;
      anAm=random(-2, 2);
    }
    angle=angle+anAm;
  }

  void display() {
    pushMatrix();
    translate(X-anL, Y-anL);
    rotate(radians(angle));
    point(X, Y);
    popMatrix();
  }
}

