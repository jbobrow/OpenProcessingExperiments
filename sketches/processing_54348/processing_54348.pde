
int num=50;
MAngle ma;
MoveTSVertex[]mtsv=new MoveTSVertex[num];

void setup() {
  size(800, 600, P3D);
  ma=new MAngle(mouseX, mouseY, mouseX, mouseY, 20);
  for (int i=0; i<num; i++) {
    mtsv[i]=new MoveTSVertex(0, 0, 0, random(-2, 2), random(-2, 2), random(-2, 2), 
    random(255), random(255), random(255));
  }
}

void draw() {
  background(0);
  ma.update();
  ma.display();
  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<num; i++) {
    mtsv[i].update();
    mtsv[i].display();
  }
  endShape(CLOSE);
  for (int i=0; i<num; i++) {
    mtsv[i].display2();
  }
}

void mousePressed() {
  for (int i=0; i<num; i++) {
    mtsv[i]=new MoveTSVertex(0, 0, 0, random(-2, 2), random(-2, 2), random(-2, 2), 
    random(255), random(255), random(255));
  }
}

class MAngle {
  float anX, anY, anDisX, anDisY, anDelay;
  MAngle(float nAnX, float nAnY, float nAnDisX, float nAnDisY, float nAnDelay) {
    anX=nAnX;
    anY=nAnY;
    anDisX=nAnDisX;
    anDisY=nAnDisY;
    anDelay=nAnDelay;
  }

  void update() {
    anDisX=mouseX-anX;
    anDisY=mouseY-anY;
    anX=anX+anDisX/anDelay;
    anY=anX+anDisY/anDelay;
  }

  void display() {
    translate(width/2, height/2);
    rotateX(radians(anX));
    rotateY(radians(anY));
  }
}

class MoveTSVertex {
  float X, Y, Z, amX, amY, amZ, FcolorR, FcolorG, FcolorB;
  MoveTSVertex(float nX, float nY, float nZ, float nAmX, float nAmY, float nAmZ, 
  float nFcolorR, float nFcolorG, float nFcolorB) {
    X=nX;
    Y=nY;
    Z=nZ;
    amX=nAmX;
    amY=nAmY;
    amZ=nAmZ;
    FcolorR=nFcolorR;
    FcolorG=nFcolorG;
    FcolorB=nFcolorB;
  }

  void update() {
    if (X>180 || X<-180) {
      amX=-amX;
      amX=random(-2, 2);
    }
    if (Y>180 || Y<-180) {
      amY=-amY;
      amY=random(-2, 2);
    }
    if (Z>180 || Z<-180) {
      amZ=-amZ;
      amZ=random(-2, 2);
    }
    X=X+amX;
    Y=Y+amY;
    Z=Z+amZ;
  }

  void display() {
    strokeWeight(1.5);
    stroke(FcolorR, FcolorG, FcolorB, 100);
    fill(FcolorR, FcolorG, FcolorB, 10);
    vertex(X, Y, Z);
  }

  void display2() {
    strokeWeight(10);
    stroke(255, 100);
    point(X, Y, Z);
  }
}

