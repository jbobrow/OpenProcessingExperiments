
//creating grid array for atoms to sit in

Cell[] myCells = new Cell[1600]; //1600 cells total


void setup() {
  size(750, 750);

  int i3=0;
  for (int i2 = 0; i2 < 40; i2 ++) { // see this as y-value 
    for (int i = 0; i < 40; i ++) {    // see this as x value 
      myCells[i3] = new Cell(i, i2, false);
      i3++;
    }
  }
  myCells[0].isseed=true;
  // start position of the first seed cell
  myCells[0].location= new PVector(220,375);
}


void draw () {
//  background(255);
  println (myCells.length);
  for (int i=0; i<myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
  }
  
 
  
  
  for (int i=0; i<myCells.length; i++) {
    if (!myCells[i].isseed) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed) {
          float d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d<5) {  // if cell is close it becomes a seed (neutron)
            myCells[i].isseed=true;
                          line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y); //add lines

            // create a new cell
            Cell newCell = new Cell(int(myCells[i].location.x), int(myCells[i].location.y), true);
            // and append it  
            myCells = (Cell[]) append(myCells, newCell);
          }
        }
      }
    }
  }
}

// =================================

class Cell {
  PVector location= new PVector(); //creating vectors
  PVector velocity=new PVector();
  float dia;
  boolean isseed;
  float lineweight;
  float randomx = random(-3, 3); // random direction to apply to new neutrons after collision
  float randomy = random(-3, 3);

  final int typeNeutron = 0;   // consts 
  final int typeAtomUranium = 1; 
  final int typeAtomBa = 2; 
  final int typeAtomKr = 3; 
  int type = typeNeutron;    // current 


  Cell(int i, int i2, boolean isseedTemp) {
    int factor1 = 0;

    // if even
    if (i2 % 2 == 0)
      factor1 = 21;
    else
      factor1 = 0;

    location = new PVector(  i*12+12+factor1, i2*17+12 ); //creates grid of cells (atoms)
    //  new PVector(random(750), random(750));
    dia = 30;
    isseed = isseedTemp; // false;
  }
  
//Cell(int typeAtomUranium, boolean isseedTemp) {


    //location = new PVector(500,500); //creates grid of cells (atoms)
    //  new PVector(random(750), random(750));
  //  dia = 13;
  //    fill(0);
  //  isseed = isseedTemp; // false;
 // }


  void display() {
        int col1 = 255;

    if (isseed==true) {

      fill(0, col1, col1);  //blue neutrons

      velocity = new PVector(randomx, randomy); //gives neutrons random movement direction
      location.add(velocity); //add velocity to current location
    }
    if (isseed==false) {  //if false = ATOM. Stay white
      fill(255);
    }

    //ellipse(location.x, location.y, dia, dia); //cell location and diameter
  }
  void update() {
    if (isseed==false) {
      velocity = new PVector(random(-0, 0), random(-0, 0)); //atoms fixed in place
      location.add(velocity);
    }
  }
}



