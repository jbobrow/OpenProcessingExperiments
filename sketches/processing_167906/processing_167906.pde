
/*@pjs preload="doge.png, dogeTX.png";*/

boolean showSpine = false, showVertices = false, showBodysegs = false, showTx = true, showHead = true;

ArrayList <WienerDoge> doges;
PImage dogeHead, dogeBody;

void setup() {
  size(400, 400, P3D);
  frameRate(30);

  dogeHead = loadImage("doge.png");
  dogeBody = loadImage("dogeTX.png");

  doges = new ArrayList<WienerDoge>();
  
  WienerDoge t = new WienerDoge(dogeHead, dogeBody, 0.25, 5, 0, height*.5, 0, 10, 1);
  doges.add(t);
}

void draw() {
  background(255);
  translate(width*.5, height*.5);
  noStroke();
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
  } else if (key == '1') {
    showSpine = !showSpine;
  } else if (key == '2') {
    showVertices = !showVertices;
  } else if (key == '3') {
    showBodysegs = !showBodysegs;
  } else if (key == '4') {
    showTx = !showTx;
  } else if (key == '5') {
    showHead = !showHead;
  }
}

class Vertex{
  
  String type;
  PVector loc;
  //For type SPINE
  PVector ctr;
  float angle, angleT, shakeRadius, shakeRange;
  boolean pause;
  
  Vertex(float ctrX, float ctrY, float ctrZ, float shakeRadius, float shakeRange){
    ctr = new PVector(ctrX, ctrY, ctrZ);
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

  PImage txHead, txBody;
  PVector headLoc;

  Vertex [] spineVs;
  Vertex [] bodyVs;

  float resize;
  float segment, thickness;
  float headW, headH;
  float headOffsetX, headOffsetY;
  float rZ;
  int f;

  WienerDoge(PImage txHead, PImage txBody, float resize, int amt, float initX, float initY, float initZ, float segRange, float segmentRatio) {

    headLoc = new PVector(0, 0, 0);

    this.txHead = txHead;
    this.txBody = txBody;
    this.resize = resize;

    segment = txBody.height*resize*segmentRatio;
    thickness = txBody.width*resize;
    headW = txHead.width*resize;
    headH = txHead.height*resize;

    headOffsetY = -40;

    spineVs = new Vertex[amt];
    for (int i=0; i<spineVs.length; i++) {
      spineVs[i] = new Vertex(initX, initY, initZ, i*segment, i*segRange);
    }

    bodyVs = new Vertex[amt*2];
    for (int i=0; i<bodyVs.length; i++) {
      bodyVs[i] = new Vertex();
    }
  }

  void setF(int f) {
    this.f = f;
  }

  void update() {
    //Update spine
    for (int i=0; i<spineVs.length; i++) {
      spineVs[i].update(f*10);
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
    headLoc.set(spineVs[spineVs.length-1].loc.x, spineVs[spineVs.length-1].loc.y, spineVs[spineVs.length-1].loc.z+1);

    PVector tmp = PVector.sub(spineVs[spineVs.length-1].loc, spineVs[spineVs.length-2].loc);
    rZ = -atan(tmp.x/tmp.y);

    f++;
  }

  void display() {
    pushMatrix();
    if (showVertices) displayVertices();
    if (showSpine) displaySpine();
    displayBodySegments();
    if (showHead)displayHead();
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
    if (showBodysegs) {
      stroke(255, 0, 0);
      strokeWeight(1);
      noFill();
      beginShape(QUADS);
      for (int i=0; i<bodyVs.length-2; i+=2) {
        vertex(bodyVs[i].loc.x, bodyVs[i].loc.y, bodyVs[i].loc.z);
        vertex(bodyVs[i+1].loc.x, bodyVs[i+1].loc.y, bodyVs[i+1].loc.z);
        vertex(bodyVs[i+3].loc.x, bodyVs[i+3].loc.y, bodyVs[i+3].loc.z);
        vertex(bodyVs[i+2].loc.x, bodyVs[i+2].loc.y, bodyVs[i+2].loc.z);
      }
      endShape();
    }

    if (showTx) {
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
  }

  private void displayHead() {
    translate(headLoc.x, headLoc.y, headLoc.z);
    rotateZ(rZ);
    translate(headOffsetX*resize, headOffsetY*resize);
    noStroke();
    fill(255);
    beginShape(QUADS);
    texture(txHead);
    vertex(-headW*.5, -headH*.5, 0, 0, 0);
    vertex(headW*.5, -headH*.5, 0, txHead.width, 0);
    vertex(headW*.5, headH*.5, 0, txHead.width, txHead.height);
    vertex(-headW*.5, headH*.5, 0, 0, txHead.height);
    endShape();
    //image(txHead, 0, 0, headW, headH);
  }

  private void displaySpine() {
    noFill();
    strokeWeight(10);
    stroke(0);
    for (int i=0; i<spineVs.length; i++) {
      point(spineVs[i].loc.x, spineVs[i].loc.y, spineVs[i].loc.z);
    }

    strokeWeight(1);
    beginShape();
    for (int i=0; i<spineVs.length; i++) {
      vertex(spineVs[i].loc.x, spineVs[i].loc.y, spineVs[i].loc.z);
    }
    endShape();
  }

  private void displayVertices() {
    //body
    strokeWeight(5);
    stroke(0);
    for (int i=0; i<bodyVs.length; i++) {
      point(bodyVs[i].loc.x, bodyVs[i].loc.y, bodyVs[i].loc.z);
    }
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



