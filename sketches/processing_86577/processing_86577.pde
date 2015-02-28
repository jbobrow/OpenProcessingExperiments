
int num=250;
PAPoints[] pap=new PAPoints[num];
float gX, gY, grX, grY, grdX, grdY, am2X, am2Y, am3X, am3Y;

void setup() {
  size(800, 600, P3D);
  background(0);
  stroke(255, 50);
  strokeWeight(2);
  pSet();
  for (int i=0; i<num; i++) {
    pap[i]=new PAPoints(random(-30, 30), random(-30, 30), random(0.5), 
    random(0.5), random(360), random(360));
  }
}

void draw() {
  pUpdate();
  for (int i=0; i<num; i++) {
    pap[i].update();
    pap[i].display();
  }
}

void mousePressed() {
  background(0);
  pSet();
}

void pSet() {
  gX=0;
  gY=0;
  grX=random(-50, 50);
  grY=random(-50, 50);
  grdX=random(360);
  grdY=random(360);
  am2X=random(-0.001, 0.001);
  am2Y=random(-0.001, 0.001);
  am3X=random(-0.3, 0.3);
  am3Y=random(-0.3, 0.3);
}

void pUpdate() {
  translate(width/2, height/2);
  camera(30.0, width, 220.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
  grX=grX+am2X;
  grY=grY+am2Y;
  if (grX>50 || grX<-50) {
    am2X=-am2X;
  }
  if (grY>50 || grY<-50) {
    am2Y=-am2Y;
  }
  grdX=grdX+am3X;
  grdY=grdY+am3Y;
  if (grdX>360 || grdX<0) {
    am3X=-am3X;
    pSet();
    background(0);
  } 
  if (grdY>360 || grdY<0) {
    am3Y=-am3Y;
    pSet();
    background(0);
  }
  gX=grX*cos(radians(grdX));
  gY=grY*sin(radians(grdY));
}


class PAPoints {
  float X, Y, amX, amY, anX, anY;
  PAPoints(float nX, float nY, float nAmX, float nAmY, float nAnX, float nAnY) {
    X=nX;
    Y=nY;
    amX=nAmX;
    amY=nAmY;
    anX=nAnX;
    anY=nAnY;
  }

  void update() {
    anX+=0.1;
    anY+=0.1;
    if (anX>360) anX=0;
    if (anY>360) anY=0;
    X+=random(-amX, amX);
    X=constrain(X, -30, 30);
    Y+=random(-amY, amY);
    Y=constrain(Y, -30, 30);
    X=gX+X;
    Y=gY+Y;
  }

  void display() {
    translate(X, Y);
    rotateX(radians(anX));
    rotateY(radians(anY));
    point(X, Y);
  }
}


