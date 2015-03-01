
Cell[] myCells = new Cell[299]; //I increased the number of cells


void setup() {
  size(500, 500);
  for (int i=0; i<myCells.length; i++) {
    myCells[i] = new Cell();
  }
}

void draw() {
  background(255);
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
    lineweight = 0.1;
  }

  void display() {
    stroke(lineweight);
    fill(cellred, cellgreen, cellblue);
    ellipse(xlocation, ylocation, dia, dia);
  }

  void update() {
    // Increase the cells speed
    xlocation = xlocation+random(-4, 1); 
    ylocation = ylocation+random(-4, 1);
    dia = dia+random(-2, 2);
  }
}



