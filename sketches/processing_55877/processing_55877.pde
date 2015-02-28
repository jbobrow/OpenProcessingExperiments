
int num=100;
RootC[] rc=new RootC[num];

void setup() {
  size(600, 400);
  background(255);
  noStroke();
  smooth();
  for (int i=0; i<num; i++) {
    rc[i]=new RootC(random(width), 0, random(-0.5, 0.5), random(0.5), 
    8, random(30), random(height), random(height), random(height), 0);
  }
}

void draw() {
  for (int i=0; i<num; i++) {
    rc[i].update();
    rc[i].display();
  }
}

class RootC {
  float X, Y, amX, amY, es, ilY, S1, S2, S3, am2X;
  RootC(float nX, float nY, float nAmX, float nAmY, float nEs, float nIlY, 
  float nS1, float nS2, float nS3, float nAm2X) {
    X=nX;
    Y=nY;
    amX=nAmX;
    amY=nAmY;
    es=nEs;
    ilY=nIlY;
    S1=nS1;
    S2=nS2;
    S3=nS3;
    am2X=nAm2X;
  }

  void update() {
    X=X+amX;
    Y=Y+amY;
    constrain(X, 0, width);
    constrain(Y, 0, height);
    es-=0.01;
    if (S1<Y && S1+ilY>Y || S2<Y && S2+ilY>Y || S3<Y && S3+ilY>Y) {
      am2X=random(10);
      X+=random(-am2X, am2X);
    }
    if (es<0) {
      background(255);
      X=random(width);
      Y=0;
      amX=random(-0.5, 0.5);
      amY=random(0.5);
      es=8;
      ilY=random(30);
      S1=random(height);
      S2=random(height);
      S3=random(height);
    }
  }

  void display() {
    fill(random(255), 100);
    ellipse(X, Y, es, es);
  }
}

