
Cell[] myCells = new Cell[1000];


void setup() {
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
  
PVector upleft = new PVector(125,125);
myCells[1].location.set(upleft);
myCells[1].isseed  = true;

PVector upright = new PVector(375,125);
myCells[2].location.set(upright);
myCells[2].isseed  = true;

PVector downleft = new PVector(125,375);
myCells[3].location.set(downleft);
myCells[3].isseed  = true;

PVector downright = new PVector(375,375);
myCells[4].location.set(downright);
myCells[4].isseed  = true;

}

void draw() {
  background(255);
  for (int i=0; i< myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
  }
  myCells[1].isseed = true;

  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d<=5) {
            myCells[i].isseed=true;
          }
        }
      }
    }
  }
  myCells[2].isseed = true;

  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d<=5) {
            myCells[i].isseed=true;
          }
        }
      }
    }
  }
  myCells[3].isseed = true;

  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d<=5) {
            myCells[i].isseed=true;
          }
        }
      }
    }
  }
  myCells[4].isseed = true;

  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d<=5) {
            myCells[i].isseed=true;
          }
        }
      }
    }
  }
}

//this is the cell classe. We defnie it in two parts. First we delare its variables:

class Cell {

  PVector location = new PVector();
  PVector velocity = new PVector();
  //float xlocation;
  //float ylocation;
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;

  //then we construct it - using a 'constructor 

  Cell() {

    //xlocation = random(0,500);
    //ylocation = random(0,500);
    location = new PVector (random (500), random(500));
    dia = 5;
    isseed = false;
    cellred = 255;
    cellgreen = 255;
    cellblue = 255;
    lineweight = 0.1;
  }

  void display() {
    stroke(lineweight);
    if (isseed == true) {
      fill(255, 0, 0);
    }
    if (isseed == false) {
      fill(cellred, cellgreen, cellblue);
    }
    ellipse(location.x, location.y, dia, dia);
  }
  void update() {
    if (isseed == false) {
      velocity = new PVector(random(-2, 2), random(-2, 2));
      location.add(velocity);
      //xlocation = xlocation+random(-0.5, 0.5);
      //ylocation = ylocation+random(-0.5, 0.5);
    }
  }
}







