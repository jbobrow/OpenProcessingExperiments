
ArrayList<Particle> ptz = new ArrayList<Particle>(arraySizeX*arraySizeY);
int arraySizeX = 16;
int arraySizeY = 16;
float gridSize = 15;
PVector mStartPos;
boolean dragging;
PVector gravity = new PVector(0, 0.1, 0);

// PULL HARD TO DAMAGE CLOTH

float damageSize = 4*gridSize;


void setup() {
  size(600, 400, P3D);
  for (int i = 0; i < arraySizeX;i++) {
    for (int j = 0; j < arraySizeY;j++) {
      ArrayList<Integer> ngh = new ArrayList<Integer>();
      if (i != 0) ngh.add((i-1)*arraySizeX + j);
      if (i != arraySizeX-1) ngh.add((i+1)*arraySizeX + j);
      if (j != 0) ngh.add(i*arraySizeX + j-1);
      if (j != arraySizeY-1) ngh.add(i*arraySizeX + j+1);
      int id = ptz.size();
      int [] ngha = new int[ngh.size()];
      for(int k = 0; k < ngh.size();k++) {
          ngha[k] = ngh.get(k);
      }
      PVector pv = new PVector(-arraySizeX*0.5*gridSize + i*gridSize, -arraySizeY*0.5*gridSize +  j*gridSize, 0);
      Particle p = new Particle(ngha,pv,id);
      ptz.add(p);
   }
  }

}
void draw() {

  background(255);
  translate(width*0.5, height*0.5);
  for (int i = 0; i < ptz.size();i++) {
    ptz.get(i).force.add(gravity);
    if (dragging) {
      PVector mCurrPos = new PVector(mouseX-width*0.5, mouseY-height*0.5);
      PVector temp = PVector.sub(mCurrPos, mStartPos);

      if (PVector.dist(mStartPos, ptz.get(i).pos) < 1) temp.normalize();
      else temp.mult(1/PVector.dist(mStartPos, ptz.get(i).pos));
      if (temp.mag() > 100) temp.normalize();
      temp.mult(0.4);
      ptz.get(i).force.add(temp);
    }
  }
  for (int i = 0; i < ptz.size();i++) {
    ptz.get(i).neighPull();
    ptz.get(i).neighCheck();
  }
  stroke(0);
  strokeWeight(1);
  for (int i = 0; i < ptz.size();i++) {
    if (i%arraySizeX != 0 || i > arraySizeX*arraySizeY-1)
      ptz.get(i).move();
      ptz.get(i).drawNeigh();
  }
  stroke(255, 0, 0);
  strokeWeight(2);
  for (int i = 0; i < ptz.size();i++) {
    ptz.get(i).draw();
    ptz.get(i).clear();
  }
}
class Particle {
  PVector pos;
  PVector vel;
  PVector accel;
  PVector force;
  int [] neighbours;
  int self;
  Particle(int [] ngh, PVector position,int selfID) {
    self = selfID;
    pos = position.get(); 
    force = new PVector(0, 0, 0);
    accel = new PVector(0, 0, 0);
    vel = new PVector(0, 0, 0);
    //neighbours = new int[ngh.length];
    neighbours = ngh;
    
  }
  void neighPull() {
    for (int i = 0; i < neighbours.length; i++) {
      pull(ptz.get(neighbours[i]).pos);
      ptz.get(neighbours[i]).pull(pos);
    }
  }
  void neighCheck() {
    for (int i = 0; i < neighbours.length; i++) {
      float distance = PVector.dist(ptz.get(neighbours[i]).pos, pos);
      if (distance>damageSize) {
        PVector mid = PVector.sub(ptz.get(neighbours[i]).pos, pos);
        mid.normalize();
        mid.mult(distance*0.5);
        mid.add(pos);
        int id = ptz.size();
        ptz.add(new Particle(new int [] {neighbours[i],self},mid,id));
        for(int j = 0; j <ptz.get(neighbours[i]).neighbours.length;j++) {
          if(ptz.get(neighbours[i]).neighbours[j] == self) {
            ptz.get(neighbours[i]).neighbours[j] = id;
            break;
          }
        }
      neighbours[i] = id;
       
      }
    }
  }
void drawNeigh() {
  for(int i = 0; i<neighbours.length;i++) {
    line(pos.x,pos.y,ptz.get(neighbours[i]).pos.x,ptz.get(neighbours[i]).pos.y);
  }
}
  void draw() {
    PVector temp = force.get();
    temp.mult(10);
    temp.add(pos);
  }
  void pull(PVector otherPosition) {
    float distance = PVector.dist(otherPosition, pos);
    float displ = distance - gridSize;
    PVector minforce = PVector.sub(otherPosition, pos);
    minforce.normalize();
    minforce.mult(displ);
    minforce.mult(0.2);
    force.add(minforce);
  }
  void move() {
    force.mult(.99);
    accel.add(force);
    vel.add(accel);
    vel.mult(.98);
    pos.add(vel);
  }
  void clear() {
    force = new PVector(0, 0, 0);
    accel = new PVector(0, 0, 0);
  }
}
void mousePressed() {
  dragging = true;
  mStartPos = new PVector(mouseX-width*0.5, mouseY-height*0.5);
}
void mouseReleased() {
  dragging = false;
}
