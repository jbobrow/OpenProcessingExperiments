
int num=10;
MixShapes[] ms=new MixShapes[num];

void setup() {
  size(800, 600, P3D);
  noStroke();
  for (int i=0; i<num; i++) {
    ms[i]=new MixShapes(random(-200, 200), random(-200, 200), 
    random(-200, 200), random(-200, 200), random(-200, 200), 
    random(-200, 200), random(-200, 200), random(-200, 200), 
    random(-200, 200), random(-2, 2), random(-2, 2), 
    random(-2, 2), random(-2, 2), random(-2, 2), 
    random(-2, 2), random(-2, 2), random(-2, 2), 
    random(-2, 2));
  }
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<num; i++) {
    ms[i].update();
    ms[i].display();
  }
  endShape(CLOSE);
}

class MixShapes {
  float X, Y, Z, X2, Y2, Z2, X3, Y3, Z3, amX, amY, amZ, amX2, amY2, 
  amZ2, amX3, amY3, amZ3;
  MixShapes(float nX, float nY, float nZ, float nX2, float nY2, float nZ2, 
  float nX3, float nY3, float nZ3, float nAmX, float nAmY, float nAmZ, 
  float nAmX2, float nAmY2, float nAmZ2, float nAmX3, float nAmY3, 
  float nAmZ3) {
    X=nX;
    Y=nY;
    Z=nZ;
    X2=nX2;
    Y2=nY2;
    Z2=nZ2;
    X3=nX3;
    Y3=nY3;
    Z3=nZ3;
    amX=nAmX;
    amY=nAmY;
    amZ=nAmZ;
    amX2=nAmX2;
    amY2=nAmY2;
    amZ2=nAmZ2;
    amX3=nAmX3;
    amY3=nAmY3;
    amZ3=nAmZ3;
  }

  void update() {
    if (X>200 || X<-200) {
      amX=-amX;
    }
    if (Y>200 || Y<-200) {
      amY=-amY;
    }
    if (Z>200 || Z<-200) {
      amZ=-amZ;
    }
    if (X2>200 || X2<-200) {
      amX2=-amX2;
    }
    if (Y2>200 || Y2<-200) {
      amY2=-amY2;
    }
    if (Z2>200 || Z2<-200) {
      amZ2=-amZ2;
    }
    if (X3>200 || X3<-200) {
      amX3=-amX3;
    }
    if (Y3>200 || Y3<-200) {
      amY3=-amY3;
    }
    if (Z3>200 || Z3<-200) {
      amZ3=-amZ3;
    }
    X=X+amX;
    Y=Y+amY;
    Z=Z+amZ;
    X2=X2+amX2;
    Y2=Y2+amY2;
    Z2=Z2+amZ2;
    X3=X3+amX3;
    Y3=Y3+amY3;
    Z3=Z3+amZ3;
  }

  void display() {
    fill(255, 0, 0);
    vertex(X, Y, Z);
    fill(0, 255, 0);
    vertex(X2, Y2, Z2);
    fill(0, 0, 255);
    vertex(X3, Y3, Z3);
  }
}


