
import processing.dxf.*;
PShape tri;

Cell[]myCells = new Cell[200];

Cell myCell;
PVector cONEL[];// conel array
PVector c1;
PVector c2;
PVector c3;
ArrayList<PVector> locationsOfStuckCells = new ArrayList<PVector>();



void setup() {
  colorMode(HSB, 360, 100, 100, 100);

  frameRate(60);
  background(0);
  size (400, 400, P3D);
  beginRaw(DXF, "3Dtriangles.dxf");
  int seedW = 200;// with of triangle
  int seedH = 200;//height of triangle
  c1 = new PVector((width/2)-(seedW/2), (height/2) - (seedH/2));
  c2 = new PVector((width/2)+(seedW/2), (height/2) - (seedH/2));
  c3 = new PVector((width/2), (height/2) + (seedH/2));

  tri = createShape();// create triangle frame
  tri.beginShape();
  tri.noFill();
  tri.stroke(155);
  tri.vertex((width/2)-(seedW/2), (height/2) - (seedH/2));
  tri.vertex((width/2)+(seedW/2), (height/2) - (seedH/2));
  tri.vertex((width/2), (height/2) + (seedH/2));
  tri.endShape(CLOSE);

  for (int i = 0; i< myCells.length; i++) {
    myCells[i]= new Cell();

    if ( i < 0 ) { //( i < 4 ){ would have three starting seeds
      myCells[i].isseed = true;
    }
    cONEL = new PVector[myCells.length];
  }
}
// calculate the squared distance of a point P to a line segment A-B
// and return the nearest line point S
float SquaredDistancePointToLineSegment(PVector A, PVector B, PVector P, PVector S)
{
  float vx = P.x-A.x, vy = P.y-A.y;   // v = A->P
  float ux = B.x-A.x, uy = B.y-A.y;   // u = A->B
  float det = vx*ux + vy*uy;

  if (det <= 0)
  { // its outside the line segment near A
    S.set(A);
    return vx*vx + vy*vy;
  }
  float len = ux*ux + uy*uy;    // len = u^2
  if (det >= len)
  { // its outside the line segment near B
    S.set(B);
    return sq(B.x-P.x) + sq(B.y-P.y);
  }
  // its near line segment between A and B
  float ex = ux / sqrt(len);    // e = u / |u^2|
  float ey = uy / sqrt(len);
  float f = ex * vx + ey * vy;  // f = e . v
  S.x = A.x + f * ex;           // S = A + f * e
  S.y = A.y + f * ey;

  return sq(ux*vy-uy*vx) / len;    // (u X v)^2 / len
}


boolean shouldStop(Cell c, PVector newLoc) {
  PVector cellLoc = new PVector(c.location.x, c.location.y);
  float d = SquaredDistancePointToLineSegment(c1, c2, cellLoc, newLoc);
  if (d < 10) {
    println("##"); 
    locationsOfStuckCells.add(newLoc);
    return true;
  }
  d = SquaredDistancePointToLineSegment(c1, c3, cellLoc, newLoc);
  if (d < 10) {
    println("##");
    locationsOfStuckCells.add(newLoc);
    return true;
  }
  d = SquaredDistancePointToLineSegment(c3, c2, cellLoc, newLoc);
  if (d < 10) {
    println("##");
    locationsOfStuckCells.add(newLoc);
    return true;
  }
  if (locationsOfStuckCells.size() > 0) {
    for (PVector r : locationsOfStuckCells) {
      if (PVector.dist(r, cellLoc) < 0.5) {
        locationsOfStuckCells.add(cellLoc);
        return true;
      }
    }
  }
  return false;
}

void draw() {
  shape(tri);
  background(0);
  println(frameCount); // export countdown
  for (int i=0; i< myCells.length; i++) {//declare for loop,
    //  myCells[i].display(); by taking out this disply function you do not draw the cells
    myCells[i].update();
    myCells[i].display();
  }
  if (frameCount == 600) {
    endRaw();
    println("endRaw");
  }

  PVector newLoc = new PVector();// new PVector when dealing with shouldStop and canMove

  for (int i = 0; i<myCells.length; i++) {

    if (myCells[i].canMove && shouldStop(myCells[i], newLoc)) {
      myCells[i].canMove = false; 
      myCells[i].location = new PVector(newLoc.x, newLoc.y, myCells[i].location.z);
    }

    if (myCells[i].isseed == false) { //  ignore if cell[i] is true
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) { //assuming the cell [i] is not a seed, the loop then looks through the myCell array again for seeds.
          float d;
          d= PVector.dist(myCells[i].location, myCells[j].location);//distance function between the non-seed[i] and seed[j]

          if (d<25) {
            myCells[i].isseed = true;


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
     fill(360,100,100,100);

    }
    if (isseed == false) {
     

    }
    
  
  ellipse(location.x, location.y, dia, dia);

  }
 
 
  void update() {
    cellSat = cellSat +1;
    if (cellSat >= 100) {
      cellSat = 1;
    }
 
    strokeWeight(lineweight);
    stroke(cellHue, cellSat, cellBri, cellAlph);
 
    if(isseed == false && canMove == true) {
     stroke(255);
     fill(cellHue,cellSat,cellBri, 80);
      velocity = new PVector(random(-v, v), random(-v2, v2), random(-v3, v3));
      location.add(velocity);
    }
   }
  }




