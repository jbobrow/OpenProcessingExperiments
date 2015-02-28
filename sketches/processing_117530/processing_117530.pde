
import processing.dxf.*;

Cell[]myCells = new Cell[2000];

Cell myCell;



void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(60);
  background(0);
  size (400, 400, P3D);
  beginRaw(DXF, "3Dcrazy.dxf");
  for (int i = 0; i< myCells.length; i++) {//creates
    myCells[i]= new Cell();

    if ( i < 4 ) { //( i < 4 ){ would have three starting seeds
      myCells[i].isseed = true;
    }
  }
}

void draw() {

  for (int i=0; i< myCells.length; i++) {//declare for loop,
    //  myCells[i].display(); by taking out this disply function you do not draw the cells, just the lines drawn between each cell center
    myCells[i].update();
  }
  if (frameCount == 1200){
   endRaw();
   println("endRaw");
  }
     
  for (int i = 0; i<myCells.length; i++) {
    if (myCells[i].isseed == false) { //  ignore if cell[i] is true
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) { //assuming the cell [i] is not a seed, the loop then looks through the myCell array again for seeds.
          float d;
          d= PVector.dist(myCells[i].location, myCells[j].location);//distance function between the non-seed[j] and seed[i]
          if (d<20) {
            myCells[i].isseed = true; 
            for (int k = 0; k<10; k++){
            strokeWeight(0.5);
            line(myCells[i].location.x, myCells[i].location.y, myCells[i].location.z, myCells[j].location.x, myCells[j].location.y, myCells[j].location.z ); // draws a line from the center of the cell
            println(frameCount);
            }
          }
        }
      }
    }//diagramatic drawings of the site... how could we use this?
  }
}

 



class Cell {

  PVector location = new PVector(200, 200, 200);
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellHue, cellSat, cellBri, cellAlph;
  float lineweight;
  float v = 1;
  float v2 = 1;
  float v3 = 3;//different velocities for each axis

  Cell() {
    location = new PVector(random(400), random(400), random(400));
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
    line(location.x, location.y, location.z, location.x, location.y , location.z );
    
  //ellipse (location.x, location.y, dia, dia);
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
      velocity = new PVector(random(-v, v), random(-v2, v2), random(-v3,v3)); 
      location.add(velocity);
      
    }
  }
}



