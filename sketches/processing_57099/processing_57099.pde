
int num=10;
OVertex[] ov=new OVertex[num];
Mtext mt;

void setup() {
  size(600, 400);
  smooth();
  textAlign(CENTER);
  textSize(100);
  for (int i=0; i<num; i++) {
    ov[i]=new OVertex(width/2+random(-300, 300), height/2-10+random(-200, 200), 
    random(-1, 1), random(-1, 1), random(5, 10), 0.2);
  }
  mt=new Mtext(width/2, height/2);
}

void draw() {
  background(255);
  mt.display();
  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<num; i++) {
    ov[i].update();
    ov[i].display();
  }
  endShape(CLOSE);
}

class OVertex {
  float X, Y, amX, amY, Ps, PsAm;
  OVertex(float nX, float nY, float nAmX, float nAmY, float nPs, float nPsAm) {
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
      Y=height/2-10+random(-200, 200);
      amX=random(-1, 1);
      amY=random(-1, 1);
      Ps=random(5, 10);
      PsAm=0.2;
    }
  }

  void display() {
    stroke(255);
    noFill();
    strokeWeight(Ps);
    vertex(X, Y);
  }
}

class Mtext {
  float X, Y;
  Mtext(float nX, float nY) {
    X=nX;
    Y=nY;
  }

  void display() {
    fill(0);
    text("Hello World", X, Y+30);
  }
}

