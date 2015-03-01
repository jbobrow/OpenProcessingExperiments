
//Nuclear fission simulation
//v1.0
//Michael Boalch
//


//creating grid array for atoms to sit in

Cell[] myCells = new Cell[1600]; //creates an array for the objects, 1600 cells total

void setup() {
  size(510, 750);  //size of the canvas

  int i3=0;
  for (int i2 = 0; i2 < 40; i2 ++) { // see this as y-value 
    for (int i = 0; i < 40; i ++) {    // see this as x value 
      myCells[i3] = new Cell(i, i2);  //populates the array with neutrons and protons
      i3++;
    }
  }
  myCells[0].isseed=true;  //first cell is a seed
  myCells[0].location= new PVector(220, 375); // central start position of the first seed cell
}

void draw () {
    background(255);  //background drawn in
  for (int i=0; i<myCells.length; i++) {  //calls the functions for the cells
    myCells[i].display(); 
    myCells[i].update();
  }

  for (int i=0; i<myCells.length; i++) {
    if (!myCells[i].isseed) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed) {
          float d = PVector.dist(myCells[i].location, myCells[j].location);  
          if (d<3) {  // if cell is close it becomes a seed (neutron)
            myCells[i].isseed=true;
            //line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y); //add lines

          }
        }
      }
    }
  }
}

// =================================

class Cell {
  PVector location= new PVector(); //creating vectors to replace original locations
  PVector velocity=new PVector();  //adds velocity to use vector math
  float dia; //diameter of the cells
  boolean isseed; //true or false, neutron or atom
  float randomx = random(-1, 1); // random direction to apply to new neutrons after collision
  float randomy = random(-1, 1);

  Cell(int i, int i2) {
    int factor1 = 0;

    // if even
    if (i2 % 2 == 0)
      factor1 = 21;
    else
      factor1 = 0;

    location = new PVector(  i*12+12+factor1, i2*17+12 ); //creates grid of cells (atoms)
    dia = 8;
  }

  void display() {

    if (isseed==true) {  //if seed(neutron) 

      fill(0, 255, 255);  //blue neutrons

      velocity = new PVector(randomx, randomy); //gives neutrons random movement direction
      location.add(velocity); //add velocity to current location
    }
    if (isseed==false) {  //if false = atom, stay white
      fill(255);
    }

    ellipse(location.x, location.y, dia, dia); //draws ellipse to represent cells, cell location and diameter
  }
  void update() {
    if (isseed==false) {
      velocity = new PVector(random(-0, 0), random(-0, 0)); //atoms fixed in place
    }
  }
}

void keyPressed() {
  if (key=='e') { //when e is pressed a dxf file is saved
    endRaw();
  }
}



