

//this is going to be my cell class
//class is like another function

class Cell {

  float xlocation;
  float ylocation;
  float dia;
  float cellred, cellgreen, cellblue; //if the variables are related most people would put it on a line
  float lineweight;
  boolean isseed;  //the cell needs to know if it is seed or not because they have diffrent properties

  Cell() {

    xlocation=random(0, 700);
    ylocation=random(0, 700);
    // random size of diameter
    dia=random(0.5,10);
    isseed=false;
    cellred=100;
    cellgreen=200;
    cellblue=200;
    lineweight=0.5;
  }

  void display() {
    stroke(lineweight);
    fill(cellred, cellgreen, cellblue);
    ellipse(xlocation, ylocation, dia, dia);
  }

  void update() {
    // tendency to move in one direction
    //also by increasing the diffrence detween the numbers
    //the speed is inceased
    xlocation= xlocation+ random(-5, 3);
    ylocation= ylocation+ random(-5, 3);
  }
}

//diffusion limited aggregation 
//increase the number of cells
Cell[] myCells=new Cell[1000]; 

/*create cell array, create series of boxes that could hold
 the object in them, the first box number is 0
 */

void setup() {
  //change canvas size
  size(700, 700);

  for (int i=0; i<myCells.length ;i++) {  // . length function 
    myCells[i]=new Cell();
  }
}


void draw() {
  background(255);
  for(int i=0; i<myCells.length; i++){
  myCells[i].display(); // go to my cell and call the function, use of the dot syntax
  myCells[i].update();
  }
}





