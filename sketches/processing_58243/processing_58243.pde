
int num=10;
RFBoxes[]rfb= new RFBoxes[num];

void setup() {
  size(800, 600, P3D);
  background(0);
  noStroke();
  for (int i=0; i<num; i++) {
    rfb[i]=new RFBoxes(0, 0, 0, random(360), random(360), random(360), 
    random(-1, 1), random(-1, 1), random(-1, 1), random(-1, 1), 
    random(-1, 1), random(-1, 1), random(255), random(255), random(255));
  }
}

void draw() {
  camera();
  fill(0, 10);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    rfb[i].update();
    rfb[i].display();
  }
}

class RFBoxes {
  float X, Y, Z, anX, anY, anZ, amX, amY, amZ, anAmX, anAmY, anAmZ, R, G, B;
  RFBoxes(float nX, float nY, float nZ, float nAnX, float nAnY, float nAnZ, 
  float nAmX, float nAmY, float nAmZ, float nAnAmX, float nAnAmY, float nAnAmZ, 
  float nR, float nG, float nB) {
    X=nX;
    Y=nY;
    Z=nZ;
    anX=nAnX;
    anY=nAnY;
    anZ=nAnZ;
    amX=nAmX;
    amY=nAmY;
    amZ=nAmZ;
    anAmX=nAnAmX;
    anAmY=nAnAmY;
    anAmZ=nAnAmZ;
    R=nR;
    G=nG;
    B=nB;
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
    if (anX>360 || anY>360 || anZ>360) {
      X=random(-100, 100);
      Y=random(-100, 100);
      Z=random(-100, 100);
      anX=random(360);
      anY=random(360);
      anZ=random(360);
      amX=random(-0.5, 0.5);
      amY=random(-0.5, 0.5);
      amZ=random(-0.5, 0.5);
      anAmX=random(-1, 1);
      anAmY=random(-1, 1);
      anAmZ=random(-1, 1);
      R=random(255);
      G=random(255);
      B=random(255);
    }
    X=X+amX;
    Y=Y+amY;
    Z=Z+amZ;
    anX=anX+anAmX;
    anY=anY+anAmY;
    anZ=anZ+anAmZ;
  }

  void display() {
    pushMatrix();
    translate(X, Y, Z);
    rotateX(radians(anX));
    rotateY(radians(anY));
    rotateZ(radians(anZ));
    fill(R, G, B, 100);
    box(50, 200, 50);
    popMatrix();
  }
}


