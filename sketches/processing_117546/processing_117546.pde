
import processing.dxf.*;

Cell[]myCells = new Cell[2000];

Cell myCell;
PVector[] cONEL; // cONEL = center of the nearest existing line


void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(60);
  background(0);
  size (400, 400);
  beginRaw(DXF, "2Dtriangles.dxf");
  for (int i = 0; i< myCells.length; i++) {
    myCells[i]= new Cell();

    if ( i < 1 ) { //( i < 4 ){ would have three starting seeds
      myCells[i].isseed = true;
    }
    cONEL = new PVector[myCells.length]; // cONEL= center of  nearest exsisting line
  }
}

void draw() {

  for (int i=0; i< myCells.length; i++) {//declare for loop,
    //  myCells[i].display(); by taking out this disply function you do not draw the cells
    myCells[i].update();
  }
  if (frameCount == 800) {
    endRaw();
    println("endRaw");
  }

  for (int i = 0; i<myCells.length; i++) {
    if (myCells[i].isseed == false) { //  ignore if cell[i] is true
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) { //assuming the cell [i] is not a seed, the loop then looks through the myCell array again for seeds.
          float d;
          d= PVector.dist(myCells[i].location, myCells[j].location);//distance function between the non-seed[i] and seed[j]
          
          if (d<10) {
            myCells[i].isseed = true; 
            strokeWeight(1);
            line(myCells[i].location.x, myCells[i].location.y, 
            myCells[j].location.x, myCells[j].location.y ); // draws a line from the center of the cell

            if (cONEL[j] == null) { // if no pervious line then nothing happens
            } 
            else {
              line(myCells[i].location.x, myCells[i].location.y, 
              cONEL[j].x, cONEL[j].y); // else - draw line between the two points
            
               cONEL[i] = new PVector((myCells[i].location.x+myCells[j].location.x)/2, 
               (myCells[i].location.y+myCells[j].location.y)/2);
               // draws  a new line from the new seed to the center of the nearest exsisting line. 
               println(frameCount); // export countdown
            }
          }
        }
      }
    }
  }
}






class Cell {

  PVector location = new PVector(200, 200);
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellHue, cellSat, cellBri, cellAlph;
  float lineweight;
  float v = 1;
  float v2 = 1;
  float v3 = 1;//different velocities for each axis, also i thought maybe it was JavaScripts random function that wasn't working as i kept getting diagonal lines... 

  Cell() {
    location = new PVector(random(400), random(400));
    dia = 5;
    isseed=false;
    cellHue = 360;
    cellSat = 1;
    cellBri = 100;
    cellAlph = 100;
    lineweight = 1;
  }
  
  void display() {
    if (isseed == true) {
    }
    if (isseed == false) {

    }
  }


  void update() {
    cellSat = cellSat +1;
    if (cellSat >= 100) {
      cellSat = 1;
    }

    strokeWeight(lineweight);
    stroke(cellHue, cellSat, cellBri, cellAlph);

    if (isseed == false) {
      velocity = new PVector(random(-v, v), random(-v2, v2)); 
      location.add(velocity);
    }
  }
}



