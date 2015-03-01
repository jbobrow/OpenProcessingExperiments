
//import processing.dxf.*; //importing dxf library


//creating grid array for atoms to sit in

Cell[] myCells = new Cell[1600]; //1600 cells total


void setup() {
  size(510, 750, P3D);
//  beginRaw(DXF, "facade.dxf"); //begins to draw dxf file

  int i3=0;
  for (int i2 = 0; i2 < 40; i2 ++) { // see this as y-value 
    for (int i = 0; i < 40; i ++) {    // see this as x value 
      myCells[i3] = new Cell(i, i2);
      i3++;
    }
  }
  myCells[0].isseed=true;
  // start position of the first seed cell
  myCells[0].location= new PVector(220, 375);
}


void draw () {
   // background(255);
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
          if (d<8) {  // if cell is close it becomes a seed (neutron)
            myCells[i].isseed=true;
            line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y); //add lines

            // create a new cell
            Cell newCell = new Cell(int(myCells[i].location.x), int(myCells[i].location.y));
            // and append it  
            myCells = (Cell[]) append(myCells, newCell);
          }
        }
      }
    }
  }
}

// ================================= break

class Cell {
  PVector location= new PVector(); //creating vectors
  PVector velocity=new PVector();
  float dia;
  boolean isseed;
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
    //  new PVector(random(750), random(750));
    dia = 8;
  }

 


  void display() {

    if (isseed==true) {  //if seed (neutron)

      fill(0, 255, 255);  //blue neutrons

      velocity = new PVector(randomx, randomy); //gives neutrons random movement direction
      location.add(velocity); //add velocity to current location
    }
    if (isseed==false) {  //if false = atom, stay white
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

void keyPressed() { //when 'e' is pressed the dxf is saved and is not updated
  if (key=='e') {
    endRaw();
  }
}



