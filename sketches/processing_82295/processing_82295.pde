
Agent[] aArray;
PVector[] oArray;
float speedLimit = 4;
float perceptionDistance = 200;
float normalDistance = 30;
float privacyDistance = 10;
boolean pause;

void setup() {
  size(800,800);
  background(255);
  fill(0);
  aArray = new Agent[300];
  oArray = new PVector[0];
  for (int i=0; i<aArray.length; i++) {
    aArray[i] = new Agent(round(random(width)), round(random(height)), i);
  }
  pause = false;
}

void draw() {
  noStroke();
  fill(255,200);
  rect(0,0,width,height);
  fill(0);

  for (int i=0; i<aArray.length; i++) {
    aArray[i].drawMe();
    aArray[i].getNeighbors(perceptionDistance, privacyDistance);
  }
  for (int i=0; i<oArray.length; i++) {
    fill(255,0,0);
    ellipse(oArray[i].x, oArray[i].y, 5, 5);
  }
  for (int i=0; i<aArray.length; i++) {
    aArray[i].update();
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    if (pause) {
      loop();
      pause = false;
    }else{
      noLoop();
      pause = true;
    }
  }else if (mouseButton == LEFT) {
    PVector newObst = new PVector(mouseX, mouseY);
    oArray = (PVector[]) append(oArray, newObst);
  }
}


class Agent {
  PVector pos, dir, target;
  int nb[];
  float vel;
  int count;

  Agent(int x, int y, int c) {
    pos = new PVector(x, y);
    dir = new PVector(random(4)-2,random(4)-2);
    dir.normalize();
    dir.mult(speedLimit);
    vel = random(2, speedLimit);
    count = c;
  }
  
  void getNeighbors(float dirRadius, float posRadius) {
    nb = new int[0];
//    println(count);
    for(int i=0; i<aArray.length; i++) {
      if (i != count) {
        float delta = PVector.dist(pos, aArray[i].pos);
//        println(i + " " + delta);
        if (delta < dirRadius) {
          nb = append(nb, i);
        }
      }
    }
  }
    
  void getDirVel() {
    float clearDist = perceptionDistance;
    PVector newDir = new PVector(0,0);
    PVector newPos = new PVector(0,0);
    PVector newVar = new PVector(0,0);
    PVector newAwa = new PVector(0,0);
    for (int i=0; i<nb.length; i++) {
      newDir.add(aArray[nb[i]].dir);
      float delta = PVector.dist(aArray[nb[i]].pos, pos);
      if ((delta > privacyDistance) && (clearDist > privacyDistance)) {
        newVar.add(PVector.sub(aArray[nb[i]].pos, pos));
      }else if ((clearDist > delta)&&(delta < privacyDistance)) {
        newPos = PVector.sub(pos, aArray[nb[i]].pos);
        clearDist = delta;
      }
    }
    for (int i=0; i<oArray.length; i++) {
      float delta = PVector.dist(oArray[i], pos);
      if (delta < normalDistance) {
        newAwa.add(PVector.sub(pos, oArray[i]));
      }
    }
        
    newDir.normalize();
    newPos.normalize();
    newVar.normalize();
    newAwa.normalize();
//first modify dir to conform to flock behaviour
    newDir.mult(0.1);
    dir.add(newDir);
    dir.limit(speedLimit);
    if (clearDist > normalDistance) {
// if too far from flock get closer
      newVar.mult(0.01);
      dir.add(newVar);
    }else if (clearDist < privacyDistance){
// if too close to neighbour move away but keep speed constant
      newPos.mult(0.01);
      dir.add(newPos);
      dir.limit(speedLimit);
    }
// if any obstacle in privacy distance move to avoid obstacle
    newAwa.mult(0.3);
    dir.add(newAwa);
    dir.limit(speedLimit);
  }
  
  void detectEdges() {
    if (pos.x>width) {pos.x = 0;};
    if (pos.x<0) {pos.x = width;};
    if (pos.y>height) {pos.y = 0;};
    if (pos.y<0) {pos.y = height;};
  }
  
  void update() {
    getDirVel();
    pos.add(dir);
    detectEdges();
  }
  
  void drawMe() {
    stroke(0);
    fill(0);
    ellipse(pos.x,pos.y,4,4);
/*    stroke(255,0,0);
    noFill();
    ellipse(pos.x,pos.y,perceptionDistance,perceptionDistance);
    stroke(0,0,255);
    ellipse(pos.x,pos.y,privacyDistance,privacyDistance);
  */} //circles that show the perception radius and the privacy radius
}

