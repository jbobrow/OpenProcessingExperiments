
int num=100;
FlyBox[] fb=new FlyBox[num];

void setup() {
  size(800, 600, P3D);
  noStroke();
  for (int i=0; i<num; i++) {
    fb[i]=new FlyBox(random(width), random(height), -800, random(360), 
    random(360), random(360), random(10, 100), random(10, 100), 
    random(10, 100), random(5));
  }
}

void draw() {
  background(0);
  lights();
  for (int i=0; i<num; i++) {
    fb[i].update();
    fb[i].display();
  }
}

class FlyBox {
  float X, Y, Z, anX, anY, anZ, bsX, bsY, bsZ, amZ;
  FlyBox(float nX, float nY, float nZ, float nAnX, float nAnY, float nAnZ, 
  float nBsX, float nBsY, float nBsZ, float nAmZ) {
    X=nX;
    Y=nY;
    Z=nZ;
    anX=nAnX;
    anY=nAnY;
    anZ=nAnZ;
    bsX=nBsX;
    bsY=nBsY;
    bsZ=nBsZ;
    amZ=nAmZ;
  }

  void update() {
    Z=Z+amZ;
    if (Z>100) {
      X=random(width);
      Y=random(height);
      Z=-800;
      anX=random(360);
      anY=random(360);
      anZ=random(360);
      bsX=random(10, 100);
      bsY=random(10, 100);
      bsZ=random(10, 100);
      amZ=random(5);
    }
    anX=anX+1;
    anY=anY+1;
    anZ=anZ+1;
  }

  void display() {
    pushMatrix();
    translate(X, Y, Z);
    rotateX(radians(anX));
    rotateY(radians(anY));
    rotateZ(radians(anZ));
    fill(255);
    box(bsX, bsY, bsZ);
    popMatrix();
  }
}


