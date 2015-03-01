
Cell[] myCells = new Cell[1000];


void setup() {
  background(255);
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
  
PVector middle = new PVector(250,250);
myCells[0].location.set(middle);
myCells[0].isseed  = true;

}

void draw() {

  for (int i=0; i< myCells.length; i++) {
    //myCells[i].display();
    myCells[i].update();
  }
  myCells[0].isseed = true;

  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d<=10) {
            myCells[i].isseed=true;

            stroke(random (0, 100), 100);
            strokeWeight (2);
            line (myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y);
          }
        }
      }
    }
  }
}

class Cell {

  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;


  Cell() {

    location = new PVector (random (500), random(500));
    dia = 7;
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
      fill(cellred,cellgreen,cellblue);
    }
    ellipse(location.x, location.y, dia, dia);
  }
  void update() {
    if (isseed == false) {
      velocity = new PVector(random(-5, 5), random(-5, 5));
      location.add(velocity);
    }
  }
}





