

//this is going to be my cell class
//class is like another function

class Cell {

  float xlocation;
  float ylocation;
  float dia;
  float cellred, cellgreen, cellblue; //if the variables are related most people would put it on a line
  float lineweight;
  boolean isseed;  //the cell needs to know if it is seed or not because they have diffrent properties

  Cell(int x, int y, int red, int gr, int bl, int density) {

    xlocation=x+random(0, density);
    ylocation=y+random(0, density);
    dia=random(1, 17);
    isseed=false;
    cellred=red;
    cellgreen=gr;
    cellblue=bl;
    lineweight=0.5;
  }

  void display() {
    stroke(cellred, cellgreen, cellblue);
    fill(cellred, cellgreen, cellblue, random(5, 100));
    ellipse(xlocation, ylocation, dia, dia);
  }

  void update() {
    xlocation= xlocation+ random(-3, 19);
    ylocation= ylocation+ random(-1, 1);
  }
}

//diffusion limited aggregation 

Cell[] myCells=new Cell[1000]; 
int sec=0;
/*create cell array, create series of boxes that could hold
 the object in them, the first box number is 0
 */

void setup() {
  size(500, 500);
  background(255);
  frameRate(55);

  for (int i=0; i<100 ;i++) {  // . length function 
    myCells[i]=new Cell(100, 200, 32, 178, 170, 100);
  }
  for (int i=100; i<200 ;i++) {  // . length function 
    myCells[i]=new Cell(400, 400, 0, 128, 128, 800);
  }
  
    for (int i=200; i<300 ;i++) {  // . length function 
    myCells[i]=new Cell(100, 300, 175, 238, 238, 800);
  }
  
  for (int i=300; i<400 ;i++) {  // . length function 
    myCells[i]=new Cell(50, 50, 137, 216, 230, 300);
  }
  
    for (int i=400; i<500 ;i++) {  // . length function 
    myCells[i]=new Cell(200, 150, 95, 158, 160, 300);
  }
  for (int i=500; i<600 ;i++) {  // . length function 
    myCells[i]=new Cell(50, 250, 70, 130, 180, 100);
  }

  for (int i=600; i<700 ;i++) {  // . length function 
    myCells[i]=new Cell(250, 450, 224, 255, 255, 300);
  }
  
   for (int i=700; i<800 ;i++) {  // . length function 
    myCells[i]=new Cell(150, 250, 25, 25, 112, 100);
  }
  for (int i=800; i<1000 ;i++) {  // . length function 
    myCells[i]=new Cell(100, 450, 255, 215, 0, 100);
  }
}


void draw() {
  //if (second()-sec >3) {
   // background(0);
    //sec=second();
 // }
  for (int i=0; i<myCells.length; i++) {
    myCells[i].display(); // go to my cell and call the function, use of the dot syntax
    myCells[i].update();
  }
}



