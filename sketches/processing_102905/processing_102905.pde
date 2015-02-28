
//Raven Kwok (aka Guo Ruiwen)
//p0629a_2013_worms
/*

raystain@gmail.com
ravenkwok.com
flickr.com/ravenkwok
vimeo.com/ravenkwok
weibo.com/ravenkwok

*/


StageManager sm;
boolean onPressed;
boolean newVertexSpawn;
int currentDrawingWormIndex;

void setup() {
  size(500, 500);
  colorMode(HSB);
  smooth();
  frameRate(30);
  sm = new StageManager();
  sm.spawnItf(width/2,height/2,0.001);
}

void draw() {
  background(255);
  if (onPressed) {
    Worm currentW = (Worm) sm.worms.get(currentDrawingWormIndex);
    currentW.spawnV(mouseX, mouseY);
    if(newVertexSpawn){
      sm.checkIntersect();
    }
  }else{
    sm.checkVanish();
  }
  sm.update();
  sm.display();
}

void mousePressed() {
  sm.spawnW();
  currentDrawingWormIndex = sm.worms.size()-1;
  onPressed = true;
}

void mouseReleased() {
  onPressed = false;
}

class Interference{
  
  PVector loc;
  float force;
  
  Interference(float initX,float initY,float force){
    this.force = force;
    loc = new PVector(initX,initY);
  }
}
class StageManager {

  ArrayList worms;
  ArrayList itfs;
  int maxPAmt;

  StageManager() {
    worms = new ArrayList();
    itfs = new ArrayList();
  }

  void update() {
    for (int i=0;i<worms.size();i++) {
      Worm eachW = (Worm) worms.get(i);

      eachW.repelWithin();
      eachW.tensedWithin();

      for (int j=i+1;j<worms.size();j++) {
        Worm repWorm = (Worm) worms.get(j);
        eachW.repelWithOther(repWorm);
      }

      for (int k=0;k<itfs.size();k++) {
        Interference eachItf = (Interference) itfs.get(k);
        eachW.interferedBy(eachItf, eachItf.force);
      }

      eachW.update();
    }
  }

  void display() {
    for (int i=0;i<worms.size();i++) {
      Worm eachW = (Worm) worms.get(i);
      eachW.display();
    }
  }
  
  void checkVanish(){
    for (int i = worms.size()-1;i>=0;i--){
      Worm eachW = (Worm) worms.get(i);
      if(eachW.vertices.size()<=3){
        worms.remove(i);
      }
    }
  }

  void checkIntersect() {

    Worm currentW = (Worm) worms.get(currentDrawingWormIndex);
    int lastVertexIndex = currentW.vertices.size()-2;

    if (lastVertexIndex>=0) {
      Vertex currentVertex = (Vertex)currentW.vertices.get(lastVertexIndex+1);
      Vertex lastVertex = (Vertex)currentW.vertices.get(lastVertexIndex);
      PVector cSeg1v1 = new PVector(currentVertex.loc.x, currentVertex.loc.y);
      PVector cSeg1v2 = new PVector(lastVertex.loc.x, lastVertex.loc.y);

      for (int i=0;i<worms.size();i++) {
        if (i==currentDrawingWormIndex) {
          continue;
        }
        else {
          Worm eachW = (Worm) worms.get(i);
          for (int j=1;j<eachW.vertices.size()-2;j++) {
            Vertex v1 = (Vertex)eachW.vertices.get(j);
            Vertex v2 = (Vertex)eachW.vertices.get(j+1);
            PVector cSeg2v1 = new PVector(v1.loc.x, v1.loc.y);
            PVector cSeg2v2 = new PVector(v2.loc.x, v2.loc.y);
            if (intersect(cSeg1v1, cSeg1v2, cSeg2v1, cSeg2v2)) {

              Worm cutOffSeg = new Worm();
              worms.add(cutOffSeg);

              for (int k=j;k<eachW.vertices.size();k++) {
                Vertex ogV = (Vertex)eachW.vertices.get(k);
                Vertex addedV;
                if (k==j) {
                  addedV = new Vertex((v1.loc.x+v2.loc.x)*0.5, (v1.loc.y+v2.loc.y)*0.5);
                }else {
                  addedV = new Vertex(ogV.loc.x, ogV.loc.y);
                }
                cutOffSeg.vertices.add(addedV);
              }

              v1.loc.x = (v1.loc.x+v2.loc.x)*0.5;
              v1.loc.y = (v1.loc.y+v2.loc.y)*0.5;
              for (int k=eachW.vertices.size()-1;k>j+1;k--) {
                eachW.vertices.remove(k);
              }
            }
          }
        }
      }
    }
  }

  boolean intersect(PVector s1v1, PVector s1v2, PVector s2v1, PVector s2v2) {
    float denominator = (s1v1.x-s1v2.x)*(s2v1.y-s2v2.y)-(s1v1.y-s1v2.y)*(s2v1.x-s2v2.x);
    if (denominator==0) {
      return false;
    }
    else {
      float istX = ((s1v1.x*s1v2.y-s1v2.x*s1v1.y)*(s2v1.x-s2v2.x)-(s1v1.x-s1v2.x)*(s2v1.x*s2v2.y-s2v2.x*s2v1.y))/denominator;
      float istY = ((s1v1.x*s1v2.y-s1v2.x*s1v1.y)*(s2v1.y-s2v2.y)-(s1v1.y-s1v2.y)*(s2v1.x*s2v2.y-s2v2.x*s2v1.y))/denominator;
      if ( (istX-s1v1.x)*(istX-s1v2.x)<=0 && (istY-s1v1.y)*(istY-s1v2.y)<=0 && (istX-s2v1.x)*(istX-s2v2.x)<=0 && (istY-s2v1.y)*(istY-s2v2.y)<=0 ) {
        return true;
      }
      else {
        return false;
      }
    }
  }

  void spawnW() {
    Worm addedW = new Worm();
    worms.add(addedW);
  }

  void spawnItf(float initX, float initY, float force) {
    Interference addedItf = new Interference(initX, initY, force);
    itfs.add(addedItf);
  }
}

class Vertex{
  
  PVector loc,vel,acc;
  float thres,thresT,decay;
  
  Vertex(float initX,float initY){
    
    loc = new PVector(initX,initY);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    
    decay = 0.9;
    thres = 0;
    thresT = 20;
  }
  
  void update(){
    thres = lerp(thres,thresT,0.1);
    vel.add(acc);
    vel.limit(10);
    vel.mult(decay);
    loc.add(vel);
    acc.set(0,0,0);
  }
  
  void repel(Vertex repV){
    PVector dir = new PVector(0, 0);
    float repForce = 0;
    dir = PVector.sub(loc, repV.loc);
    if (dir.mag() < thres) {
        repForce = 1/(dir.mag()+1);
        dir.normalize();
        dir.mult(repForce);
        acc.add(dir);
        repV.acc.sub(dir);
      }
  }
  
  void interferedBy(Interference itf, float force){
    PVector dir = new PVector(0, 0);
    float distance = 0;
    dir = PVector.sub(itf.loc, loc);
    distance = dir.mag();
    dir.normalize();
    dir.mult(distance*force);
    acc.add(dir);
  }
  
  void tensedBy(Vertex v1,Vertex v2, float force){
    PVector mid = new PVector((v1.loc.x+v2.loc.x)*0.5,(v1.loc.y+v2.loc.y)*0.5);
    PVector dir = new PVector(0, 0);
    float distance = 0;
    dir = PVector.sub(mid, loc);
    distance = dir.mag();
    dir.normalize();
    dir.mult(distance*force);
    acc.add(dir);
  }
  
  void display(){
    ellipse(loc.x,loc.y,5,5);
  }
}
class Worm {

  ArrayList vertices;

  Worm() {
    vertices = new ArrayList();
  }

  void update() {
    for (int i=0;i<vertices.size();i++) {
      Vertex eachV = (Vertex) vertices.get(i);
      eachV.update();
    }
  }

  void repelWithin() {
    for (int i=1;i<vertices.size()-1;i++) {
      Vertex eachV = (Vertex) vertices.get(i);
      for (int j=i+1;j<vertices.size()-1;j++) {
        Vertex repV = (Vertex) vertices.get(j);
        eachV.repel(repV);
      }
    }
  }

  void repelWithOther(Worm repWorm) {
    for (int i=1;i<vertices.size()-1;i++) {
      Vertex eachV = (Vertex) vertices.get(i);
      for (int j=1;j<repWorm.vertices.size()-1;j++) {
        Vertex repV = (Vertex) repWorm.vertices.get(j);
        eachV.repel(repV);
      }
    }
  }
  
  void tensedWithin(){
    for (int i=1;i<vertices.size()-1;i++) {
      Vertex eachV = (Vertex) vertices.get(i);
      Vertex pV1 = (Vertex) vertices.get(i-1);
      Vertex nV1 = (Vertex) vertices.get(i+1);
      eachV.tensedBy(pV1,nV1,0.01);
      if(i>1&&i<vertices.size()-2){
        Vertex pV2 = (Vertex) vertices.get(i-2);
        Vertex nV2 = (Vertex) vertices.get(i+2);
        eachV.tensedBy(pV1,nV2,0.005);
        eachV.tensedBy(pV2,nV1,0.005);
        eachV.tensedBy(pV2,nV2,0.005);
      }
    }
  }

  void interferedBy(Interference itf, float force) {
    for (int i=0;i<vertices.size();i++) {
      Vertex eachV = (Vertex) vertices.get(i);
      eachV.interferedBy(itf, force);
    }
  }

  void display() {
    noFill();
    stroke(0);
    strokeWeight(2);
    if (vertices.size()>3) {
      for (int i=1;i<vertices.size()-2;i++) {
        Vertex control1 = (Vertex) vertices.get(i-1);
        Vertex draw1 = (Vertex) vertices.get(i);
        Vertex draw2 = (Vertex) vertices.get(i+1);
        Vertex control2 = (Vertex) vertices.get(i+2);
        curve(control1.loc.x, control1.loc.y, draw1.loc.x, draw1.loc.y, draw2.loc.x, draw2.loc.y, control2.loc.x, control2.loc.y);
      }
    }
  }

  void spawnV(float initX, float initY) {
    if (vertices.size()==0) {
      Vertex addedV = new Vertex(initX, initY);
      vertices.add(addedV);
      newVertexSpawn = true;
    }
    else {
      Vertex lastV = (Vertex) vertices.get(vertices.size()-1);
      if (dist(initX, initY, lastV.loc.x, lastV.loc.y)>=5) {
        Vertex addedV = new Vertex(initX, initY);
        vertices.add(addedV);
        newVertexSpawn = true;
      }else{
        newVertexSpawn = false;
      }
    }
  }
}


