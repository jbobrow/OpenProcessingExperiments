
/*@pjs preload="doge0.png, doge1.png, doge2.png, doge3.png, dogeTX.png, title.png";*/

ArrayList <WienerDoge> doges;
PImage dogeBody, title;
PImage [] dogeHead;

void setup() {
  size(400, 600, P3D);
  frameRate(30);
  smooth(8);
  imageMode(CENTER);
  hint(DISABLE_DEPTH_TEST);
  
  dogeHead = new PImage[4];
  for(int i=0; i<dogeHead.length; i++){
    dogeHead[i] = loadImage("doge"+i+".png");
  }
  dogeBody = loadImage("dogeTX.png");
  title = loadImage("title.png");

  doges = new ArrayList<WienerDoge>();
  
  WienerDoge t = new WienerDoge(dogeHead, dogeBody, 0.25, 10, 0, height*.5, 0, 10, 1);
  doges.add(t);
}

void draw() {
  background(255);
  
  noStroke();
  fill(255);
  beginShape(QUADS);
  texture(title);
  //Delete the multiplier '10' when in Java Mode (Nasty Bug under JS mode, Urrrrrg...) 
  vertex(0,0,0,0,0);
  vertex(400,0,0,title.width*10,0);
  vertex(400,150,0,title.width*10,title.height*10);
  vertex(0,150,0,0,title.height*10);
  endShape();
  
  translate(width*.5, height*.5);
  for (int i=0; i<doges.size (); i++) {
    WienerDoge t = doges.get(i);
    t.update();
    t.display();
  }
}
class BodyVertex {

  PVector loc, vel, acc;
  float decay;
  boolean fixed;

  BodyVertex() {
    loc = new PVector(0, 0, 0);
    vel = new PVector(0, 0, 0);
    acc = new PVector(0, 0, 0);
    decay = 0.75;
  }

  void setFixed() {
    fixed = true;
  }

  void restore(PVector target) {
    PVector dir = PVector.sub(target, loc);
    float force = 0;
    if(fixed) force = dir.mag();
    else force = dir.mag()*0.1;
    dir.normalize();
    dir.mult(force);
    acc.add(dir);
  }
  
  void stretchedBy(BodyVertex v1, BodyVertex v2){
    PVector target = new PVector((v1.loc.x+v2.loc.x)*.5, (v1.loc.y+v2.loc.y)*.5);
    PVector dir = PVector.sub(target, loc);
    float force = dir.mag()*.2;
    dir.normalize();
    dir.mult(force);
    acc.add(dir);
  }

  void update() {
    vel.add(acc);
    vel.mult(decay);
    loc.add(vel);
    acc.set(0, 0, 0);
    if (fixed)vel.set(0, 0, 0);
  }
}

class SpineVertex {

  PVector loc, anchor, vel, acc;
  float decay, thres;

  SpineVertex(float anchorX, float anchorY, float anchorZ, float decay, float thres) {
    anchor = new PVector(anchorX, anchorY, anchorZ);
    loc = new PVector(anchorX, anchorY, anchorZ);
    vel = new PVector(0, 0, 0);
    acc = new PVector(0, 0, 0);
    this.decay = decay;
    this.thres = thres;
  }

  void restore() {
    PVector dir = PVector.sub(anchor, loc);
    float force = dir.mag()*.1;
    dir.normalize();
    dir.mult(force);
    acc.add(dir);
  }
  
  void stretchedBy(SpineVertex v1, SpineVertex v2){
    PVector target = new PVector((v1.loc.x+v2.loc.x)*.5, (v1.loc.y+v2.loc.y)*.5);
    PVector dir = PVector.sub(target, loc);
    float force = dir.mag()*.2;
    dir.normalize();
    dir.mult(force);
    acc.add(dir);
  }

  void repel(float mX, float mY) {
    PVector mouse = new PVector(mX, mY);
    PVector dir = PVector.sub(loc, mouse);
    if (dir.x > -thres && dir.x < thres && dir.y > -thres && dir.y < thres) {
      float force = (thres-dir.mag())*.1;
      dir.normalize();
      dir.mult(force);
      acc.add(dir);
    }
  }

  void update() {
    vel.add(acc);
    vel.mult(decay);
    loc.add(vel);
    acc.set(0, 0, 0);
  }
}

class WienerDoge {

  PImage txBody;
  PImage [] txHead;
  PVector headLoc;

  SpineVertex [] spineVs;
  BodyVertex [] bodyVs;

  float resize, segment, thickness;
  float rZT, rZ, headW, headH, headOffsetX, headOffsetY;
  int seqIndex;
  boolean blink;

  WienerDoge(PImage [] txHead, PImage txBody, float resize, int amt, float initX, float initY, float initZ, float segRange, float segmentRatio) {

    headLoc = new PVector(0, 0, 0);

    this.txHead = txHead;
    this.txBody = txBody;
    this.resize = resize;

    segment = txBody.height*resize*segmentRatio;
    thickness = txBody.width*resize;
    headW = txHead[0].width*resize;
    headH = txHead[0].height*resize;

    headOffsetY = -40;

    spineVs = new SpineVertex[amt];
    for (int i=0; i<spineVs.length; i++) {
      spineVs[i] = new SpineVertex(initX, initY-i*segment, initZ, 0.75+i*0.02, i*5+50);
    }

    bodyVs = new BodyVertex[amt*2];
    for (int i=0; i<bodyVs.length; i++) {
      bodyVs[i] = new BodyVertex();
      if (i>bodyVs.length-3) bodyVs[i].setFixed();
    }
  }

  void update() {
    //Update spine
    for (int i=1; i<spineVs.length; i++) {
      spineVs[i].repel(mouseX-width*.5, mouseY-height*.5);
      spineVs[i].restore();
      if (i<spineVs.length-1)spineVs[i].stretchedBy(spineVs[i-1], spineVs[i+1]);
      spineVs[i].update();
    }
    //Update body
    bodyVs[0].loc.set(spineVs[0].loc.x-thickness*.5, spineVs[0].loc.y, spineVs[0].loc.z);
    bodyVs[1].loc.set(spineVs[0].loc.x+thickness*.5, spineVs[0].loc.y, spineVs[0].loc.z);
    for (int i=1; i<spineVs.length; i++) {
      //BodyVL
      extend(bodyVs[i*2], spineVs[i], spineVs[i-1], true);
      extend(bodyVs[i*2+1], spineVs[i], spineVs[i-1], false);
      if (i<spineVs.length-1) {
        bodyVs[i*2].stretchedBy(bodyVs[i*2-2], bodyVs[i*2+2]);
        bodyVs[i*2+1].stretchedBy(bodyVs[i*2-1], bodyVs[i*2+3]);
      }
    }
    for (int i=0; i<bodyVs.length; i++) {
      bodyVs[i].update();
    }
    //Update head
    headLoc.set(spineVs[spineVs.length-1].loc.x, spineVs[spineVs.length-1].loc.y, spineVs[spineVs.length-1].loc.z+1);

    PVector tmp = PVector.sub(spineVs[spineVs.length-1].loc, spineVs[spineVs.length-2].loc);
    if (tmp.y<0) rZT = -atan(tmp.x/tmp.y);
    else rZT = -atan(tmp.x/tmp.y)-PI;

    rZ = lerp(rZ, rZT, 0.25);

    //Update blink
    triggerBlink();
    if (blink) {
      if (seqIndex<3) {
        seqIndex++;
      } else {
        seqIndex = 0;
        blink = false;
      }
    }
  }

  void display() {
    pushMatrix();
    displayBodySegments();
    displayHead();
    popMatrix();
  }

  private void triggerBlink() {
    if (frameCount%30 == 0 && boolean(round(random(1)))) {
      blink = true;
    }
  }

  private void extend(BodyVertex v, SpineVertex v1, SpineVertex v2, boolean l) {
    PVector dir = PVector.sub(v1.loc, v2.loc);
    PVector dirNormal;
    if (l) dirNormal = new PVector(dir.y, -dir.x);
    else dirNormal = new PVector(-dir.y, dir.x);
    dirNormal.normalize();
    dirNormal.mult(thickness*.5);
    v.restore(PVector.add(v1.loc, dirNormal));
  }

  private void displayBodySegments() {
    noStroke();
    fill(255);
    beginShape(QUADS);
    texture(dogeBody);
    for (int i=0; i<bodyVs.length-2; i+=2) {
      //Delete the multiplier '10' when in Java Mode (Nasty Bug under JS mode, Urrrrrg...) 
      vertex(bodyVs[i].loc.x, bodyVs[i].loc.y, bodyVs[i].loc.z, 0, dogeBody.height*10);
      vertex(bodyVs[i+1].loc.x, bodyVs[i+1].loc.y, bodyVs[i+1].loc.z, dogeBody.width*10, dogeBody.height*10);
      vertex(bodyVs[i+3].loc.x, bodyVs[i+3].loc.y, bodyVs[i+3].loc.z, dogeBody.width*10, 0);
      vertex(bodyVs[i+2].loc.x, bodyVs[i+2].loc.y, bodyVs[i+2].loc.z, 0, 0);
    }
    endShape();
  }

  private void displayHead() {
    translate(headLoc.x, headLoc.y, headLoc.z);
    rotateZ(rZ);
    translate(headOffsetX*resize, headOffsetY*resize);
    noStroke();
    fill(255);
    beginShape(QUADS);
    texture(txHead[seqIndex]);
    vertex(-headW*.5, -headH*.5, 0, 0, 0);
    vertex(headW*.5, -headH*.5, 0, txHead[seqIndex].width, 0);
    vertex(headW*.5, headH*.5, 0, txHead[seqIndex].width, txHead[seqIndex].height);
    vertex(-headW*.5, headH*.5, 0, 0, txHead[seqIndex].height);
    endShape();
  }
}



