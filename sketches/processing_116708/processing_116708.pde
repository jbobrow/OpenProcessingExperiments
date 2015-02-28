
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
    dia=random(1, 20);
    isseed=false;
    cellred=red;
    cellgreen=gr;
    cellblue=bl;
    lineweight=0.5;
  }

  void display() {
    stroke(cellred, cellgreen, cellblue);
    fill(cellred, cellgreen, cellblue, random(10, 200));
    ellipse(xlocation, ylocation, dia, dia);
  }

  void update() {
    xlocation= xlocation+ random(-3, 3);
    ylocation= ylocation+ random(-3, 3);
  }
}

//diffusion limited aggregation 

Cell[] myCells=new Cell[500]; 

/*create cell array, create series of boxes that could hold
 the object in them, the first box number is 0
 */

void setup() {
  size(500, 500);
  frameRate(55);
   background(255 ,246,143);

  for (int i=0; i<100 ;i++) {  // . length function 
    myCells[i]=new Cell(100, 200, 139,0 ,0, 60);
  }
  for (int i=100; i<300 ;i++) {  // . length function 
    myCells[i]=new Cell(400, 200, 0, 100, 0, 100);
  }
  for (int i=300; i<500 ;i++) {  // . length function 
    myCells[i]=new Cell(50, 400, 113 , 198, 113 , 20);
  }
}


void draw() {

   background(255,236,139);

  for (int i=0; i<myCells.length; i++) {
    myCells[i].display(); // go to my cell and call the function, use of the dot syntax
    myCells[i].update();
  }
}

// Take the screenshot
void keyPressed() {
  if (key == 's' || key == 'S') {
      save("picture1.tif");
   }
}
