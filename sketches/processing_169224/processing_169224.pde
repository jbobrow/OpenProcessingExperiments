
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
    cellred = 10;
    cellgreen = 200;
    cellblue = 200;
    lineweight=0.5;
  }
  
  void display(){
    stroke(lineweight);
    fill(cellred,cellgreen,cellblue);
    ellipse(250+xlocation, 250+ylocation, dia, dia);
  }
  void update(){
    xlocation = xlocation+random(-1,1);
    ylocation = ylocation+random(-1,1);
  }
}
    

Cell[] myCells = new Cell[99];

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


