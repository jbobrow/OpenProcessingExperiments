
PointTweener pttw;
int pSec;

PointTweener keytw;

void setup() {
  size(400, 400);
  pttw = new PointTweener();
  keytw = new PointTweener();
}

void draw() {
  background(255);

  if (pSec != second()) {
    pttw.setTargetVecs(getPVecsFromNum(second()%10));
  }
  pSec = second();

  translate(20, 20);
  pttw.update();

  translate(80, 0);
  keytw.update();
}

void mousePressed() {
  int r = int(random(2, 10));
  println(r);
  PVector [] vs = new PVector[r];
  for (int i=0; i<r; i++) {
    vs[i] = new PVector(random(width), random(height));
  }
  keytw.setTargetVecs(vs);
}

void keyPressed() {
  PVector[] numVec = getPVecsFromNum(int(key)-48);
  if (numVec.length != 0) {
    keytw.setTargetVecs(numVec);
  }
}


PVector[] getPVecsFromNum(int num) {
  PVector[] ret = new PVector[0];
  switch(num) {
  case 0:
    ret = new PVector[5];
    ret[0] = getVec(0, 0);
    ret[1] = getVec(1, 0);
    ret[2] = getVec(1, 2);
    ret[3] = getVec(0, 2);
    ret[4] = getVec(0, 0);
    break;
  case 1:
    ret = new PVector[2];
    ret[0] = getVec(1, 0);
    ret[1] = getVec(1, 2);
    break;
  case 2:
    ret = new PVector[6];
    ret[0] = getVec(0, 0);
    ret[1] = getVec(1, 0);
    ret[2] = getVec(1, 1);
    ret[3] = getVec(0, 1);
    ret[4] = getVec(0, 2);
    ret[5] = getVec(1, 2);
    break;
    case 3:
    ret = new PVector[7];
    ret[0] = getVec(0, 0);
    ret[1] = getVec(1, 0);
    ret[2] = getVec(1, 1);
    ret[3] = getVec(0, 1);
    ret[4] = getVec(1, 1);
    ret[5] = getVec(1, 2);
    ret[6] = getVec(0, 2);
    break;
    case 4:
    ret = new PVector[5];
    ret[0] = getVec(0, 0);
    ret[1] = getVec(0, 1);
    ret[2] = getVec(1, 1);
    ret[3] = getVec(1, 0);
    ret[4] = getVec(1, 2);
    break;
    case 5:
    ret = new PVector[6];
    ret[0] = getVec(1, 0);
    ret[1] = getVec(0, 0);
    ret[2] = getVec(0, 1);
    ret[3] = getVec(1, 1);
    ret[4] = getVec(1, 2);
    ret[5] = getVec(0, 2);
    break;
    case 6:
    ret = new PVector[7];
    ret[0] = getVec(1, 0);
    ret[1] = getVec(0, 0);
    ret[2] = getVec(0, 1);
    ret[3] = getVec(1, 1);
    ret[4] = getVec(1, 2);
    ret[5] = getVec(0, 2);
    ret[6] = getVec(0, 1);
    break;
    case 7:
    ret = new PVector[4];
    ret[0] = getVec(0, 1);
    ret[1] = getVec(0, 0);
    ret[2] = getVec(1, 0);
    ret[3] = getVec(1, 2);
    break;
    case 8:
    ret = new PVector[8];
    ret[0] = getVec(0, 1);
    ret[1] = getVec(0, 0);
    ret[2] = getVec(1, 0);
    ret[3] = getVec(1, 1);
    ret[4] = getVec(0, 1);
    ret[5] = getVec(0, 2);
    ret[6] = getVec(1, 2);
    ret[7] = getVec(1, 1);
    break;
    case 9:
    ret = new PVector[7];
    ret[0] = getVec(1, 1);
    ret[1] = getVec(1, 0);
    ret[2] = getVec(0, 0);
    ret[3] = getVec(0, 1);
    ret[4] = getVec(1, 1);
    ret[5] = getVec(1, 2);
    ret[6] = getVec(0, 2);
    break;
  }
  return ret;
}

PVector getVec(int gridX, int gridY) {
  return new PVector(gridX*30, gridY*20);
}

class PointTweener {
  ArrayList<PVector> cVecs;
  PVector [] tVecs;
  Boolean isTween;
  Boolean isDrawLine;

  PointTweener() {
    cVecs = new ArrayList<PVector>();
    tVecs = new PVector[0];
    isTween = true;
    isDrawLine = true;
  }

  void setTargetVecs(PVector[] pv) {
    tVecs = pv;

    //println("bef clen="+cVecs.size()+" tlen="+tVecs.length);

    if (cVecs.size() == 0) {
      //init
      for (int i=0; i<tVecs.length; i++) {
        cVecs.add(tVecs[i]);
      }
    } else if (cVecs.size() > tVecs.length) {
      int len = cVecs.size() - tVecs.length;
      for (int i=0; i<len; i++) {
        //cVecs.remove(0);
        cVecs.remove(int(random(cVecs.size())));
      }
    } else if (cVecs.size() < tVecs.length) {
      for (int i=cVecs.size (); i<tVecs.length; i++) {
        //PVector c0 = cVecs.get(0);
        PVector c0 = cVecs.get(int(random(cVecs.size())));
        cVecs.add(new PVector(c0.x, c0.y));
      }
    }
    //println("aft clen="+cVecs.size()+" tlen="+tVecs.length);
  }

  void update() {
    if (isTween) {
      for (int i=0; i<cVecs.size (); i++) {
        cVecs.get(i).x += (tVecs[i].x - cVecs.get(i).x) / 5;
        cVecs.get(i).y += (tVecs[i].y - cVecs.get(i).y) / 5;
      }
    }

    if (isDrawLine) {
      noFill();
      beginShape();
      for (int i=0; i<cVecs.size (); i++) {
        vertex(cVecs.get(i).x, cVecs.get(i).y);
      }
      endShape();
    }
  }
  
}


