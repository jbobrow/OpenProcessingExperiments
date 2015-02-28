
int num=100;
MARLines[] marl=new MARLines[num];

void setup() {
  size(600, 400);
  background(0);
  strokeWeight(2);
  for (int i=0; i<num; i++) {
    marl[i]=new MARLines(0, 0, random(-250, 250), random(-250, 250), random(360), random(360), 
    random(-0.001, 0.001), random(-0.001, 0.001), random(-3, 3), random(-3, 3));
  }
}

void draw() {
  fadeToWhite();
  translate(width/2, height/2);
  beginShape(LINES);
  for (int i=0; i<num; i++) {
    marl[i].update();
    marl[i].display();
  }
  endShape();
}

void fadeToWhite() {
  fill(0, 50);
  noStroke();
  rect(0, 0, width, height);
}

void mousePressed() {
  background(0);
  for (int i=0; i<num; i++) {
    marl[i]=new MARLines(0, 0, random(-250, 250), random(-250, 250), random(360), random(360), 
    random(-0.001, 0.001), random(-0.001, 0.001), random(-3, 3), random(-3, 3));
  }
}

class MARLines {
  float X, Y, rX, rY, rdX, rdY, amX, amY, am2X, am2Y;
  MARLines(float nX, float nY, float nRX, float nRY, float nRdX, float nRdY, 
  float nAmX, float nAmY, float nAm2X, float nAm2Y) {
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
  }

  void update() {
    rX=rX+amX;
    rY=rY+amY;
    if (rX>150 || rX<-150) {
      amX=-amX;
    }
    if (rY>150 || rY<-150) {
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
    stroke(255, 50);
    noFill();
    vertex(X, Y);
  }
}

