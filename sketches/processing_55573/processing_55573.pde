
int num=200;
SpreadC[]sc=new SpreadC[num];

void setup() {
  size(600, 400);
  smooth();
  for (int i=0; i<num; i++) {
    sc[i]=new SpreadC(mouseX, mouseY, random(-1, 1), random(-1, 1), random(1, 30), 
    random(255), random(255), random(255));
  }
}

void draw() {
  background(0);
  for (int i=0; i<num; i++) {
    sc[i].update();
    sc[i].display();
  }
}

class SpreadC {
  float X, Y, amX, amY, es, R, G, B;
  SpreadC(float nX, float nY, float nAmX, float nAmY, float nEs, 
  float nR, float nG, float nB) {
    X=nX;
    Y=nY;
    amX=nAmX;
    amY=nAmY;
    es=nEs;
    R=nR;
    G=nG;
    B=nB;
  }

  void update() {
    X=X+amX;
    Y=Y+amY;
    es-=0.1;
    if (es<0) {
      X=mouseX;
      Y=mouseY;
      amX=random(-1, 1);
      amY=random(-1, 1);
      es=random(1, 50);
      R=random(255);
      G=random(255);
      B=random(255);
    }
  }

  void display() {
    stroke(255);
    point(X, Y);
    noStroke();
    fill(R, G, B, 100);
    ellipse(X, Y, es, es);
    fill(255, 20);
    text(X, X+10, Y+10);
    text(Y, X+10, Y+20);
  }
}

