
//growing Cells XD

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
  

  Cell(){           //constructing the class
  xlocation = random(0, 500);   // assign values = define
  ylocation = random(0,500);
  dia = 0.1;
  isseed = false;
  cellred = random(255, 100);   //set random values to get different colors
  cellgreen = random(0, 100) ;
  cellblue = random(130, 190);
  lineweight = 0.1;
  }
  
  void display(){
    stroke(lineweight);   //creating functions
    fill(cellred, cellgreen, cellblue);
    ellipse(xlocation, ylocation, dia, dia);
}

  void update(){
    xlocation = xlocation+random(-3, 3);//changing random's values the direction and speed can be changed
    ylocation = ylocation+random(-3, 3);
    dia = dia+random(0.1, 1);
    }
   
}


