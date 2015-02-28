
int num=2000;
particles[]p=new particles[num];
float mX=random(-200, 200);
float mAmX=random(-2, 2);
float minMax1=random(100, 200);
float minMax2=random(100, 200);

void setup() {
  size(800, 600, P3D);
  for (int i=0; i<num; i++) {
    p[i]=new particles(0, 0, 0, random(-0.2, 0.2), random(-0.2, 0.2), random(-0.2, 0.2), 
    random(10, 30), random(-1, -0.01), random(360), random(360), random(-0.05, 0.05), 
    random(-0.05, 0.05));
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  mainp();
  for (int i=0; i<num; i++) {
    p[i].update();
    p[i].display();
  }
}

void mainp() {
  if (mX>minMax1 || mX<-minMax2) {
    minMax1=random(100, 200);
    minMax2=random(100, 200);
    mAmX=-mAmX;
    mAmX=random(-2, 2);
  }
  mX=mX+mAmX;
} 

class particles {
  float X, Y, Z, amX, amY, amZ, ff, fam, anX, anY, anamX, anamY;
  particles(float nX, float nY, float nZ, float nAmX, float nAmY, float nAmZ, 
  float nFf, float nFam, float nAnX, float nAnY, float nAnamX, float nAnamY) {
    X=nX;
    Y=nY;
    Z=nZ;
    amX=nAmX;
    amY=nAmY;
    amZ=nAmZ;
    ff=nFf;
    fam=nFam;
    anX=nAnX;
    anY=nAnY;
    anamX=nAnamX;
    anamY=nAnamY;
  }

  void update() {
    if (ff<0) {
      X=mX;
      Y=0;
      Z=0;
      amX=random(-0.2, 0.2);
      amY=random(-0.2, 0.2);
      amZ=random(-0.2, 0.2);
      ff=random(10, 30);
      fam=random(-1, -0.01);
    }
    X=X+amX;
    Y=Y+amY;
    Z=Z+amZ;
    ff=ff+fam;
    anX=anX+anamX;
    anY=anY+anamY;
  }

  void display() {
    rotateX(radians(anX));
    rotateY(radians(anY));
    stroke(255);
    point(X, Y, Z);
  }
}


