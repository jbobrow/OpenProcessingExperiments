
int num=100;
MARPoints[] marp=new MARPoints[num];

void setup() {
  size(800, 600, P3D);
  background(0);
  strokeWeight(2);
  for (int i=0; i<num; i++) {
    marp[i]=new MARPoints(0, 0, random(-250, 250), random(-250, 250), random(360), random(360), 
    random(-0.001, 0.001), random(-0.001, 0.001), random(-3, 3), random(-3, 3), random(360), random(360));
  }
}

void draw() {
  fadeToWhite();
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    marp[i].update();
    marp[i].display();
  }
}

void fadeToWhite() {
  camera();
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
}

void mousePressed() {
  background(0);
  for (int i=0; i<num; i++) {
    marp[i]=new MARPoints(0, 0, random(-250, 250), random(-250, 250), random(360), random(360), 
    random(-0.001, 0.001), random(-0.001, 0.001), random(-3, 3), random(-3, 3), random(360), random(360));
  }
}

class MARPoints {
  float X, Y, rX, rY, rdX, rdY, amX, amY, am2X, am2Y, anX, anY;
  MARPoints(float nX, float nY, float nRX, float nRY, float nRdX, float nRdY, 
  float nAmX, float nAmY, float nAm2X, float nAm2Y, float nAnX, float nAnY) {
    X=nX;
    Y=nY;
    rX=nRX;
    rY=nRY;
    rdX=nRdX;
    rdY=nRdY;
    amX=nAmX;
    amY=nAmY;
    am2X=nAm2X;
    am2Y=nAm2Y;
    anX=nAnX;
    anY=nAnY;
  }

  void update() {
    anX+=0.01;
    anY+=0.01;
    if (anX>360) anX=0;
    if (anY>360) anY=0;
    rX=rX+amX;
    rY=rY+amY;
    if (rX>250 || rX<-250) {
      amX=-amX;
    }
    if (rY>250 || rY<-250) {
      amY=-amY;
    }
    rdX=rdX+am2X;
    rdY=rdY+am2Y;
    if (rdX>360) rdX=0;
    if (rdY>360) rdY=0;
    X=rX*cos(radians(rdX));
    Y=rY*sin(radians(rdY));
  }

  void display() {
    rotateX(radians(anX));
    rotateY(radians(anY));
    stroke(255, 150);
    point(X, Y);
  }
}


