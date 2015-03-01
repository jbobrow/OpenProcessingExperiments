
Cell[] myCells = new Cell[299]; //I increased the number of cells


void setup() {
  background(255);
  size(500, 500);
  for (int i=0; i<myCells.length; i++) {
    myCells[i] = new Cell();
  }
}

void draw() {
  for (int i=0; i<myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
  }
}


//Cell classe
class Cell {
  // Declaring Cell classe variables
  float xlocation;
  float ylocation;
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
  int ellipseDia= 5;

  //Constructor, for constructing the Cell
  Cell() {
    xlocation = random(0, 500);
    ylocation = random(0, 500);
    dia = 5;
    isseed = false;
    cellred = random (0, 255);
    cellgreen = random (0, 255);
    cellblue = random(0, 255);
    // change line weight
    lineweight = random(1.5, 10);
  }

  void display() {
    // change line weight
    stroke(lineweight+random(1.5, 4));
    // change intensity of colour randomly
    fill(cellred+random(0, 255), cellgreen+random(0, 255), cellblue+random(0, 255));
    ellipse(xlocation, ylocation, dia, dia);
  }

  void update() {
    // Decrease the cells speed
    xlocation = xlocation+random(-0.75, 0.5); 
    ylocation = ylocation+random(-0.75, 0.5);
    dia = dia+random(-2, 2);
  }
}


