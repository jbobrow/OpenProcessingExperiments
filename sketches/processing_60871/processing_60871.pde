
////////////////////////////////////////////////////////////////////////////////////////////////////////////
// CLASS: AGENT.....................................................................///////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////

class Flocker {

  /////// GLOBAL VARIABLES //////
  // To store position
  PVector Floc = new PVector (random(width*.25, width*.75), random(height*.25, height*.75), random(depth*.25, depth*.75));
  //To store velocity
  PVector Fvel = new PVector(random(-speedLimit, speedLimit), random(-speedLimit, speedLimit), random(-speedLimit, speedLimit));
  // To store the acceleration, responsable for the steering behaviour
  PVector Facc = new PVector (0, 0, 0);
  //to designate the arrays
  int lastCell, newCell; 
  //To designate the agent's lifetime
  int Fage;
  //To designate the agent's size
  float Fsize=minFsize*1.1;
  
  float sDecrease;


  //////////////////////////////////////////////////////////////////////////////////////////////////////
  ////// CONSTRUCTOR -----------------------------------------------------------///////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  Flocker(
  // Position
  PVector _Floc
    ) 
  {
    // Push variables to local
    Floc = _Floc;

    //Find the cell containing the Flocker
    int XCell = floor(Floc.x/gridSize);
    int YCell = floor(Floc.y/gridSize);
    int ZCell = floor(Floc.z/gridSize);
    //Check the range and correct it if necessary
    if (XCell > Rows) XCell = Rows;
    if (YCell > Cols) YCell = Cols;
    if (ZCell > Stacks) ZCell = Stacks;
    if (XCell < 1) XCell = 0;
    if (YCell < 1) YCell = 0;
    if (ZCell < 1) ZCell = 0;
    //Enumerate the corresponding cell
    lastCell = (XCell + (YCell*Rows) + (ZCell*Cols*Rows));
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////
  ////// FUNCTIONS ------------------------------------------------------------------//////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////
  // RUN:calls what the flocker will do /////////////////////////////////////////////

  void run() {
    if (random(100)<50) flockIt(); // Move the object with local awarenes
    updatePos(); // Keep the Flocker on the working area
    display(); // Draw the Flocker
    updateCell();
    Age();
    Grow();
    Shrink();
//    print(Fsize + " ");
  }


  ////////////////////////////////////////////////////////////////////////////////////
  // GROW: under defined conditions, the agent increases its size ///////////////////
  void Grow() {
    if (Fsize < maxFsize && Fage < maxAge/2) {
      Fsize = map(10*log(Fage/10), 0, (10*log(maxAge/10)), 0, maxFsize);
    }
    if (Fsize > maxFsize) Fsize = maxFsize;
  }

  ////////////////////////////////////////////////////////////////////////////////////
  // SHRINK: as the agent's life consumes, it decreases its size ////////////////////
  void Shrink() {
    if (Fsize > minFsize && Fage > maxAge/2) {
      sDecrease=sDecrease+ (maxFsize / maxAge/4);
      print(sDecrease + " ");
      Fsize = Fsize-sDecrease;
    }
    if (Fsize < minFsize) Fsize = minFsize;
  }

  ////////////////////////////////////////////////////////////////////////////////////
  // AGE: The longest algorithm /////////////////////////////////////////////////////
  void Age() {
    Fage=Fage+int(random(2));
  }


  ////////////////////////////////////////////////////////////////////////////////////
  // UPDATECELL : Calculate and update which cell the agent is into /////////////////

  void updateCell() {
    // Check the location and calculate the corresponding grid  space
    //  Find the cell containing the Flocker
    int XCell = floor(Floc.x/gridSize);
    int YCell = floor(Floc.y/gridSize);
    int ZCell = floor(Floc.z/gridSize);
    // Check the range and correct it if necessary
    if (XCell > Rows) XCell = Rows;
    if (YCell > Cols) YCell = Cols;
    if (ZCell > Stacks) ZCell = Stacks;
    if (XCell < 1) XCell = 0;
    if (YCell < 1) YCell = 0;
    if (ZCell < 1) ZCell = 0;
    //  Enumerate the corresponding cell
    newCell = (XCell + (YCell*Rows) + (ZCell*Cols*Rows));
    if (newCell < 1) newCell = 1;
    if (newCell >= Cells) newCell = Cells-1;

    // Check if there has been a change in the grid cell allocation
    if (newCell != lastCell) {
      // Remove the agent from current list and add to new list
      int index = FlockersCollection[lastCell].indexOf(this);
      FlockersCollection[lastCell].remove(index);
      FlockersCollection[newCell].add(this);

      //update lastCell value
      lastCell = newCell;
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////
  ///////// FLOCK: Moves the agent around ///////////////////////////////////////////

  void flockIt() {

    for (int j = 0; j < FlockersCollection[newCell].size(); j++) {
      Flocker F = (Flocker) FlockersCollection[newCell].get(j);

      float FlockerDist = PVector.dist(Floc, F.Floc);

      if (FlockerDist > 0) {
        if (FlockerDist < minDist) {

          if (FlockerDist < align*multiplier) {
            PVector addVec = F.Fvel.get();
            addVec.mult(FlockerDist);
            Facc.add(addVec);
            Facc.normalize();
          }

          if (FlockerDist < avoid*multiplier) {
            PVector addVec = F.Floc.get();
            addVec.mult(2);
            addVec.sub(Floc);
            addVec.mult(FlockerDist);
            Facc.sub(addVec);
            Facc.normalize();
          }

          if (FlockerDist < cohesion*multiplier) {
            PVector addVec = F.Floc.get();
            addVec.add(Floc);
            addVec.mult(1/FlockerDist);
            Facc.add(addVec);
            Facc.normalize();
          }
        }
      }
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////
  ////// UPDATEPOS: Updates the location of the Flocker and kepps it in range ///////

  void updatePos() {

    //Produce the steering behaviour, responsable for the dampened changes
    Fvel.add(Facc);

    //Limit the speed with graphic purposes
    Fvel.limit(speedLimit);
    velocity = Fvel;
    Fvel.mult(noise(noiseScale));
    Floc.add(Fvel);

    //if the X coord is out of the boundary, move it to the other boundary
    if (Floc.x > width) { 
      Floc.x = 0;
    } 
    if (Floc.x < 0) {
      Floc.x = width;
    }

    //if the Y coord is out of the boundary, move it to the other boundary
    if (Floc.y > height) { 
      Floc.y = 0;
    } 
    if (Floc.y < 0) {
      Floc.y = height;
    }

    //if the Z coord is out of the boundary, move it to the other boundary
    if (Floc.z > depth) { 
      Floc.z = 0;
    } 
    if (Floc.z < 0) {
      Floc.z = depth;
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////
  ////// DISPLAY: renders the shape to the Flocker //////////////////////////////////

  void display() {
    //Use the current position to map zones by colours
    color Col = color(int(map(velocity.x, 0, speedLimit, 70, 25)), int(map(velocity.y, 0, speedLimit, 150, 200)), int(map(velocity.z, 0, speedLimit, 200, 240)));
    //Draw a point
    strokeWeight(Fsize/2);
    point(Floc.x, Floc.y, Floc.z);
    PVector end = new PVector(Floc.x, Floc.y, Floc.z);
    velocity.mult(2*Fsize);
    end.sub(velocity);
    //Draw a line which represents the direction of the Flocker
    strokeWeight(1);
    line(Floc.x, Floc.y, Floc.z, end.x, end.y, end.z);
    pushMatrix();
    noFill();
    translate (Floc.x, Floc.y, Floc.z);
    stroke(Col,100);
    ellipse(0,0,multiplier*align*Fsize/2,multiplier*align*Fsize/2);
    stroke(Col,200);
    ellipse(0,0,multiplier*cohesion*Fsize/2,multiplier*cohesion*Fsize/2);
    stroke(Col,255);
    ellipse(0,0,multiplier*avoid*Fsize/2,multiplier*avoid*Fsize/2);
    popMatrix(); 
  }
}


