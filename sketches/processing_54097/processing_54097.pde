
int num=50;
PBack pb;
MAngle ma;
MoveTSVertex[]mtsv=new MoveTSVertex[num];

void setup() {
  size(800, 600, P3D);
  pb=new PBack();
  ma=new MAngle(mouseX, mouseY, mouseX, mouseY, 20);
  for (int i=0; i<num; i++) {
    mtsv[i]=new MoveTSVertex(0, 0, 0, random(-2, 2), random(-2, 2), random(-2, 2));
  }
}

void draw() {
  background(255);
  pb.display();
  ma.update();
  ma.display();
  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<num; i++) {
    mtsv[i].update();
    mtsv[i].display();
  }
  endShape(CLOSE);
}

void mousePressed() {
  for (int i=0; i<num; i++) {
    mtsv[i]=new MoveTSVertex(0, 0, 0, random(-2, 2), random(-2, 2), random(-2, 2));
  }
}

class PBack {

  void display() {
    camera();
    for (int i=0; i<width; i+=8) {
      for (int i2=0; i2<height; i2+=8) {
        strokeWeight(random(8));
        stroke(255);
        point(i, i2);
      }
    }
  }
}

class MAngle {
  float anX, anY, anDisX, anDisY, anDelay;
  MAngle(float nAnX, float nAnY, float nAnDisX, float nAnDisY, float nAnDelay) {
    anX=nAnX;
    anY=nAnY;
    anDisX=nAnDisX;
    anDisY=nAnDisY;
    anDelay=nAnDelay;
  }

  void update() {
    anDisX=mouseX-anX;
    anDisY=mouseY-anY;
    anX=anX+anDisX/anDelay;
    anY=anX+anDisY/anDelay;
  }

  void display() {
    translate(width/2, height/2);
    rotateX(radians(anX));
    rotateY(radians(anY));
  }
}

class MoveTSVertex {
  float X, Y, Z, amX, amY, amZ;
  MoveTSVertex(float nX, float nY, float nZ, float nAmX, float nAmY, float nAmZ) {
    X=nX;
    Y=nY;
    Z=nZ;
    amX=nAmX;
    amY=nAmY;
    amZ=nAmZ;
  }

  void update() {
    if (X>180 || X<-180) {
      amX=-amX;
    }
    if (Y>180 || Y<-180) {
      amY=-amY;
    }
    if (Z>180 || Z<-180) {
      amZ=-amZ;
    }
    X=X+amX;
    Y=Y+amY;
    Z=Z+amZ;
  }

  void display() {
    strokeWeight(1.5);
    stroke(0, 100);
    fill(0, 10);
    vertex(X, Y, Z);
  }
}


