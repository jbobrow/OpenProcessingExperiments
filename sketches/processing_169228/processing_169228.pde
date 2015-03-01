
//creating the cell class

class Cell{
  
  float xlocation;
  float ylocation;
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
  
//using a constructor

  Cell(){
    
    xlocation = 10;
    xlocation = 10;
    dia = 5;
    isseed = false;
    cellred = 200;
    cellgreen = 200;
    cellblue = 10;
    lineweight=0.5;
  }
  
  void display(){
    stroke(lineweight);
    fill(cellred,cellgreen,cellblue);
    ellipse(xlocation, ylocation, dia, dia);
  }
  void update(){
    xlocation = xlocation+random(-1,2);
    ylocation = ylocation+random(-1,2);
  }
}
    

Cell[] myCells = new Cell[200];

Cell myCell;

void setup(){
  size(500,500);
  for(int i = 0; i < myCells.length; i ++){
  myCells[i] = new Cell();
  }
}

void draw(){
  background(255);
  for(int i = 0; i < myCells.length; i++){
  myCells[i].display();
  myCells[i].update();
  }
}


