
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
    dia = random(3,10);
    isseed = false;
    cellred = random(200);
    cellgreen = random(10);
    cellblue = random(200);
    lineweight=random(2);
  }
  
  void display(){
    stroke(lineweight);
    fill(cellred,cellgreen,cellblue);
    ellipse(width/2+xlocation, height/2+ylocation, dia, dia);
  }
  void update(){
    xlocation = xlocation+random(-2,2);
    ylocation = ylocation+random(-2,2);
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


