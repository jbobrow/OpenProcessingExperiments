
import processing.pdf.*;
boolean record;
//Creating a vector output as pdf:
//Start by calling an processing library for pdf creating, and set
//a boolean variable for 'record'

Cell[] myCells = new Cell[999];
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
  if(record){
    beginRecord(PDF, "frame-####.pdf");
  }
  //Use an 'if' statement to check if 'record' is true - 
  //record is set via a mouseClicked function, so when the mouse has been
  //clicked, e.g. pressed AND released, it will mark as true. This then starts
  //the PDF 'recording' process and saves the current frame as .pdf with the frame No.
  
  background(255);
  for(int i=0; i<myCells.length; i++){
    myCells[i].display();
    myCells[i].update();
    myCells[i].randomcol();
    myCells[i].loc();
   // myCells[i].sizechng();
    //new functions are called within the 'for' loop to change the variables controlling 
    //different aspects of the cells appearance
  }
  
  if (record){
    endRecord();
      record = false;
      //Once the frame is drawn, the recording stops, and the record variable is reset to false
  }
}

void mouseClicked(){
  record = true;
  //The mouseClicked function allows a mouse button click and release to change the 'record'
  //boolean variable to 'true' and start the recording process.
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
  
  int[] loc = {30,140,260,340,450};
  int[] loc2 = {80,160,200,300,490};
  int ran1 = 0;
  int ran2 = 0;
  //The above creates clusters of cells on the canvas. The loc/loc2 arrays set a
  //collection of numbers, and two variables to contain random numbers
  
  //all the variables in the cell to change its behaviour and appearance
  
  //CONSTRUCTOR
  Cell(){
    ran1 = int(random(loc.length));
    ran2 = int(random(loc2.length));
    //on intialiasation of the cells, 2 random numbers are generated as integers
    xlocation = loc[ran1]; 
    ylocation = loc2[ran2];
    //the random numbers are then used to call an index from the loc/loc2 arrays
    //to provide a location based on a pre-determined list of possible values,
    //resulting in starting cells clustered in the various coordinates
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
   xlocation = xlocation+random(-1,1);
   ylocation = ylocation+random(-1,1);
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
 
 void sizechng(){
   dia = random(2,10);
   //a new function is added to randomly change the size of the cells
 }
 
 void loc(){
   ran1 = int(random(loc.length));
    ran2 = int(random(loc2.length));
 }
}


