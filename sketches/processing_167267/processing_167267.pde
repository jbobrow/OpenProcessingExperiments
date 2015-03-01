
/*@pjs preload="doge.png, dogeTX.png";*/

ArrayList <WienerDoge> doges;
PImage dogeHead, dogeBody;

void setup() {
  size(600, 400, P3D);
  frameRate(30);
  smooth(8);
  imageMode(CENTER);
  hint(DISABLE_DEPTH_TEST);

  dogeHead = loadImage("doge.png");
  dogeBody = loadImage("dogeTX.png");

  doges = new ArrayList<WienerDoge>();
  
  WienerDoge t = new WienerDoge(dogeHead, dogeBody, 0.2, 7, width*.5, height, 0, 10, 1, 0, 3);
  doges.add(t);
}

void draw() {
  background(255);
  for (int i=0; i<doges.size (); i++) {
    WienerDoge t = doges.get(i);
    t.update();
    t.display();
  }
}

void keyPressed() {
  if (key == 'p') {
    for (int i=0; i<doges.size (); i++) {
      WienerDoge t = doges.get(i);
      t.pause();
    }
  } else if (key == 'r') {
    for (int i=0; i<doges.size (); i++) {
      WienerDoge t = doges.get(i);
      t.resume();
    }
  }
}

class Vertex{
  
  String type;
  PVector loc;
  //For type SPINE
  PVector ctr;
  float angle, angleT, shakeRadius, shakeRange;
  boolean pause;
  
  Vertex(float shakeRadius, float shakeRange){
    ctr = new PVector(0, 0, 0);
    loc = new PVector(0, 0, 0);
    this.shakeRadius = shakeRadius;
    this.shakeRange = shakeRange;
    type = "SPINE";
  }
  
  Vertex(){
    loc = new PVector(0, 0, 0);
  }
  
  void update(float f){
    
    if(!pause) angleT = sin(radians(f))*.5*shakeRange;
    else angleT = 0;
    
    angle = lerp(angle, angleT, 0.25);
    loc.set(cos(radians(angle-90))*shakeRadius + ctr.x,
            sin(radians(angle-90))*shakeRadius + ctr.y,
            ctr.z);
  }
}
class WienerDoge {

  int lv, maxLv;
  PImage txHead, txBody;
  PVector ctr, headLoc;

  Vertex [] spineVs;
  Vertex [] bodyVs;

  float resize;
  float segment, thickness;
  float headW, headH;
  float headOffsetX, headOffsetY;
  float rZHead, rZRoot;
  int f;

  WienerDoge [] subDoges;

  WienerDoge(PImage txHead, PImage txBody, float resize, int amt, float initX, float initY, float initZ, float segRange, float segmentRatio, int lv, int maxLv) {

    headLoc = new PVector(0, 0, 0);

    this.txHead = txHead;
    this.txBody = txBody;
    this.resize = resize;
    this.lv = lv;
    this.maxLv = maxLv;

    segment = txBody.height*resize*segmentRatio;
    thickness = txBody.width*resize;
    headW = txHead.width*resize;
    headH = txHead.height*resize;

    headOffsetY = -40;

    ctr = new PVector(initX, initY, initZ);

    spineVs = new Vertex[amt];
    for (int i=0; i<spineVs.length; i++) {
      spineVs[i] = new Vertex(i*segment, i*segRange);
    }

    bodyVs = new Vertex[amt*2];
    for (int i=0; i<bodyVs.length; i++) {
      bodyVs[i] = new Vertex();
    }

    if (lv<maxLv) {
      lv++;
      subDoges = new WienerDoge[4];
      for (int i=0; i<subDoges.length; i++) {
        subDoges[i] = new WienerDoge(dogeHead, dogeBody, 0.2*pow(0.6, lv), 7+lv, 0, 0, 0, 10+lv*2, pow(0.75, lv), lv, maxLv);
      }
    }
  }

  void setF(int f) {
    this.f = f;
  }

  void update() {
    //Update spine
    for (int i=0; i<spineVs.length; i++) {
      spineVs[i].update(f*5);
    }
    //Update body
    bodyVs[0].loc.set(spineVs[0].loc.x-thickness*.5, spineVs[0].loc.y, spineVs[0].loc.z);
    bodyVs[1].loc.set(spineVs[0].loc.x+thickness*.5, spineVs[0].loc.y, spineVs[0].loc.z);
    for (int i=1; i<spineVs.length; i++) {
      //BodyVL
      extend(bodyVs[i*2], spineVs[i], spineVs[i-1], true);
      extend(bodyVs[i*2+1], spineVs[i], spineVs[i-1], false);
    }
    //Update head
    headLoc.set(spineVs[spineVs.length-1].loc.x, spineVs[spineVs.length-1].loc.y, spineVs[spineVs.length-1].loc.z);

    PVector tmp = PVector.sub(spineVs[spineVs.length-1].loc, spineVs[spineVs.length-2].loc);
    
    if(tmp.y<0) rZHead = -atan(tmp.x/tmp.y);
    else rZHead = -atan(tmp.x/tmp.y)-PI;

    f++;

    if (lv<maxLv) {
      subDoges[0].attach(bodyVs[8], bodyVs[10]);
      PVector rootSeg0 = PVector.sub(bodyVs[8].loc, bodyVs[10].loc);
      subDoges[0].rZRoot = -atan(rootSeg0.x/rootSeg0.y)-PI*.5;

      subDoges[1].attach(bodyVs[11], bodyVs[9]);
      PVector rootSeg1 = PVector.sub(bodyVs[11].loc, bodyVs[9].loc);
      subDoges[1].rZRoot = -atan(rootSeg1.x/rootSeg1.y)+PI*.5;


      subDoges[2].attach(bodyVs[2], bodyVs[4]);
      PVector rootSeg2 = PVector.sub(bodyVs[2].loc, bodyVs[4].loc);
      subDoges[2].rZRoot = -atan(rootSeg2.x/rootSeg2.y)-PI*.5;

      subDoges[3].attach(bodyVs[5], bodyVs[3]);
      PVector rootSeg3 = PVector.sub(bodyVs[5].loc, bodyVs[3].loc);
      subDoges[3].rZRoot = -atan(rootSeg3.x/rootSeg3.y)+PI*.5;

      for (int i=0; i<subDoges.length; i++) {
        subDoges[i].update();
      }
    }
  }

  private void attach(Vertex v1, Vertex v2) {
    ctr.set((v1.loc.x+v2.loc.x)*.5, (v1.loc.y+v2.loc.y)*.5, (v1.loc.z+v2.loc.z)*.5);
  }

  void display() {
    pushMatrix();
    translate(ctr.x, ctr.y, ctr.z);
    rotateZ(rZRoot);
    displayBodySegments();
    displayHead();
    if (lv<maxLv) {
      for (int i=0; i<subDoges.length; i++) {
        subDoges[i].display();
      }
    }
    popMatrix();
  }

  private void extend(Vertex v, Vertex v1, Vertex v2, boolean l) {
    PVector dir = PVector.sub(v1.loc, v2.loc);
    PVector dirNormal;
    if (l) dirNormal = new PVector(dir.y, -dir.x);
    else dirNormal = new PVector(-dir.y, dir.x);
    dirNormal.normalize();
    dirNormal.mult(thickness*.5);
    v.loc = PVector.add(v1.loc, dirNormal);
  }

  private void displayBodySegments() {
    noStroke();
    fill(255);
    beginShape(QUADS);
    texture(txBody);
    for (int i=0; i<bodyVs.length-2; i+=2) {
      vertex(bodyVs[i].loc.x, bodyVs[i].loc.y, bodyVs[i].loc.z, 0, txBody.height);
      vertex(bodyVs[i+1].loc.x, bodyVs[i+1].loc.y, bodyVs[i+1].loc.z, txBody.width, txBody.height);
      vertex(bodyVs[i+3].loc.x, bodyVs[i+3].loc.y, bodyVs[i+3].loc.z, txBody.width, 0);
      vertex(bodyVs[i+2].loc.x, bodyVs[i+2].loc.y, bodyVs[i+2].loc.z, 0, 0);
    }
    endShape();
  }

  private void displayHead() {
    pushMatrix();
    translate(headLoc.x, headLoc.y, headLoc.z);
    rotateZ(rZHead);
    translate(headOffsetX*resize, headOffsetY*resize);
    beginShape(QUADS);
    noStroke();
    fill(255);
    texture(txHead);
    vertex(-headW*.5, -headH*.5, 0, 0, 0);
    vertex(headW*.5, -headH*.5, 0, txHead.width, 0);
    vertex(headW*.5, headH*.5, 0, txHead.width, txHead.height);
    vertex(-headW*.5, headH*.5, 0, 0, txHead.height);
    endShape();
    popMatrix();
  }


  void pause() {
    for (int i=0; i<spineVs.length; i++) {
      spineVs[i].pause = true;
    }
  }

  void resume() {
    for (int i=0; i<spineVs.length; i++) {
      spineVs[i].pause = false;
    }
  }
}



