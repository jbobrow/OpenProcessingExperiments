
Cell[] myCells = new Cell[599];
//Creating an array of the Cell class
//Increasing the number of cells using the bracketed value
Cell myCell;
//Type of class 'Cell' and assign a name for the 'Cell', as a variable
//User-defined class in place of usual e.g. integer, float etc

void setup(){
  size(500,500);
  for(int i=0; i<myCells.length; i++){
    myCells[i] = new Cell();
  }
}

void draw(){
  background(255);
  for(int i=0; i<myCells.length; i++){
    myCells[i].display();
    myCells[i].update();
  }
}
//CLASS
class Cell{
  //defining what a 'Cell' is, to allow us to use this multiple times in the simulation
  float xlocation;
  float ylocation;
  float dia;
  //diameter variable
  boolean isseed;
  //is the seed frozen, as a 'seed'
  float cellred, cellgreen, cellblue;
  float lineweight;
  
  //all the variables in the cell to change its behaviour and appearance
  
  //CONSTRUCTOR
  Cell(){
    xlocation = random(20,480);
    ylocation = random(20,480);
    dia = 5;
    isseed = false;
    cellred = random(0,255);
    cellgreen = random(0,255);
    cellblue = random(0,255);
    lineweight = 0.5;
    //initialisation of the different values for the cell's variables
  }

  //FUNCTION
  void display(){
  stroke(lineweight);
  fill(cellred,cellgreen,cellblue);
  ellipse(xlocation,ylocation,dia,dia);
 }
 
 void update(){
   xlocation = xlocation+random(-2,2);
   ylocation = ylocation+random(-2,2);
   //increase the range of random values increases the speed of cell movements
 }
 
 void randomcol(){
   fill(cellred,cellgreen,cellblue);
 }
 
}


