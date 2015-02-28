


/*

 Demo program for a 3D class named ThreeD.
 
 This class shows different solids to draw in 3D.
 
 This class is not about one item (Car) but more a 
 collection of different commands for the realm / domain of 3D. 
 Among others Platonic solids.
 
 It also features a small camera class named CameraClass. 
 
 Use mainly space key to change state and q to start/stop rotation.
 Use also o/p to rotate cam manually. 
 
 Much better: shapes 3D library by quarks. 
 
 */

ThreeD threeD = new ThreeD(); 
CameraClass cam;

// states 
final int STATE_Primitives  = 0;
final int STATE_Tetrahedron = 1;
final int STATE_Octahedron  = 2;
final int STATE_boxShow     = 3;
//
final int maxState = STATE_boxShow;
int state = STATE_Primitives;

// Font
PFont fontSmall;
PFont fontBig;

// for movement 
int tetrahedronY    = 0;
int tetrahedronAddY = 1;

// ----------------------------------------------

void setup() {
  size(900, 800, P3D);
  fontSmall=createFont("ARIAL", 12);
  fontBig=createFont("ARIAL", 32);
  cam = new CameraClass ();
}

void draw() {
  background(0);
  lights();

  switch (state) {

  case STATE_Primitives: 

    // red triangle
    threeD.fillAndStroke(threeD.RED);
    threeD.triangle(70, 222, -90, 
    11, 65, -80, 
    60, 111, -100);

    // blue quad 
    fill(threeD.BLUE);
    noStroke();
    threeD.quad(310, 222, -90, 
    440, 222, 10, 
    422, 111, -100, 
    330, 111, -100);

    // pink rect
    fill(threeD.PINK);
    threeD.rect(160, 222, -90, 
    100, 45);

    // green box 
    noStroke();
    threeD.box3D(100, 322, 90, 
    26, 
    threeD.GREEN );

    // 3 spheres 
    noStroke();
    threeD.sphere3D(190, 222, 90, 
    26, 
    threeD.GREEN );
    threeD.fillAndNoStroke(threeD.PINK);
    threeD.point(190, 262, 190);
    threeD.point(new PVector(170, 262, 90));

    // red ellipse in 3D 
    fill(threeD.RED);
    threeD.ellipse3D (260, 360, -9, 50);

    break;

  case STATE_Tetrahedron:

    fill(threeD.WHITE);    
    translate(width/2, tetrahedronY, -210);
    rotateY(map(millis()%5000, 0, 5000, 0, TWO_PI));

    threeD.tetrahedron ( 0, 0, 0, 37 );
    tetrahedronY+=tetrahedronAddY;
    if (tetrahedronY<0)
      tetrahedronAddY=abs(tetrahedronAddY);
    if (tetrahedronY>height)
      tetrahedronAddY=-1*abs(tetrahedronAddY);
    break; 

  case STATE_Octahedron:
    fill(threeD.WHITE);    
    translate(width/2, tetrahedronY, -210);
    rotateY(map(millis()%5000, 0, 5000, 0, TWO_PI));
    threeD.Octahedron(  );
    tetrahedronY+=tetrahedronAddY;
    if (tetrahedronY<0)
      tetrahedronAddY=abs(tetrahedronAddY);
    if (tetrahedronY>height)
      tetrahedronAddY=-1*abs(tetrahedronAddY);
    fill(threeD.WHITE);
    textFont(fontBig);
    threeD.showTextInHUD("Mouse ", mouseX, mouseY);  // or null as parameter
    break;

  case STATE_boxShow: 
    // by TfGuy44 

    translate(width/2, height/2, 0);
    rotateY(map(millis()%5000, 0, 5000, 0, TWO_PI));

    scale(90);

    threeD.line3D(-1, -1, -1, 1, 1, 1, .019, threeD.RED);
    threeD.line3D(-1, 1, 1, 1, 1, 1, .019, threeD.YELLOW);
    threeD.line3D(1, -1, -1, 1, 1, 1, .019, threeD.MAGENTA);

    noFill();
    stroke(255);
    scale(.009);
    box(220);

    break;

  default:
    // error
    println ("Error, code 984");
    exit();
    break;
  } // switch 

  //
  fill(threeD.WHITE);
  textFont(fontSmall);
  threeD.showTextInHUD(
  "q rotate on/off. Press space for next state. We are in state "
    +state
    +".");  // or null as parameter 

  // cam 
  if (cam.rotates) { 
    cam.camCurrentAngle++;
    cam.moveToAngle();
  } 
  cam.set();

  //
} // func 

void keyPressed() {
  switch (key) {
  case ' ':
    state++;
    if (state>maxState)
      state=0;
    break;
    // rotate      
  case 'p':
    cam.camCurrentAngle--;
    cam.moveToAngle(); 
    break; 
  case 'o':
    cam.camCurrentAngle++;
    cam.moveToAngle();
    break;
  case 'q':
    cam.rotates = !cam.rotates ; 
    break;
  } // switch
}// func 

// ==============================================

class ThreeD {

  /*
   This class shows different solids to draw in 3D.
   
   This class is not about one item (Car) but more a 
   collection of different commands for the realm of 3D. 
   
   section 1: reference section "2D Primitives" now in 3D
   section 2: reference section "3D Primitives" now in enhanced version 
   section 3: Platonic solids
   section 4: other, non platonic solids 
   section 5: coordinate system and related 
   section 6: HUD funcs / Head-up-Display funcs 
   section 7: floor
   section 8: minor help functions
   
   */

  // consts

  final color RED     = color (255, 0, 0);
  final color GREEN   = color (0, 255, 0);
  final color BLUE    = color (0, 0, 255);

  final color WHITE   = color (255);
  final color BLACK   = color (0);
  final color GRAY    = color (111);

  final color YELLOW       = color (255, 255, 0);
  final color YELLOWWARM   = color (255, 245, 49); 
  final color VIOLET       = color (143, 0, 255);
  final color INDIGO       = color (111, 0, 255);
  final color MAGENTA      = color (255, 0, 255);
  final color PINK         = color (255, 192, 203); 

  // vars 

  boolean crosshair; 

  // section 1: 
  // reference section "2D Primitives" now in 3D ----------------------
  // read the ref there, they are just changed a bit to be 3D

  void point(PVector pos) {
    // version with PVector parameter. 
    // calls another method in the same class. 
    // See there for description. 
    point(pos.x, pos.y, pos.z);
  }

  void point(PVector pos, String str) {
    // version with PVector parameter. 
    // calls another method in the same class. 
    // See there for description. 
    // With local text next to the point. 
    point(pos.x, pos.y, pos.z);
    text(str, pos.x+6, pos.y+6, pos.z);
  }

  void point(float x, float y, float z) {
    // point as a sphere, fixed size 5, 
    // fixed noStroke, no fill color, you 
    // must set the fill color before using 
    // this method. 
    noStroke();
    pushMatrix();
    translate(x, y, z);
    sphere(5);
    popMatrix();
  }

  void ellipse3D(float x, float y, float z, float size1) {
    // point as a sphere, fixed size 5, 
    // fixed noStroke, no fill color, you 
    // must set the fill color before using 
    // this method. 
    noStroke();
    pushMatrix();
    translate(x, y, z);
    ellipse(0, 0, size1, size1);
    popMatrix();
  }

  void line3D(float x1, float y1, float z1, 
  float x2, float y2, float z2, 
  float weight, color colorLine)
    // drawLine was programmed by James Carruthers
    // see http://processing.org/discourse/yabb2/YaBB.pl?num=1262458611/0#9 
  {
    // scale(90);

    PVector p1 = new PVector(x1, y1, z1);
    PVector p2 = new PVector(x2, y2, z2);
    PVector v1 = new PVector(x2-x1, y2-y1, z2-z1);
    float rho = sqrt(pow(v1.x, 2)+pow(v1.y, 2)+pow(v1.z, 2));
    float phi = acos(v1.z/rho);
    float the = atan2(v1.y, v1.x);
    v1.mult(0.5);
    pushMatrix();
    PVector v2 = new PVector ( x1, y1, z1 );
    translate(v2.x, v2.y, v2.z);
    translate(v1.x, v1.y, v1.z);
    rotateZ(the);
    rotateY(phi);
    noStroke();
    fill(colorLine);

    box(weight, weight, p1.dist(p2));
    popMatrix();
  } // method

  void triangle(float x1, float y1, float z1, 
  float x2, float y2, float z2, 
  float x3, float y3, float z3) {
    beginShape();
    vertex(x1, y1, z1);
    vertex(x2, y2, z2);
    vertex(x3, y3, z3);
    endShape(CLOSE);
  }

  void quad(
  float x1, float y1, float z1, 
  float x2, float y2, float z2, 
  float x3, float y3, float z3, 
  float x4, float y4, float z4) {
    beginShape();
    vertex(x1, y1, z1);
    vertex(x2, y2, z2);
    vertex(x3, y3, z3);
    vertex(x4, y4, z4);
    endShape(CLOSE);
  }

  void rect(
  float x1, float y1, float z1, 
  float w, float h) {
    beginShape();
    vertex(x1, y1, z1);
    vertex(x1+w, y1, z1);
    vertex(x1+w, y1+h, z1);
    vertex(x1, y1+h, z1);
    endShape(CLOSE);
  }

  // section 2: 
  // reference section "3D Primitives" now in enhanced version ----------------------

  void box3D (float x, float y, float z, 
  float sizeBox, 
  color col ) {
    fill(col);
    pushMatrix();
    translate(x, y, z);
    box(sizeBox);
    popMatrix();
  }

  void sphere3D (float x, float y, float z, 
  float sizeBox, 
  color col ) {
    fill(col);
    pushMatrix();
    translate(x, y, z);
    sphere(sizeBox);
    popMatrix();
  }

  // section 3: 
  // Platonic solids ----------------------
  // http://en.wikipedia.org/wiki/Platonic_solid 

  // also cube / box is a Platonic solid - see above

  void tetrahedron(float x1, float y1, float z1, float size1 ) {

    // tetrahedron
    //    A(1,1,–1), C(–1,–1,–1), F(–1,1,1) und H(1,–1,1).
    // see http://en.wikipedia.org/wiki/Tetrahedron#Formulas_for_a_regular_tetrahedron
    // see http://de.wikipedia.org/wiki/Datei:Tetraeder_animation_with_cube.gif 

    scale (size1);

    // fill(GREEN);
    beginShape();
    vertex(1, 1, -1);
    vertex(-1, -1, -1);
    vertex(-1, 1, 1) ;
    endShape();

    // fill(BLUE);
    beginShape();
    vertex(1, -1, 1);
    vertex(-1, -1, -1);
    vertex(-1, 1, 1) ;
    endShape();

    // fill(PINK);
    beginShape();
    vertex(1, -1, 1);
    vertex(-1, -1, -1);
    vertex(1, 1, -1);
    endShape();

    // fill(YELLOW);
    beginShape();
    vertex(1, 1, -1);
    vertex(1, -1, 1);
    vertex(-1, 1, 1) ;
    endShape();
    // 
    //    noFill();
    //    box(2);
    //
  }

  void Octahedron() {
    // (eight faces)
    // see http://en.wikipedia.org/wiki/Octahedron

    /*
     ( ±1, 0, 0 );
     ( 0, ±1, 0 );
     ( 0, 0, ±1 ). 
     */

    // define vertices 
    PVector [] list = new PVector[6];

    list [0] = new PVector  (1, 0, 0);
    list [1] = new PVector  (0, 0, 1);
    list [2] = new PVector  (0, -1, 0); 

    list [3] = new PVector  (-1, 0, 0);
    list [4] = new PVector  (0, 0, -1);
    list [5] = new PVector  (0, 1, 0);

    // scale (33);

    for (int i = 0 ; i < list.length; i++) {
      list[i].mult(49); 
      // point(list[i], str(i));
    }

    fillAndStroke (BLUE, BLACK);

    // defines the shapes 
    // the lower half
    makeShape (list [0], list [1], list [5] ) ;
    makeShape (list [0], list [4], list [5] ) ;
    makeShape (list [3], list [4], list [5] ) ;
    makeShape (list [3], list [1], list [5] ) ;

    // the upper half
    makeShape (list [0], list [1], list [2] ) ;
    makeShape (list [0], list [4], list [2] ) ;
    makeShape (list [3], list [4], list [2] ) ;
    makeShape (list [3], list [1], list [2] ) ;
  } // method 

  // 
  // section 4: 
  // other, non platonic solids ----------------------

  void pyramid () { 

    translate(width/2, height/2, 0);

    scale(100);
    beginShape();
    vertex(-1, -1, -1);
    vertex( 1, -1, -1);
    vertex( 0, 0, 1);

    vertex( 1, -1, -1);
    vertex( 1, 1, -1);
    vertex( 0, 0, 1);

    vertex( 1, 1, -1);
    vertex(-1, 1, -1);
    vertex( 0, 0, 1);

    vertex(-1, 1, -1);
    vertex(-1, -1, -1);
    vertex( 0, 0, 1);
    endShape();
  }


  // section 5: 
  // coordinate system and related ----------------------

  // by ofey 

  void coorWalls() {

    // draw 3 walls in 3D which mark a coordinate systems. 
    // coordinate system wall
    // by ofey 
    //
    fill(BLUE);//blue left side
    beginShape();
    vertex(0, 0, 0);
    vertex(0, 0, -400);
    vertex(0, 400, -400);
    vertex(0, 400, 0);
    endShape(CLOSE);

    fill(YELLOW);//yellow bottom
    beginShape();
    vertex(0, 400, 0);
    vertex(0, 400, -400);
    vertex(400, 400, -400);
    vertex(400, 400, 0);
    endShape(CLOSE);

    fill(GREEN);//green back
    beginShape();
    vertex(0, 0, -400);
    vertex(400, 0, -400);
    vertex(400, 400, -400);
    vertex(0, 400, -400);
    endShape(CLOSE);
  }

  void ShowCoordinates () {
    // Show Coordinates x, y and z as lines 
    //
    // X
    stroke (255, 0, 0);
    line (0, 0, 0, 100, 0, 0 ) ;
    sphere3D (100, 0, 0, 13, color (255, 0, 0) );
    text ("X", 120, 60, 0);

    // Y
    stroke    (0, 255, 0);
    line (0, 0, 0, 0, 100, 0 ) ;    
    sphere3D(0, 100, 0, 13, GREEN);    
    text ("Y", 0, 180, 0);

    // Z
    stroke (0, 0, 255);
    line (0, 0, 0, 0, 0, -300 ) ; 
    sphere3D (0, 0, -300, 33, BLUE);    
    text ("-Z", 30, 50, -300);
  } // function 

  void show3DCursor( float theX, float theY, float theZ) {
    // show 3D cursor
    //
    if (crosshair) {
      // 3D crosshair
      final int len = 15;

      stroke(244, 2, 2); // red  
      line (theX, theY, theZ-len, theX, theY, theZ+len);
      stroke(0, 0, 255);
      line (theX, theY-len, theZ, theX, theY+len, theZ);
      stroke(2, 244, 2);
      line (theX-len, theY, theZ, theX+len, theY, theZ);

      pushMatrix();
      translate(theX, theY, theZ+len);
      fill(244, 2, 2);
      noStroke();
      sphere(1);
      popMatrix();
    }
    else
    {
      // sphere
      pushMatrix();
      translate(theX, theY, theZ);
      fill(WHITE);
      noStroke();
      sphere(10);
      popMatrix();
    } // else
  } // func

  // section 6: 
  // HUD funcs  ----------------------
  // Head-up-Display 
  // see http://de.wikipedia.org/wiki/Head-up-Display

  void showTextInHUD(String str1) {
    // A small 2D HUD for text in the
    // upper left corner. 
    // This func may only be called a the very end of draw() afaik.
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    textMode(MODEL);
    if (str1!=null)
      text(str1, 20, 20);
    hint(ENABLE_DEPTH_TEST);
  } // func 

  void showTextInHUD(String str1, float x, float y) {
    // A small 2D HUD for text at
    // free pos.
    // This func may only be called a the very end of draw() afaik.
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    textMode(MODEL);
    if (str1!=null)
      text(str1, x, y);
    hint(ENABLE_DEPTH_TEST);
  } // func 

  // section 7:
  // floor (later walls (but see coordinate system wall above), sky sphere...) --------------------------------

  void CheckeredFloor() {

    noStroke();

    for (int i = 0; i < 40; i = i+1) {
      for (int j = 0; j < 40; j = j+1) {

        // % is modulo, meaning rest of division
        if (i%2 == 0) {
          if (j%2 == 0) {
            fill (255, 0, 0);
          }
          else
          {
            fill ( 103 );
          }
        } 
        else {
          if (j%2 == 0) {
            fill ( 103 );
          }
          else
          {
            fill (255, 0, 0);
          }
        } // if

        pushMatrix();

        translate ( 40*i-500, 360, 40*j-640 );
        box (40, 7, 40);

        popMatrix();
      } // for
    } // for
  } // function


  // section 8: 
  // minor help functions ----------------------
  //
  // vertex ---
  //
  void vertexPVector ( PVector pos ) {
    vertex(pos.x, pos.y, pos.z);
  }

  void makeShape( PVector p1, PVector p2, PVector p3 ) {
    beginShape();    
    vertexPVector(p1);
    vertexPVector(p2);
    vertexPVector(p3);
    endShape();
  }

  // colors ---
  // 
  void fillAndStroke( color f, color s ) {
    // set both colors at once (but different) 
    fill(f);
    stroke(s);
  }

  void fillAndStroke( color c ) {
    // set both at once (same color) 
    fill(c);
    stroke(c);
  }

  void fillAndNoStroke(color f) {
    // set fill color and switch stroke off
    fill(f);
    noStroke();
  }

  void strokeAndNoFill(color s) {
    // set stroke color and switch fill off
    noFill();
    stroke(s);
  }

  // crosshair ---
  void toogleCrosshair() {
    crosshair = !crosshair;
  }

  void crosshairOn() {
    crosshair=true;
  }

  void crosshairOff() {
    crosshair=false;
  }

  boolean crosshairState() {
    return crosshair;
  }

  //
} // class ThreeD

//
// ====================================================================

class CameraClass {
  // 
  // Capsules the normal camera() command and its vectors. 
  // You need to use the method set in this class to apply the 
  // vectors of the class to the real camera.
  //
  PVector camPos;     // its vectors (as in the camera command)
  PVector camLookAt;
  PVector camUp;

  PVector camPosInitial;     // its vectors - the default (unchanged) 
  PVector camLookAtInitial;
  PVector camUpInitial; 

  float camCurrentAngle=-90;   // for cam rot around itself (around Y-axis)
  float camRadius;             // same situation 

  boolean rotates = true; 

  // constr 
  CameraClass() {
    // constr
    // set vectors 
    camPos    = new PVector(width/2.0, height/2.0, 830);
    camLookAt = new PVector(width/2.0, height/2.0, 0);
    camUp     = new PVector( 0, 1, 0 );
    // save the initials 
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

  void moveToAngle() { 
    // cam rotates in the plane (around center)
    camRadius = camLookAt.dist (camPos); 
    camPos.x = (1.0 * camRadius) * cos (radians(camCurrentAngle)) + camLookAt.x;
    camPos.z = (1.0 * camRadius) * sin (radians(camCurrentAngle)) + camLookAt.z;
  }
} // class CameraClass

//

