
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
    isseed = true;
    cellred = 200;
    cellgreen = 200;
    cellblue = 10;
    lineweight=1;
    dia = 5;
 
  }
  
  void display(){
    stroke(lineweight);
    fill(cellred,cellgreen,cellblue,128);
    ellipse(width/4+xlocation, height/4+ylocation, dia, dia);
  }
  
   
  void update(){
    xlocation = xlocation+random(-4,4);
    ylocation = ylocation+random(-4,4);
  
  }
}

class OtherCell{
  
  float xlocation;
  float ylocation;
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
  
//using a constructor

  OtherCell(){
    
    xlocation = 10;
    xlocation = 10;
    isseed = true;
    cellred = 200;
    cellgreen = 200;
    cellblue = 10;
    lineweight=1;
    dia = 5;
 
  }
  
   void display2(){
    stroke(lineweight);
    fill(cellred,cellgreen,cellblue);
    ellipse(3*width/4+xlocation, 3*height/4+ylocation, dia, dia);
  }
  void update2(){
    xlocation = xlocation+random(-4,4);
    ylocation = ylocation+random(-4,4);
  
  }
}
    
    

Cell[] myCells = new Cell[20];
OtherCell[] myOtherCells = new OtherCell[30];

Cell myCell;
OtherCell myOtherCell;

void setup(){
  size(500,500);
  background(255);
  for(int i = 0; i < myCells.length; i ++){
  myCells[i] = new Cell();
  }
  for(int i = 0; i < myOtherCells.length; i ++){
  myOtherCells[i] = new OtherCell();
  }
}

void draw(){
  fill(255,255,255,35);
  rect(0, 0, width, height);
  for(int i = 0; i < myCells.length; i++){
  myCells[i].display();
  myCells[i].update();
  }
  for(int i = 0; i < myOtherCells.length; i++){
  myOtherCells[i].display2();
  myOtherCells[i].update2();
  }
  
}








