
int num=10000;
Parinb[]pb=new Parinb[num];
viewpoint vp;
PBox pBx;

void setup() {
  size(800, 600, P3D);
  smooth();
  vp=new viewpoint(random(360), random(360), random(-0.5, 0.5), random(-0.5, 0.5));
  pBx=new PBox();
  for (int i=0; i<num; i++) {
    pb[i]=new Parinb(random(-150, 150), random(-150, 150), random(-150, 150), 
    random(-0.5, 0.5), random(-0.5, 0.5), random(-0.5, 0.5));
  }
}

void draw() {
  background(0);
  vp.update();
  vp.display();
  for (int i=0; i<num; i++) {
    pb[i].update();
    pb[i].display();
  }
  pBx.display();
}

class viewpoint {
  float anX, anY, anAmX, anAmY;
  viewpoint(float nAnX, float nAnY, float nAnAmX, float nAnAmY) {
    anX=nAnX;
    anY=nAnY;
    anAmX=nAnAmX;
    anAmY=nAnAmY;
  }

  void update() {
    if (anX>360 || anX<0) {
      anX=random(360);
      anAmX=random(-0.5, 0.5);
      anY=random(360);
      anAmY=random(-0.5, 0.5);
    }
    if (anY>360 || anY<0) {
      anX=random(360);
      anAmX=random(-0.5, 0.5);
      anY=random(360);
      anAmY=random(-0.5, 0.5);
    }
    anX=anX+anAmX;
    anY=anY+anAmY;
  }

  void display() {
    translate(width/2, height/2);
    rotateX(radians(anX));
    rotateY(radians(anY));
  }
}

class Parinb {
  float X, Y, Z, amX, amY, amZ;
  Parinb(float nX, float nY, float nZ, float nAmX, float nAmY, float nAmZ) {
    X=nX;
    Y=nY;
    Z=nZ;
    amX=nAmX;
    amY=nAmY;
    amZ=nAmZ;
  }

  void update() {
    if (X>150 || X<-150) {
      amX=-amX;
    }
    if (Y>150 || Y<-150) {
      amY=-amY;
    }
    if (Z>150 || Z<-150) {
      amZ=-amZ;
    }
    X=X+amX;
    Y=Y+amY;
    Z=Z+amZ;
  }

  void display() {
    noFill();
    stroke(255);
    point(X, Y, Z);
  }
}

class PBox {
  PBox() {
  }

  void display() {
    stroke(100);
    box(300, 300, 300);
  }
}


