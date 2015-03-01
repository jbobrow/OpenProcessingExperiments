
Cell[] myCells = new Cell[899];
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
  //background(255,255,255);
  fill(255,3);
  rect(0,0,500,500);
  noFill();
  for(int i=0; i<myCells.length; i++){
    myCells[i].display();
    myCells[i].update();
    //myCells[i].randomcol();
    //new functions are called within the 'for' loop to change the variables controlling 
    //different aspects of the cells appearance
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
    dia = 3;
    isseed = false;
    cellred = 0;
    cellgreen = 0;
    cellblue = 0;
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
   xlocation = xlocation+random(-3,3);
   ylocation = ylocation+random(-3,3);
   //increase the range of random values increases the speed of cell movements
   //Giving one axis a higher upper range, the cells can be bias towards movement in that direction
 }
 
 void randomcol(){
   cellred = random(0,255);
   cellgreen = random(0,255);
   cellblue = random(0,255);
   //a new function is added and called to change the values for the 
   //cell colour variables with a new random number
 }
 
 
}


