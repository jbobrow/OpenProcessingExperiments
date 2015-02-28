


// see also peasycam.

// see also http://forum.processing.org/two/discussion/comment/16112#Comment_16112 

// cubes 
float angleCubes=45; // angle for the cubes in the scene
CameraClass cam; 

PVector ballPos = new PVector (300, 300, -100);
PVector ballVel = new PVector (random(1, 2), 
random(-2, -1), 
random(-2, -1));

// -----------------------------------------------------

void setup() {
  size (800, 800, P3D);
  cam = new CameraClass ();
} // func 

void draw() {
  // clear canvas 
  background(111);
  // apply lights 
  lights();
  // set the values of the class to the real camera
  cam.set();
  // move ball and draw it  
  ballPos.add(ballVel);
  fill(0, 255, 0);
  noStroke();
  mySphere(ballPos.x, ballPos.y, ballPos.z, 10);
  // contain ball in a invisible box 
  contain(ballPos, ballVel);
  // make the scene with the boxes 
  scene();
  // text upper left corner
  fill(0, 255, 0); 
  cam.HUD_text("The green ball is contained in an "
    +"invisible box (marked by the red boxes). ");
  //
} // func 

// ---------------------------------------------------

void scene () {
  stroke(2);

  float z ; 

  // one wall of boxes
  for (int x = 10; x < 600; x+= 100)
  {
    fill(x/3, 2, 2);
    for (int y = 10; y < 600; y+= 100)
    {
      z = -600;
      myBox(x, y, z, 24);
      // println ( "Box: " + x + ", "+y+ " "+z);
    }
    fill(0, 0, 254);
    z=-800;
    myBox(x, 10, z, 24);
  }
  // 
  // a few additional boxes
  fill(0, 0, 254);
  z=-400;
  myBox(220, 10, z, 24);
  myBox(600, 10, z, 24);
  z=-400;
  myBox(220, 510, z, 24);
  myBox(600, 510, z, 24);
  z=399;
  myBox(220, 510, z, 24);
  myBox(600, 510, z, 24);
  z=900;
  myBox(220, 510, z, 24);
  myBox(600, 510, z, 24);
  angleCubes++;
  //
}

void myBox(float x, float y, float z, 
float size1) {
  // one nice wrapper for build in box-command
  pushMatrix();
  translate(x, y, z);
  rotateY(radians(angleCubes));
  rotateX(radians(45));
  box(size1);
  popMatrix();
}

void mySphere(float x, float y, float z, 
float size1) {
  // one nice wrapper for build in box-command
  pushMatrix();
  translate(x, y, z);
  rotateY(radians(angleCubes));
  rotateX(radians(45));
  sphere(size1);
  popMatrix();
}

void contain(PVector ballPos, PVector ballVel) {
  //
  fill(255, 2, 2);
  mySphere(500, 500, 500, 20);
  mySphere(100, 100, 100, 20);
  //
  if (ballPos.x>500) 
    ballVel.x=abs(ballVel.x)*-1;
  if (ballPos.y>500) 
    ballVel.y=abs(ballVel.y)*-1;
  if (ballPos.z>500) 
    ballVel.z=abs(ballVel.z)*-1;

  if (ballPos.x<100) 
    ballVel.x=abs(ballVel.x);
  if (ballPos.y<100) 
    ballVel.y=abs(ballVel.y);
  if (ballPos.z<100) 
    ballVel.z=abs(ballVel.z);
}

//
// ===============================================

class CameraClass {
  // capsules the normal camera() command and its vectors 
  PVector camPos;     // its vectors 
  PVector camLookAt;
  PVector camUp;

  PVector camPosInitial;     // its vectors - the default (unchanged) 
  PVector camLookAtInitial;
  PVector camUpInitial; 

  // for follow
  PVector camWhereItShouldBe = new PVector(0, 0, 0);
  PVector camAdd = new PVector(0, -60, 0);
  float easing = .019; // .07; // how fast it changes

  float camCurrentAngle=-90;   // for cam rotation around itself (around Y-axis)
  float camRadius;             // same situation 

  // constructor without parameters
  CameraClass() {
    // constr
    // set vectors 
    camPos    = new PVector(width/2.0, height/2.0, 990);
    camLookAt = new PVector(width/2.0, height/2.0, -600);
    camUp     = new PVector( 0, 1, 0 );
    // save the initial values
    camPosInitial    = camPos.get();
    camLookAtInitial = camLookAt.get();
    camUpInitial     = camUp.get();
  }  // constr

  void set() {
    // apply vectors to actual camera
    camera (camPos.x, camPos.y, camPos.z, 
    camLookAt.x, camLookAt.y, camLookAt.z, 
    camUp.x, camUp.y, camUp.z);
  }


  // ----------------------------------------

  void setLookAt (float x1, float y1, float z1) {
    camLookAt = new PVector(x1, y1, z1);
  }

  // ---------------------------------------

  void printData() {
    println ( "Cam at " + camPos 
      + " looking at " + camLookAt 
      + " (angle = "
      +camCurrentAngle
      +").");
  }

  // --------

  void lookAtPVector (PVector followMe) {
    // follows a player (e.g.)
    camLookAt = followMe.get();
  }

  // ---------------------------------

  void HUD_text (String a1) {
    // HUD text upper left corner 
    // this must be called at the very end of draw()

    // this is a 2D HUD 
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    // ------------------
    textSize(16);
    text (a1, 20, 20);
    // ------------------
    // reset all parameters to defaults
    textAlign(LEFT, BASELINE);
    rectMode(CORNER);
    textSize(32);
    hint(ENABLE_DEPTH_TEST); // no HUD anymore
    lights();
  } // method
  //
} // class

// =====================================

