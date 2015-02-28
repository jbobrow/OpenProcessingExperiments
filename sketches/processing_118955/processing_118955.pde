
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/64663*@* -- SquaredDistancePointToLineSegment */

import processing.dxf.*;
PShape tri; // frame "shape" name

float q = 35; //VALUE FOR "d<Q" -------------------------------
int dToTri = 1; 

Cell[]myCells = new Cell[700];// array of cells
Cell myCell;

PVector cONEL[];
PVector c1;
PVector c2;
PVector c3;
ArrayList<PVector> locationsOfStuckCells = new ArrayList<PVector>();// new location list of the stuck cells positions



void setup() {
  colorMode(HSB, 360, 100, 100, 100); // colour mode
  smooth();
  frameRate(60);
  background(0);
  size (400, 400, P3D);
  beginRaw(DXF, "3Dsticktotriangle.dxf"); // dxf file name

  int seedW = 200;// with of triangle
  int seedH = 200;//height of triangle (only necessary for this perticular shape)

  c1 = new PVector((width/2)-(seedW/2), (height/2) - (seedH/2), 0); // defines the points of the shape
  c2 = new PVector((width/2)+(seedW/2), (height/2) - (seedH/2), 0);
  c3 = new PVector((width/2), (height/2) + (seedH/2), 0);

  tri = createShape();// create triangle frame
  tri.beginShape();
  tri.noFill();
  strokeWeight(0.5);
  tri.stroke(155);
  tri.vertex(c1.x, c1.y, 0); // c1 point of the shape
  tri.vertex(c2.x, c2.y, 0);
  tri.vertex(c3.x, c3.y, 0);
  tri.endShape(CLOSE);




  for (int i = 0; i< myCells.length; i++) {
    myCells[i]= new Cell();

    if ( i < 0 ) { //( i < 4 ){ would have three starting seeds
      myCells[i].isseed = true;
    }
    cONEL = new PVector[myCells.length];
  }
}
//------------------------------------------------------------------------------------------
/*http://www.openprocessing.org/sketch/64663
 calculate the squared distance of a point P to a line segment A-B
 and return the nearest line point S
 
 G.F.R.S ADDED Z AXIS*/
float SquaredDistancePointToLineSegment(PVector A, PVector B, PVector P, PVector S)
{
  float vx = P.x-A.x, vy = P.y-A.y, vz = P.z-A.z;   // v = A->P TOP OF LINE TO POINT X and Y AND Z
  float ux = B.x-A.x, uy = B.y-A.y, uz = B.z-A.z;   // u = A->B TOP OF LINE TO BOTTOM x AND Y AND Z
  float det = vx*ux + vy*uy + vz*uz;

  if (det <= 0)
  { // its outside the line segment near A
    S.set(A);
    return vx*vx + vy*vy +vz+vz;
  }
  float len = ux*ux + uy*uy + uz*uz;    // len = u^2
  if (det >= len)
  { // its outside the line segment near B
    S.set(B);
    return sq(B.x-P.x) + sq(B.y-P.y) + sq(B.z-P.z);
  }
  // its near line segment between A and B
  float ex = ux / sqrt(len);    // e = u / |u^2|
  float ey = uy / sqrt(len);
  float ez = uz / sqrt(len);
  float f = ex * vx + ey * vy + ez * vz;  // f = e . v
  S.x = A.x + f * ex;           // S = A + f * e
  S.y = A.y + f * ey;
  S.z = A.z + f * ez;

  return sq(ux*vy-uy*vx) / len;    // (u X v)^2 / len  - ALLOWS US TO USE THE SHORTEST DISTANCE VALUE
}
//------------------------------------------------------------------------------------------


boolean shouldStop(Cell c, PVector newLoc) { // should the cell Stop? (cell value, and new location (on line))
  PVector cellLoc = new PVector(c.location.x, c.location.y, c.location.z); // the location of the cell - the cells x,y and z coordinates
  float D = SquaredDistancePointToLineSegment(c1, c2, cellLoc, newLoc); //distance "D" is shortest distance between (vertex c1,c2 and cell location)
  if (D < dToTri) {
    println("#");
    locationsOfStuckCells.add(newLoc);
    return true;
  }
  D = SquaredDistancePointToLineSegment(c1, c3, cellLoc, newLoc); //vertex c1,c3
  if (D < dToTri) {
    println("##");
    locationsOfStuckCells.add(newLoc); // if the cell is less than 10 then it sticks and its location is added to the list
    return true;
  }
  D = SquaredDistancePointToLineSegment(c3, c2, cellLoc, newLoc);//vertex c3,c2
  if (D < dToTri) {
    println("###");
    locationsOfStuckCells.add(newLoc);
    return true;
  }
  //  if (locationsOfStuckCells.size() > 0) {
  //    for (PVector r : locationsOfStuckCells) { 
  //      if (PVector.dist(r, cellLoc) < q) { // if the distance between is <10 add Pvector to list
  //        locationsOfStuckCells.add(cellLoc);
  //        return true;
  //      }
  //    }
  //  }
  return false; // else return false
}

void draw() {

//  background(0);
  shape(tri);
  println(frameCount); // export countdown
  for (int i=0; i< myCells.length; i++) {//declare for loop,
    myCells[i].update();
    myCells[i].display();
  }


  PVector newLoc = new PVector();// creates newLoc PVector

    for (int i = 0; i<myCells.length; i++) {


    if (myCells[i].isseed == false) { //  ignore if cell[i] is true
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) { //assuming the cell [i] is not a seed, the loop then looks through the myCell array again for seeds.
          float d;
          d= PVector.dist(myCells[i].location, myCells[j].location);//distance function between the non-seed[i] and seed[j]
          if (d<q) {
            println(">>>>>"+d);
            myCells[i].isseed = true; // stick if less than d

            strokeWeight(1);
            stroke(255);
            cONEL[i] = new PVector((myCells[i].location.x+myCells[j].location.x), 

            (myCells[i].location.y+myCells[j].location.y), (myCells[i].location.z+myCells[j].location.z)); // set value representing centre of line drawn between 'seed' and 

            if (cONEL[j] != null) {
//              line(myCells[i].location.x, myCells[i].location.y, myCells[i].location.z, 
//              cONEL[j].x, cONEL[j].y, cONEL[j].z); // draws a line from the center of the last line drawn to the already-connecte4d cell
            }
            line(myCells[i].location.x, myCells[i].location.y, myCells[i].location.z, 
            myCells[j].location.x, myCells[j].location.y, myCells[j].location.z ); // draws a line from the center of the cell
          }
        }
      }
      if (myCells[i].canMove && shouldStop(myCells[i], newLoc)) {
        myCells[i].canMove = false; //stuck
        myCells[i].location = new PVector(newLoc.x, newLoc.y, newLoc.z); //new location
        myCells[i].isseed = true; // becomes a seed
      }
    }
  }
}
void keyPressed() {
  endRaw();
  println("endRaw");
}

class Cell {
  boolean canMove;
  PVector location = new PVector(200, 200, 200);
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellHue, cellSat, cellBri, cellAlph;
  float lineweight;
  float v = 5;
  float v2 = 5;
  float v3 = 5;

  //different velocities for each axis, also i thought maybe it was JavaScripts random function that wasn't working as i kept getting diagonal lines...

  Cell() {
    location = new PVector(random(100, 300), random(100, 300), random(100, 300));
    dia = 5;
    isseed=false;
    cellHue = 360;
    cellSat = 1;
    cellBri = 100;
    cellAlph = 100;
    lineweight = 1;
    canMove = true;
  }
  void display() {
    if (isseed == true) {
      noStroke();
      fill(360, 100, 100, 100);
    }
    if (isseed == false) {
      strokeWeight(lineweight);
      stroke(cellHue, cellSat, cellBri, cellAlph);
    }
//    ellipse(location.x, location.y, dia, dia);
  }


  boolean newPositionIsGood(float pos, float delta) {
    return (pos >= 300 || pos <= 100 ||
      (pos + delta < 300 &&
      pos + delta > 100));
  }

  void update() {
    cellSat = cellSat +1;
    if (cellSat >= 100) {
      cellSat = 1;
    }

    stroke(255);
    fill(cellHue, cellSat, cellBri, 80);
    if (isseed == false && canMove == true) {

      velocity = new PVector(random(-v, v), random(-v2, v2), random(-v3, v3));
      if (newPositionIsGood(location.x, velocity.x) &&
        newPositionIsGood(location.y, velocity.y) 
        ) {
        location.add(velocity);
      }
    }
  }
}



