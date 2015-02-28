

// see http://forum.processing.org/topic/1st-person-perspective 

// First person run around in a level.
// It won't work in the applet, ie online (uses Robot). 
// Change size when offline. 
// Move mouse down at beginning. 
// 1st Person Game / First Person Game.
// Runs best with OPENGL - P3D has to many issues. 

// Makes use of Robot now, so you can endlessly turn around yourself now. 

// use mouse to look around.  
// use WASD to move. You run where you look at.
// Use r/f for your height (or b/n for FAST height change).
// use c for crouch on/off.

// imports
import processing.opengl.*;
import java.awt.Robot;  

//import peasy.org.apache.commons.math.*;
//import peasy.*;
//import peasy.org.apache.commons.math.geometry.*;

// ----------------------------------------------------------
// issues: collision detection missing; clipping; initially the mouse should be centered. 
//         crouch doesn't take into account your former height (when changed via 'r').
//         to be done: LookUp-Table for sin / cos (search for initSinCos). 
// solved issues: Makes use of Robot now, so you can endlessly turn around yourself now. 
// ----------------------------------------------------------

// Floor has y-value 
final float floorLevel = 500.0; 

// camera / where you are 
float xpos,ypos,zpos, xlookat,ylookat,zlookat; 
float angle=0.0; // (angle left / right; 0..359)

// player is crouching yes / no 
boolean isCrouching = false; 

// -------------------------------------------------------------
// virtual mouse 
// Code by rbrauer.
// It won't work in the applet, ie online. 
// Copy the source code and try it from the PDE.

Robot robot;  
float rmx, rmy;   // virtual mouse values 

// -------------------------------------------------------------
// Buildings

// Buildings: color for figures 
color colWhite = 253;
color colBlack = 72; 

// Buildings: values for position of figures on the screen 
int calculationForScreenPositionX = 0;  // 
int calculationForScreenPositionY = 46; // 
int calculationForScreenPositionZ = 0;  // 

// -------------------------------------------------------------

/**
 sincoslookup taken from http://wiki.processing.org/index.php/Sin/Cos_look-up_table
 @author toxi (http://www.processinghacks.com/user/toxi)
 */

// declare arrays and params for storing sin/cos values 
float sinLUT[];
float cosLUT[];
// set table precision to 0.5 degrees
float SC_PRECISION = 0.5f;
// caculate reciprocal for conversions
float SC_INV_PREC = 1/SC_PRECISION;
// compute required table length
int SC_PERIOD = (int) (360f * SC_INV_PREC);

// -------------------------------------------------------------

void setup () {

  size (800,800,OPENGL);
  // size( screen.width, screen.height, OPENGL );  

  background(0);

  //noStroke();
  //following lines create the java "Robot" used to control mouse pos.
  //it has to be in a try / catch block because its possible for it  
  //to throw an exception:  
  try { 
    robot = new Robot();
  }  
  catch(Throwable e) {
  }  

  stroke(13);
  fill(102);
  noCursor();

  xpos = width/2.0; 
  ypos = 360; 
  zpos = 0 ;  

  /* xlookat = xpos ; 
   ylookat = -120 ; 
   zlookat = zpos - 300;*/

  // important call to initialize lookup tables
  // initSinCos(); // not in use

  CheckVirtualMouse ();
  CheckCameraMouse ();
} // setup

void initSinCos() { // not in use 
  // init sin/cos tables with values
  // should be called from setup()
  sinLUT = new float[SC_PERIOD];
  cosLUT = new float[SC_PERIOD];
  for (int i = 0; i < SC_PERIOD; i++) {
    sinLUT[i] = (float) Math.sin(i * DEG_TO_RAD * SC_PRECISION);
    cosLUT[i] = (float) Math.cos(i * DEG_TO_RAD * SC_PRECISION);
  }
} // initSinCos 

void draw () {

  fill(101);
  background(0);

  plane();  // Floor 
  walls () ; 
  buildings() ;

  // very important that this is last in draw()
  CheckVirtualMouse (); 
  CheckCameraMouse ();
}

// ===========================================================================================

void CheckCameraMouse () {
  // Mouse  
  // note: Makes use of the values of Robot-Mouse. 
  float Radius = 450.0;  // Anfangsradius des Kreises 

  // command map: See Help. 
  angle = map(rmx,width,0,0,359); // left right 

  // look at 
  xlookat = Radius*sin(radians(angle)) + xpos;
  ylookat = map(rmy,-300,floorLevel-120,-270,height); // look up / down 
  zlookat = Radius*cos(radians(angle)) + zpos; 

  camera (xpos,ypos,zpos,
  xlookat, ylookat, zlookat,
  0.0, 1.0, 0.0
    );
}

// -------------------------------------------------------------------------------------------

void CheckVirtualMouse () {

  // Code by rbrauer.
  // it won't work in the applet, ie online. 
  // Copy the source code and try it from the PDE.

  //line moves mouse pos to center of canvas  
  //frame.getX() is the horizontal pos of the window top left (or so)  
  //this.getX (or just getX()) gets offset from window frame to canvas  
  //required because robot's coords are global not relative to canvas  
  robot.mouseMove(
  frame.getX()+this.getX()+round(width/2),  
  frame.getY()+this.getY()+round(height/2));

  //mouse pos is locked in center of canvas  
  //above lines subtract the centering, get whatever offset from  
  //center user creates by moving mouse before robot resets it, then  
  //continously adds that to our new mouse pos variables  
  rmx += mouseX-width/2;  
  rmy += mouseY-height/2;  

  //these lines are just shortened conditionals to handle  
  //wrapping of our mouse pos variables when they go outside canvas  
  //first one:  
  //if rmx>width? set rmx to rmx-width else : set rmx to rmx  
  rmx = rmx>width?rmx-width:rmx;  
  rmx = rmx<0?width+rmx:rmx;  
  // check ceiling 
  if (rmy<-300) {
    rmy= -300;
  }
  // check floor
  if (rmy>floorLevel-20) {
    rmy= floorLevel-20;
  }
} // CheckVirtualMouse 

// -----------------------------------------------------------

void keyPressed() {

  float Radius = 13; 

  if(keyPressed) {

    // ----------------------------    
    // forward & backward
    if (key == 'w' || key == 'W') {
      // forward : should be running towards lookat 
      xpos =   Radius*sin(radians(angle)) + xpos;
      zpos =   Radius*cos(radians(angle)) + zpos;
    }
    if (key == 's' || key == 'S') {
      // backward
      xpos =  xpos- (Radius*sin(radians(angle))) ;
      zpos =  zpos- (Radius*cos(radians(angle))) ;
    }
    // ----------------------------    
    // left & right 
    if (key == 'a' || key == 'A') {
      // left
      xpos =   xpos- Radius*sin(radians(angle-90)) ;
      zpos =   zpos- Radius*cos(radians(angle-90)) ;
    }
    if (key == 'D' || key == 'd') {
      // right 
      xpos =   Radius*sin(radians(angle-90)) + xpos;
      zpos =   Radius*cos(radians(angle-90)) + zpos;
    } 
    // ----------------------------    
    // fly up & down 
    if (key == 'r' || key == 'R') {
      ypos-=4;  // fly up
    }
    if (key == 'f' || key == 'F') {
      ypos+=4;  // down 
      if (ypos > floorLevel-120) {  // check Floor
        ypos = floorLevel-120;
      }
    }     
    // ----------------------------    
    // fly up & down FAST 
    if (key == 'b' || key == 'B') {
      // Bird
      ypos-=400;
    }    
    if (key == 'n' || key == 'N') {
      // un-Bird: go deeper 
      ypos+=400; 
      if (ypos > floorLevel-120) { // check Floor
        ypos = floorLevel-120;
      }
    }        
    // ----------------------------        
    // crouch 
    if (key == 'c' || key == 'C') {
      isCrouching=!isCrouching;
      if ( isCrouching ) {
        // crouch
        ypos = floorLevel - 40; //  height/2.0;
      }
      else 
      {
        // stand 
        ypos = floorLevel - 120; //  height/2.0;
      }
    } // 'c'
    if (key == 'i' || key == 'I') {
      // Saves a TIFF file named "diagonal.tif"
      save("Runner1.tif");
    }
    checkBoundaries ();
  } // keyPressed
}

void checkBoundaries () {

  if (xpos<-3995) {
    xpos=-3995;
  }
  else if (xpos>3995) {
    xpos=3995;
  }
  if (zpos<-3995) {
    zpos=-3995;
  }
  else if (zpos>3995) {
    zpos=3995;
  }
}

// ===========================================================================================
// the level stuff 

void plane () {
  // plane aka floor 
  pushMatrix();
  translate(0, floorLevel, 0); 
  box(9000, 2, 9000);
  popMatrix();
}

void walls () {

  // 4 walls around my level 

  final float height1 = 900; 
  final float wallLong = 7998; 

  stroke(0);

  pushMatrix();
  fill (223,222,223); 
  translate(-4000, floorLevel-(height1/2), 0);
  box(10, height1, wallLong);
  popMatrix(); 

  pushMatrix();
  fill (223,222,223); 
  translate(4000, floorLevel-(height1/2), 0);
  box(10, height1, wallLong);
  popMatrix();   

  // -----------------------------------------------

  pushMatrix();
  fill (223,222,223); 
  translate(0, floorLevel-(height1/2), -4000);
  box(wallLong, height1, 0);
  popMatrix();   

  pushMatrix();
  fill (223,222,223); 
  translate(0, floorLevel-(height1/2), 4000);
  box(wallLong, height1, 0);
  popMatrix();
}

void buildings() {

  // the stuff standing around 

  float height1 ; 

  pushMatrix();
  height1 = 155;
  fill (12,12,123);   
  translate(400, floorLevel-(height1/2), -400);
  box(50, height1, 30);
  popMatrix();

  pushMatrix();
  height1 = 200; 
  fill (123,12,123); 
  translate(40, floorLevel-(height1/2), -200);
  box(150, height1, 130);
  popMatrix();  

  pushMatrix();
  height1 = 300; 
  fill (123,12,123); 
  translate(40, floorLevel-(height1/2), -200);
  box(90, height1, 100);
  popMatrix(); 

  pushMatrix();
  height1 = 300; 
  fill (333,32,0); 
  translate(240, floorLevel-(height1/2), 2200);
  box(90, height1, 100);
  popMatrix();   

  pushMatrix();
  height1 = 300; 
  fill (22); 
  translate(-2240, floorLevel-(height1/2), 2200);
  box(90, height1, 100);
  popMatrix();     

  pushMatrix();
  height1 = 600; 
  fill (32); 
  translate(-2240, floorLevel-(height1/2), -2200);
  box(190, height1, 200);
  popMatrix();       

  pushMatrix();
  height1 = 200; 
  fill (43); 
  translate(2240, floorLevel-(height1/2), 2200);
  box(390, height1, 20);
  popMatrix();       

  pushMatrix();
  height1 = 200; 
  fill (0,220,330); 
  translate(2240, floorLevel-(height1/2), -2200);
  box(390, height1, 420);
  popMatrix();

  pushMatrix();
  height1 = 20; 
  fill (10,0,330); 
  translate(0, floorLevel-(height1/2), 0);
  box(10, height1, 10);
  popMatrix();

  // other buildings 
  pawn ( 3,4, colWhite )  ; 
  queen ( 8,8, colBlack )  ;
  king ( 1,1, colBlack )  ; 
  rook ( 7,3, colBlack )  ; 

  knight ( 2,3, colBlack )  ;   
  bishop ( 2,2, colBlack )  ; 
  // knight ( 1,7, colBlack )  ;
}

// ==============================================================
// figures for buildings 

void queen (int i,int j,int col3) {
  int col1 = 103; 
  int col2 = 11;   
  fill(col3);
  stroke(OtherFigureColor(col3));  
  pushMatrix();
  PVector MyPVector = new PVector( 0.0, 0.0, 0.0 );
  MyPVector =  GetValuePVector (i,j);
  translate ( MyPVector.x, MyPVector.y, MyPVector.z );
  scale (10); 
  box (20);
  translate ( 0,-17,0 );
  // sphereDetail(11, 11);
  noStroke(); 
  fill(OtherFigureColorQueen(col3));    
  sphere(8); 
  popMatrix();
}

void king (int i,int j,int col3) {
  int col1 = 103; 
  int col2 = 11;   
  fill(col3);
  stroke(OtherFigureColor(col3));  
  pushMatrix();
  PVector MyPVector = new PVector( 0.0, 0.0, 0.0 );
  MyPVector =  GetValuePVector (i,j);
  translate ( MyPVector.x, MyPVector.y, MyPVector.z );
  scale (10); 
  box (20);
  translate ( 0,-15,0 );
  rotateY(radians(45));
  box (10);
  popMatrix();
}

void pawn (int i,int j,int col3) {
  int col1 = 103; 
  int col2 = 11;   
  fill(col3);
  stroke(OtherFigureColor(col3));  
  pushMatrix();
  PVector MyPVector = new PVector( 0.0, 0.0, 0.0 );
  MyPVector =  GetValuePVector (i,j);
  translate ( MyPVector.x, MyPVector.y, MyPVector.z );
  scale (10); 
  box (17);
  noStroke();
  popMatrix();
}

void rook (int i,int j,int col3) {
  // tower, marquess, rector, 
  // and comes, and 
  // non-players still 
  // often call it a "castle". 
  // (from Wikipedia)
  int col1 = 103; 
  int col2 = 11;   
  fill(col3);
  stroke(OtherFigureColor(col3));  
  pushMatrix();
  PVector MyPVector = new PVector( 0.0, 0.0, 0.0 );
  MyPVector =  GetValuePVector (i,j);
  translate ( MyPVector.x, MyPVector.y, MyPVector.z );
  scale (10); 
  box (25);
  popMatrix();
}

void bishop (int i,int j,int col3) {
  int col1 = 103; 
  int col2 = 11;   


  fill(col3);
  stroke(OtherFigureColor(col3));  
  pushMatrix();
  PVector MyPVector = new PVector( 0.0, 0.0, 0.0 );
  MyPVector =  GetValuePVector (i,j);
  translate ( MyPVector.x, MyPVector.y, MyPVector.z );
  scale (10); 
  rotateY(radians(45));
  box (5,25,25);
  rotateY(radians(90));
  box (5,25,25);  
  noStroke();
  popMatrix();
}

void knight (int i,int j,int col3) {
  int col1 = 103; 
  int col2 = 11;   
  fill(col3);
  stroke(OtherFigureColor(col3));
  pushMatrix();
  PVector MyPVector = new PVector( 0.0, 0.0, 0.0 );
  MyPVector =  GetValuePVector (i,j);
  // scale (10); 
  translate ( MyPVector.x-5, MyPVector.y+5, MyPVector.z-4 );
  ShowL (col3); 
  rotateY(radians(180));
  translate ( -100.1,-100.21,-100.1 );
  // translate ( -MyPVector.x-5, -MyPVector.y+5, -MyPVector.z-4 );  
  ShowL (col3); 
  popMatrix();
}

// ----------------------------------------------------------

void ShowL (int col3) {
  // help-sub for the knight
  int col1 = 103; 
  int col2 = 11;   
  int Size1 = 10; 
  fill(col3);
  stroke(OtherFigureColor(col3));
  pushMatrix();
  scale (10); 
  box (Size1);
  translate ( Size1,0.0,0.01 );
  box (Size1);  
  translate ( 0.01,0.0,Size1 );
  box (Size1);  
  noStroke();
  popMatrix();
}

int OtherFigureColor (int col3) {
  // This gives you a similar color 
  // for the figure's color. 
  // E.g. you have a white figure 
  // you here get another white-ish color
  // for the stroke lines of the figure.
  // For a black figure you get another 
  // shade of black or dark gray.

  int Buffer=0;

  if (col3==colWhite) 
  {
    Buffer=colWhite-60;
  } 
  else 
  {
    Buffer=50;
  };

  return(Buffer);
}

int OtherFigureColorQueen (int col3) {
  // QUEEN -----------------
  // This gives you a similar color 
  // for the figure's color. 
  // E.g. you have a white figure 
  // you here get another white-ish color
  // for the stroke lines of the figure.
  // For a black figure you get another 
  // shade of black or dark gray.

  int Buffer=0;

  if (col3==colWhite) 
  {
    Buffer=colWhite-17;
  } 
  else 
  {
    Buffer=70;
  };

  return(Buffer);
}

// ------------------------------------------------------------------------

PVector GetValuePVector ( int x1, int y1 ) {
  // here the calculation for the positions of 
  // figures is made. 
  if (false) {
    PVector MyPVector = new PVector( 0.0, 0.0, 0.0 );
    /* MyPVector.set ( moveRunningX_ScreenFrom,160,moveRunningY_ScreenFrom);*/
    return(MyPVector);
  } 
  else {
    PVector MyPVector = new PVector( 0.0, 0.0, 0.0 );
    MyPVector.set (  440*x1 + calculationForScreenPositionX,
    500 - calculationForScreenPositionY,
    440*(7-y1)  + calculationForScreenPositionZ );
    return(MyPVector);
  }
}


