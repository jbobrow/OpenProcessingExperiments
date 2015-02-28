
int num=100;
FCurve[]fc=new FCurve[num];

void setup() {
  size(600, 400);
  smooth();
  for (int i=0; i<num; i++) {
    fc[i]=new FCurve(random(-250, 250), random(10, 30), random(360), 
    random(-1, 1), random(200));
  }
}

void draw() {
  background(255);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    fc[i].update();
    fc[i].display();
  }
}

class FCurve {
  float mY, CX, angle, anam, ff;
  FCurve(float nMY, float nCX, float nAngle, float nAnam, float nFf) {
    mY=nMY;
    CX=nCX;
    angle=nAngle;
    anam=nAnam;
    ff=nFf;
  }

  void update() {
    angle=angle+anam;
  }

  void display() {
    pushMatrix();
    rotate(radians(angle));
    fill(ff, 100);
    noStroke();
    bezier(0, 0, CX, mY-mY/2, CX, mY-mY/3, 0, mY);
    bezier(0, 0, -CX, mY-mY/2, -CX, mY-mY/3, 0, mY);
    popMatrix();
  }
}
