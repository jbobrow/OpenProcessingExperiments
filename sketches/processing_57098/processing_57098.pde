
int num=1000;
OPoints[] op=new OPoints[num];
Mtext mt;

void setup() {
  size(600, 400);
  textAlign(CENTER);
    textSize(100);
  for (int i=0; i<num; i++) {
    op[i]=new OPoints(width/2+random(-300, 300), height/2-10+random(-40, 40), 
    random(-1, 1), random(-1, 1), random(5, 10), 0.2);
  }
  mt=new Mtext(width/2, height/2);
}

void draw() {
  background(0);
  mt.display();
  for (int i=0; i<num; i++) {
    op[i].update();
    op[i].display();
  }
}

class OPoints {
  float X, Y, amX, amY, Ps, PsAm;
  OPoints(float nX, float nY, float nAmX, float nAmY, float nPs, float nPsAm) {
    X=nX;
    Y=nY;
    amX=nAmX;
    amY=nAmY;
    Ps=nPs;
    PsAm=nPsAm;
  }

  void update() {
    X=X+amX;
    Y=Y+amY;
    Ps=Ps-PsAm;
    if (Ps<0) {
      X=width/2+random(-300, 300);
      Y=height/2-10+random(-40, 40);
      amX=random(-1, 1);
      amY=random(-1, 1);
      Ps=random(5, 10);
      PsAm=0.2;
    }
  }

  void display() {
    fill(0);
    noStroke();
    ellipse(X, Y, Ps, Ps);
  }
}

class Mtext {
  float X, Y;
  Mtext(float nX, float nY) {
    X=nX;
    Y=nY;
  }

  void display() {
    fill(255);
    text("Hello World", X, Y+30);
  }
}
