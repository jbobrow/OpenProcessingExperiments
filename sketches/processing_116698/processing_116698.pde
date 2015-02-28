
//this is going to be my cell class
//class is like another function

class Cell {

  float xlocation;
  float ylocation;
  float dia;
  float cellred, cellgreen, cellblue; 
  float lineweight;
  boolean isseed; 

  Cell() {

    xlocation=random(0, 250);
    ylocation=random(0, 250);
    dia=random(0.5, 16); // varied diameters
    isseed=false;
    cellred=random(0, 255);
    cellgreen=random(100, 255);
    cellblue=random(80, 170);
    lineweight=0.5;
  }

  void display() {
    stroke(cellred,cellgreen,cellblue); //same colour as fill
    fill(cellred, cellgreen, cellblue);
    ellipse(xlocation, ylocation, dia, dia);
  }

  void update() {
    xlocation= xlocation+ random(-2, 2); // increased speed
    ylocation= ylocation+ random(-2, 2);
  }
}

//diffusion limited aggregation 

Cell[] myCells=new Cell[1000]; 

void setup() {
  size(250, 250);
  background(255); // cells leave trace
  for (int i=0; i<myCells.length ;i++) {  // . length function 
    myCells[i]=new Cell();
  }
}


void draw() {

  for (int i=0; i<myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
  }
}




