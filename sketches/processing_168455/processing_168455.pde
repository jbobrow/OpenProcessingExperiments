
//stopping cells in the corner

Cell[] myCells = new Cell[99]; //declare and create

void setup(){
 size(500, 500);
for(int i = 0; i<myCells.length; i++){   //assign
myCells[i] = new Cell();
}
}

void draw(){
  background(255);
  for(int i = 0; i<myCells.length; i++){
 myCells[i].display();
 myCells[i].update(); 
 myCells[i].stopping();
  }
}
//creating a class

class Cell{
  
  float xlocation;    //declare variables
  float ylocation;
  float dia;
  boolean isseed;     //why?????
  float cellred, cellgreen, cellblue;
  float lineweight; 
  

  Cell(){                                //constructing the class
  xlocation = random(0, 400);            // assign values = define
  ylocation = random(0,400);
  dia = 10;
  isseed = false;
  cellred = 10;
  cellgreen = 200;
  cellblue = 200;
  lineweight = 0.5;
  }
  
  void display(){
    stroke(lineweight);                   //creating functions
    fill(cellred, cellgreen, cellblue);
    ellipse(xlocation, ylocation, dia, dia);

  }
  
  void update(){
    xlocation = xlocation+random(-0.1, 2);  //changing random values the direction and speed can be changed
    ylocation = ylocation+random(-0.1, 1 );  
    }
    
 void stopping(){
   if( (xlocation > 490) || (xlocation < 0)){
   xlocation = xlocation *-1;
   }

   if( (ylocation > 490) || (ylocation < 0)){
   ylocation = ylocation *-1;
   }
 }
  
  
}


