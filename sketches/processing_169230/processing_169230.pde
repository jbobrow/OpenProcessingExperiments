
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
    isseed = false;
 
  }
  
  void display(){
    stroke(lineweight);
    fill(cellred,cellgreen,cellblue);
    ellipse(width/2+xlocation, height/2+ylocation, dia, dia);
  }
  void update(){
    xlocation = xlocation+random(-2.5,2.5);
    ylocation = ylocation+random(-2.5,2.5);
    cellred = random(200)+4;
    cellgreen = random(10)+4;
    cellblue = random(200)+5;
    lineweight=random(10)+5;
    dia = random(3,12)+0.05;
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


