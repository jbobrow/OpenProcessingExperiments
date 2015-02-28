
int num=50;
STransform[]st=new STransform[num];

void setup() {
  size(800, 600, P3D);
  smooth();
  stroke(255);
  fill(255, 100);
  for (int i=0; i<num; i++) {
    st[i]=new STransform(random(-200, 200), random(-200, 200), random(-200, 200), 
    random(-300, 300), random(-2, 2), random(-2, 2), random(-2, 2), random(-2, 2), 
    random(360), random(360), random(360), random(360));
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<num; i++) {
    st[i].update();
    st[i].display();
  }
  endShape();
  for (int i=0; i<num; i++) {
    st[i].display2();
  }
}

class  STransform {
  float X, Y, X2, Y2, amX, amY, amX2, amY2, anX, anY, anX2, anY2;
  STransform(float nX, float nY, float nX2, float nY2, float nAmX, float nAmY, 
  float nAmX2, float nAmY2, float nAnX, float nAnY, float nAnX2, float nAnY2) {
    X=nX;
    Y=nY;
    X2=nX2;
    Y2=nY2;
    amX=nAmX;
    amY=nAmY;
    amX2=nAmX2;
    amY2=nAmY2;
    anX=nAnX;
    anY=nAnY;
    anX2=nAnX2;
    anY2=nAnY2;
  }

  void update() {
    if (X>200 || X<-200) {
      amX=-amX;
    }
    if (Y>200 || Y<-200) {
      amY=-amY;
    }
    if (X2>200 || X2<-200) {
      amX2=-amX2;
    }
    if (Y2>200 || Y2<-200) {
      amY2=-amY2;
    }
    X=X+amX;
    Y=Y+amY;
    X2=X2+amX2;
    Y2=Y2+amY2;
    anX+=0.1;
    anY+=0.1;
    anX2+=0.1;
    anY2+=0.1;
    if (anX>360) anX=0;
    if (anY>360) anY=0;
    if (anX2>360) anX2=0;
    if (anY2>360) anY2=0;
  }

  void display() {
    if (X>X2-100 && X<X2+100 && Y>Y2-100 && Y<Y2+100) {
      vertex(X, Y);
      vertex(X2, Y2);
    }
  }

  void display2() {
    rotateX(radians(anX));
    rotateY(radians(anY));
    point(X, Y);
    rotateX(radians(anX2));
    rotateY(radians(anY2));
    point(X2, Y2);
  }
}


