

// tab for cubes / boxes

void paintCubes () {
  // we are looping through the ArrayList
  for (int i = 0; i <  boxes.size(); i++) { 
    // An ArrayList
    Box box1 = boxes.get(i);
    box1.display();
  } // for
  //
  // we are looping through the ArrayList
  for (int i = 0; i <  boxes.size(); i++) { 
    // An ArrayList
    Box box1 = boxes.get(i);  
    box1.showPathsAsWhiteLines ();
  } // for
} // func 

// class

class Box {  
  //  cube Of Marble Track
  float x, y, z ; 
  // float w,h,d ; 
  color colBox;
  ArrayList<Path> paths  = new ArrayList();  
  int intRotateCubeXTimes=0; 

  // constructor
  Box (float x1, float y1, float z1) {
    x=x1*cubeSize;
    y=500-(y1*cubeSize);
    z=z1*cubeSize;
    colBox = color (2, 0, 255, 200);
  }  // constructor

  // Box display: 
  void display () {  
    pushMatrix(); 
    translate(x, y, z);  
    fill (colBox);  
    stroke(2, 2, 220);
    if (testingForDebugging) {
      // fill (colBox);
      stroke (colBox);
      noFill();
    }
    box(50);
    popMatrix();
    // 
    if (testingForDebugging) {
      testShowPathsAsWhiteLines ();
    }
    // showPathsAsWhiteLines ();
  } // method 

  boolean hasInside ( classMarble myMarble ) {
    if (myMarble.marbleX>x-cubeSize / 2     &&  myMarble.marbleX<x+cubeSize/2) {
      if (myMarble.marbleY>y-cubeSize / 2   &&  myMarble.marbleY<y+cubeSize/2) {     
        if (myMarble.marbleZ>z-cubeSize / 2 &&  myMarble.marbleZ<z+cubeSize/2) { 
          return true;
        } // if
      } // if
    } // if 
    return false;
  } // method

  boolean hasOnTop ( classMarble myMarble ) {
    if (myMarble.marbleX>x-cubeSize / 2     &&  myMarble.marbleX<x+cubeSize/2) {
      if (myMarble.marbleY>y-cubeSize       &&  myMarble.marbleY<y+cubeSize/2) {     
        if (myMarble.marbleZ>z-cubeSize / 2 &&  myMarble.marbleZ<z+cubeSize/2) { 
          return true;
        } // if
      } // if
    } // if 
    return false;
  } // method

  PVector getEntryPos (int thisEntryPoint) {
    // 
    // check all paths within this cube. 
    for (Path currentPath : paths) {
      if (currentPath.entryPoint == thisEntryPoint) {
        return currentPath.entryPointPos;
      } // if
    } // for 
    // not found 
    PVector pv = new PVector(-1, -1, -1);
    return pv;
  } // method 

  Path getPath (int thisEntryPoint) {
    // 
    // check all paths within this cube. 
    for (Path currentPath : paths) {
      if (currentPath.entryPoint == thisEntryPoint) {
        return currentPath;
      } // if
    } // for 
    // not found 
    return null;
  } // method 

  PVector getExitPos (int thisEntryPoint) {
    // 
    // check all paths within this cube. 
    for (Path currentPath : paths) {
      if (currentPath.entryPoint == thisEntryPoint) {
        return currentPath.exitPointPos;
      } // if
    } // for 
    // not found 
    println("not found in getExitPos ===============================; thisEntryPoint: " 
      + thisEntryPoint);
    PVector pv = new PVector(-1, -1, -1);
    return pv;
  } // method 

  // -----------------------------------------------------------------

  void rotateCubeSaveXTimes ( int rotateXTimes_ ) {
    // just save the var
    intRotateCubeXTimes = rotateXTimes_;
  } // method 

  void rotateCubeXTimes () {

    // with rotateXTimes = 0 don't rotate 
    // with rotateXTimes = 1 rotate 90° around Y clockwise
    // with rotateXTimes = 2 rotate 180° around Y clockwise
    // with rotateXTimes = 3 rotate 270° around Y clockwise     

    if ( intRotateCubeXTimes<0 || intRotateCubeXTimes>3 ) {
      println ("rotateXTimes too small / big (tab classBox): " 
        + intRotateCubeXTimes);
      exit();
    } // if

    for (int i = 0; i < intRotateCubeXTimes; i++) {
      for (Path currentPath : paths) {
        currentPath.entryPoint = rotateEntryOrExitPoint(currentPath.entryPoint);
        currentPath.exitPoint  = rotateEntryOrExitPoint(currentPath.exitPoint);
      } // for
    } // for

    for (Path currentPath : paths) {
      currentPath.furtherInitsPath(this);
    } // for
  } // method 

  int rotateEntryOrExitPoint ( int entryOrExitPointType ) {
    // rotates one entry (or exit) point around the cube by 90° clockwise
    int Buffer = undefined; 

    switch (entryOrExitPointType) {
    case topNorth:
      Buffer =  topEast;
      break; 
    case topSouth:
      Buffer =  topWest;      
      break; 
    case topWest:
      Buffer =  topNorth;      
      break; 
    case topEast:
      Buffer =  topSouth;      
      break; 
      //
    case tunnelTopCenter:  // different tunnel types
      Buffer =  tunnelTopCenter;  // same 
      break; 
      //
    case tunnelNorthBottom:
      Buffer = tunnelEastBottom;  // 
      break;
    case tunnelSouthBottom:
      Buffer = tunnelWestBottom;  // 
      break;
    case tunnelWestBottom:
      Buffer = tunnelNorthBottom;  //     
      break;   
    case tunnelEastBottom:
      Buffer = tunnelSouthBottom;  //     
      break;         
      //
    case tunnelWestMiddle:
      Buffer = tunnelNorthMiddle;  // 
      break; 
    case tunnelEastMiddle:
      Buffer = tunnelSouthMiddle;  // 
      break; 
    case tunnelNorthMiddle:
      Buffer = tunnelEastMiddle;  //       
      break; 
    case tunnelSouthMiddle:
      Buffer = tunnelWestMiddle;  //       
      break; 
      //      
    case undefined:
      Buffer =  undefined;      
      break; 
      //    
    default:
      println ("unknown entryOrExitPointType in rotateEntryOrExitPoint / tab classBox; entryOrExitPointType was :" 
        + entryOrExitPointType);
      println ( "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" );
      exit(); 
      break;
    } // switch 
    return Buffer;
  } // method

  void testShowPathsAsWhiteLines () {
    // for tests:
    // show all paths within this cube. 
    for (Path currentPath : paths) {
      strokeWeight(2);
      stroke(255);
      line( 
      currentPath.entryPointPos.x, currentPath.entryPointPos.y, currentPath.entryPointPos.z, 
      currentPath.exitPointPos.x, currentPath.exitPointPos.y, currentPath.exitPointPos.z);
      strokeWeight(1);
    } // for
  } // method 

  void showPathsAsWhiteLines () {
    // show all paths within this cube. 
    for (Path currentPath : paths) {
      strokeWeight(5);
      stroke(255);
      MyBox( 
      currentPath.entryPointPos.x, currentPath.entryPointPos.y, currentPath.entryPointPos.z, 
      currentPath.exitPointPos.x, currentPath.exitPointPos.y, currentPath.exitPointPos.z, 
      4, 
      color(255, 255, 255, 255));
      strokeWeight(1);
    } // for
  } // method 

  // -------------------------------

  void MyBox(
  float x1, float y1, float z1, 
  float x2, float y2, float z2, 
  float weight, 
  color strokeColour)
    // was called drawLine; programmed by James Carruthers
    // see http://processing.org/discourse/yabb2/YaBB.pl?num=1262458611/0#9
  {
    PVector p1 = new PVector(x1, y1, z1);
    PVector p2 = new PVector(x2, y2, z2);
    PVector v1 = new PVector(x2-x1, y2-y1, z2-z1);
    float rho = sqrt(pow(v1.x, 2)+pow(v1.y, 2)+pow(v1.z, 2));
    float phi = acos(v1.z/rho);
    float the = atan2(v1.y, v1.x);
    v1.mult(0.5);

    pushMatrix();
    translate(x1, y1, z1);
    // normally just   translate(v1.x, v1.y, v1.z);
    translate(v1.x-0, v1.y-0, v1.z-0);
    rotateZ(the);
    rotateY(phi);
    noStroke();
    fill(strokeColour);
    // box(weight,weight,p1.dist(p2)*1.2);
    box(weight, weight, p1.dist(p2)*1.2);
    popMatrix();
  }
  //
} // class
// 


