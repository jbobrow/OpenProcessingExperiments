
import processing.pdf.*;

Cell[] myCells = new Cell[5000];


void setup() {
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
PVector topleft= new PVector(100,100);
PVector topright= new PVector(400,100);
PVector bottomleft= new PVector(100,400);
PVector bottomright= new PVector(400,400);

myCells[0].location.set(topleft);
myCells[1].location.set(topright);
myCells[2].location.set(bottomleft);
myCells[3].location.set(bottomright);


 

}
void draw() {
 myCells[3].isseed = true;
  myCells[2].isseed = true;
  myCells[1].isseed = true;
  myCells[0].isseed = true;
  for (int i=0; i<myCells.length; i++) {
    myCells[i].update();
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length;j++) {
        if (myCells[j].isseed == true) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d < 10) {
            myCells[i].isseed = true;

            line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y);
          }
        }
      }
    }
  }

}

void keyPressed() {
  if (key=='e') {
    endRecord();
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

    location = new PVector(random(500), random(500));
    dia = 5;
    isseed = false;
    cellred = random(0, 255);
    cellgreen = random(0, 255);
    cellblue = random(0, 255);
    lineweight = 0.1;
  }

  void display() {
    stroke(lineweight);
    if (isseed == true) {
      fill(cellred, 200, 0);
    }
    if (isseed == false) {
      fill(100, 255, 100);
    }
    ellipse(location.x, location.y, dia, dia);
  }
  void update() {


    if (isseed == false) {
      velocity = new PVector(random(-100, 100), random(-100, 100));
      location.add(velocity);
    }
  }
}






