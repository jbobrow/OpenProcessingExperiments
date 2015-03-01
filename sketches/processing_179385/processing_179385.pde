
//creating grid array for atoms to sit in

Cell[]myCells= new Cell[1600]; //1600 cells total


void setup() {
  size(750, 750); // sets up canvas size
  int i3=0;
  for (int i = 0; i < 40; i ++) { //sets up row by row grid creating 40 atoms across
    for (int i2 = 0; i2 < 40; i2 ++) {
      myCells[i3] = new Cell(i, i2);
      i3++;
    }
  }
  myCells[0].isseed=true;
  // start position of the first seed cell
  myCells[0].location= new PVector(random(370, 375), random(370, 375)); //random value within small range to garuntee collisions
}


void draw () {
  background(255); //bg colour white
  for (int i=0; i<myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
  }
  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed== false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed==true) {
          float d;
          d= PVector.dist(myCells[i].location, myCells[j].location);
          if (d<5) {
            myCells[i].isseed=true;
          }
        }
      }
    }
  }
}

//cell class variables 

class Cell {
  PVector location= new PVector(); //creating vectors
  PVector velocity=new PVector();
  float dia;
  boolean isseed;
  float lineweight;
  float randomx = random(-3, 3); // random direction to apply to new neutrons after collision
  float randomy = random(-3, 3);

// cell constructor

  Cell(int i, int i2) {

    int factor1 = 0;

    // if even
    if (i2 % 2 == 0)
      factor1 = 22;
    else
      factor1 = 0;

    location = new PVector(  i*12+12+factor1, i2*17+12 ); // constructing cells on grid (atoms)
    //  new PVector(random(750), random(750));
    dia = 8;
    isseed = false; //cells start as atoms
  }

  void display() {
    if (isseed==true) { //if cell is a seed(neutron)
      fill(0, 255, 255);  //blue neutrons
      velocity = new PVector(randomx, randomy); //gives neutrons random movement direction
      location.add(velocity); //changing location due to changing random velocity
    }
    if (isseed==false) {
      fill(255); //white atoms
    }

    ellipse(location.x, location.y, dia, dia);
  }
  void update() {
    if (isseed==false) {
      velocity = new PVector(random(-0, 0), random(-0, 0)); //atoms fixed in place
      location.add(velocity);
    }
  }
}



