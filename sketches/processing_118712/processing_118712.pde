
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/64663*@* -- SquaredDistancePointToLineSegment */

import processing.dxf.*;
PShape tri; // frame "shape" name

Cell[]myCells = new Cell[200];// array of cells
Cell myCell;

PVector cONEL[];// conel array - one for each line 
PVector c1;
PVector c2;
PVector c3;
ArrayList<PVector> locationsOfStuckCells = new ArrayList<PVector>();// new location list of the stuck cells positions



void setup() {
  colorMode(HSB, 360, 100, 100, 100); // colour mode

  frameRate(60);
  background(0);
  size (400, 400, P3D);
  beginRaw(DXF, "3Dsticktotriangle.dxf"); // dxf file name

  int seedW = 200;// with of triangle
  int seedH = 200;//height of triangle (only necessary for this perticular shape)

  tri = createShape();// create triangle frame 
  tri.beginShape();
  tri.noFill();
  strokeWeight(0.5);
  tri.stroke(155);
  tri.vertex((width/2)-(seedW/2), (height/2) - (seedH/2), 0); // c1 point of the shape
  tri.vertex((width/2)+(seedW/2), (height/2) - (seedH/2), 0);
  tri.vertex((width/2), (height/2) + (seedH/2), 0);
  tri.endShape(CLOSE);

  c1 = new PVector((width/2)-(seedW/2), (height/2) - (seedH/2), 0); // defines the points of the shape
  c2 = new PVector((width/2)+(seedW/2), (height/2) - (seedH/2), 0);
  c3 = new PVector((width/2), (height/2) + (seedH/2), 0);



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
  if (D < 10) {
    println("#"); 
    locationsOfStuckCells.add(newLoc);
    return true;
  }
  D = SquaredDistancePointToLineSegment(c1, c3, cellLoc, newLoc); //vertex c1,c3
  if (D < 10) {
    println("##");
    locationsOfStuckCells.add(newLoc); // if the cell is less than 10 then it sticks and its location is added to the list
    return true;
  }
  D = SquaredDistancePointToLineSegment(c3, c2, cellLoc, newLoc);//vertex c3,c2
  if (D < 10) {
    println("###");
    locationsOfStuckCells.add(newLoc);
    return true;
  }
  if (locationsOfStuckCells.size() > 0) { 
    for (PVector r : locationsOfStuckCells) {  
      if (PVector.dist(r, cellLoc) < 10) { // if the distance between is <10 add Pvector to list
        locationsOfStuckCells.add(cellLoc);
        return true;
      }
    }
  }
  return false; // else return false 
}

void draw() {

  background(0);
  shape(tri);
  println(frameCount); // export countdown
  for (int i=0; i< myCells.length; i++) {//declare for loop,
    myCells[i].update();
    myCells[i].display();
  }


  PVector newLoc = new PVector();// creates newLoc PVector 

    for (int i = 0; i<myCells.length; i++) {

    if (myCells[i].canMove && shouldStop(myCells[i], newLoc)) { 
      myCells[i].canMove = false; //stuck
      myCells[i].location = new PVector(newLoc.x, newLoc.y, newLoc.z); //new location 
      myCells[i].isseed = true; // becomes a seed
    }

    if (myCells[i].isseed == false) { //  ignore if cell[i] is true
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) { //assuming the cell [i] is not a seed, the loop then looks through the myCell array again for seeds.
          float d;
          d= PVector.dist(myCells[i].location, myCells[j].location);//distance function between the non-seed[i] and seed[j]
          if (d<15) {
            myCells[i].isseed = true; // stick if less than d


            //            strokeWeight(1);
            //            line(myCells[i].location.x, myCells[i].location.y, myCells[i].location.z,
            //            myCells[j].location.x, myCells[j].location.y, myCells[j].location.z ); // draws a line from the center of the cell
            // 
            //            if (cONEL[j] == null) { // if no pervious line then nothing happens
            //            }
            //            else {
            //              line(myCells[i].location.x, myCells[i].location.y,
            //              myCells[i].location.z, cONEL[j].x, cONEL[j].y, cONEL[j].z); // else - draw line between the two points

            //               cONEL[i] = new PVector((myCells[i].location.x+myCells[j].location.x)/2,
            //               (myCells[i].location.y+myCells[j].location.y)/2, (myCells[i].location.z+myCells[j].location.z)/2);
          }
        }
      }
    }
  }
}
void keyPressed() {
  endRaw();
  println("endRaw");
}
//
//}

  
  
  class Cell {
  boolean canMove;
  PVector location = new PVector(200, 200, 200);
  
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellHue, cellSat, cellBri, cellAlph;
  float lineweight;
  float v = 1;
  float v2 = 1;
  float v3 = 1;//different velocities for each axis, also i thought maybe it was JavaScripts random function that wasn't working as i kept getting diagonal lines...
 
    Cell() {
    location = new PVector(random(400), random(400), random(400));
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
     fill(360,100,100,100);

    }
    if (isseed == false) {
    strokeWeight(lineweight);
    stroke(cellHue, cellSat, cellBri, cellAlph);
    }
 ellipse(location.x, location.y, dia, dia);
  }

  void update() {
    cellSat = cellSat +1;
    if (cellSat >= 100) {
      cellSat = 1;
    }
 
    if(isseed == false && canMove == true) {
     stroke(255);
     fill(cellHue,cellSat,cellBri, 80);
      velocity = new PVector(random(-v, v), random(-v2, v2), random(-v3, v3));
      location.add(velocity);
    }
   }
  }




