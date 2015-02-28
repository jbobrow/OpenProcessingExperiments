

// see http://forum.processing.org/topic/1st-person-perspective 

// 3rd person run around in a level.
// You can see the avatar. 
// Behaviour partly orientated on Tomb Raider: Anniversary. 

// Main point is to demonstrate the camera and the movement. 
// Forget the design of the avatar and of the level. 

// Makes use of Robot now, so you can endlessly turn around yourself now. 

// runs best with OPENGL - P3D has too many issues. 
// use mouse to look around.  
// use WASD (or cursor) to move. You run where you look at.
// Use r/f for your height (or b/n for FAST height change).
// use c for crouch on/off.
// use your o and k for camera distance 
// use p and l for turning avatar 

// imports
import processing.opengl.*;
import java.awt.Robot;  

//import peasy.org.apache.commons.math.*;
//import peasy.*;
//import peasy.org.apache.commons.math.geometry.*;

// ----------------------------------------------------------
// issues: collision detection missing; clipping; initially the mouse should be centered. 
//         crouch doesn't take into account your former height (when changed via 'r')  
// solved issues: you can now endlessly look around; when the mouse is at 0, it doesn't stop.
// ----------------------------------------------------------

// Floor has y-value 
final float floorLevel = 500.0; 

// ----------------------------------------------------------

// camera:  
float xCamera ;   // Position of Camera (eye)
float yCamera ;   // Höhe der Kamera über der Szene 
float zCamera ; 
float AngleFromMouse=0.0; // (angle left / right; 0..359) from Mouse-Position X 
float RadiusCam = 330;   // Distance of camera to the avatar 

// ----------------------------------------------------------

// player / avatar:
float xavatar, yavatar, zavatar;   // Position 
float avatarAngle = 0.0; // his heading: left / right 0..359
final float avatarStandHeight = 155; // Height
final float avatarCrouchHeight = 40; 
float avatarActualHeight = avatarStandHeight; 

// player is crouching yes / no 
boolean isCrouching = false; 

// Radius when avatar moves // distance per move // speed
final float Radius = 13; 

// ears 
boolean hasEars = false;  //  ;-)  

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

// bullet
// Would need an arraylist of class "bullet" to have 
// multiple bullets.
boolean canShoot = false; 
float xbullet,ybullet,zbullet;
float bulletAngle = 0.0; // left / right 
boolean bulletFlies = false; 
final float RadiusBullet = 44;  // speed 

// -------------------------------------------------------------

void setup () {

  // size( screen.width, screen.height, OPENGL );  
  size( 800, 600, OPENGL );    

  background(0);
  stroke(13);
  fill(102);
  noCursor();

  //following lines create the java "Robot" used to control mouse pos.
  //it has to be in a try / catch block because its possible for it  
  //to throw an exception:  
  try { 
    robot = new Robot();
  }  
  catch(Throwable e) {
  }  

  // init camera 
  xCamera = width/2.0; 
  yCamera = 0; 
  zCamera = 0;  

  xavatar = 0; 
  yavatar = floorLevel - (avatarStandHeight/2);
  zavatar = 0;
}  // setup 

void draw () {

  fill(101);
  background(0);

  CheckVirtualMouse(); 
  CheckCameraMouse();

  plane();  // Floor 
  walls(); // walls
  buildings();  // buildings
  avatar(); // avatar
  if   (bulletFlies)
  {
    showBullet();
  }
} // draw 

// ===========================================================================================

void CheckCameraMouse () {

  // Mouse  
  // command map: see processing help 

  // map "virtual mouse x" to angle 0..359 
  AngleFromMouse = map(rmx,width,0,0,359); // left / right 

  yCamera = map(rmy,0,height,0,height);
  /*if (yCamera>floorLevel-20) {
   yCamera= floorLevel-20;
   }*/

  // the camera is around the avatar depending from virtual mouse X 
  // in a distance RadiusCam from the avatar 
  xCamera = xavatar - RadiusCam*sin(radians(AngleFromMouse))  ;
  zCamera = zavatar - RadiusCam*cos(radians(AngleFromMouse))  ;

  checkBoundariesCamera ();

  // good 3rd person camera looking at the avatar  
  camera (xCamera,yCamera,zCamera,
  xavatar, yavatar, zavatar,
  0.0, 1.0, 0.0
    );

  // fixed camera looking at the middle of the scene
  //  camera (3300,110,4000,
  //  3, 3, 3,
  //  0.0, 1.0, 0.0
  //    );
} // CheckCameraMouse 

void CheckVirtualMouse () {

  // Code by rbrauer.
  // it won't work in the applet, ie online. 
  // Copy the source code and try it from the PDE.

  //line moves mouse pos to center of canvas  
  //frame.getX() is the horizontal pos of the window top left (or so)  
  //this.getX (or just getX()) gets offset from window frame to canvas  
  //required because robot's coords are global not relative to canvas  
  robot.mouseMove(frame.getX()+this.getX()+round(width/2),  
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

// ---------------------------------------------------

void keyPressed() {

  if (key == CODED) {
    // key is coded 
    switch (keyCode) { 
    case UP:
      // cursor UP
      moveForward(); 
      break; 
    case DOWN: 
      // cursor DOWN
      moveBackward (); 
      break; 
    case LEFT: 
      // cursor LEFT
      moveLeft(); 
      break; 
    case RIGHT:
      // cursor RIGHT 
      moveRight(); 
      break; 
    default: 
      // do nothing 
      break;
    } // switch
  } // if (key == CODED) {
  else
  {
    // key not coded 
    switch (key) {
      // ----------------------------    
      // forward & backward
    case 'w':
    case 'W':
      // forward 
      moveForward(); 
      break; 
    case 's':
    case 'S':
      // backward
      moveBackward () ; 
      break; 
      // ----------------------------    
      // left & right 
    case 'a':
    case 'A':
      // left
      moveLeft(); 
      break;
    case 'D': 
    case 'd':
      // right 
      moveRight(); 
      break; 
      // ----------------------------    
      // fly up & down 
    case 'r': 
    case 'R':
      yavatar -= 4;   // fly up
      break;
    case 'f':
    case 'F':
      yavatar += 4;  // down 
      if (yavatar > floorLevel-120) {  // check Floor
        yavatar = floorLevel-120;
      }
      break; 
      // ----------------------------    
      // fly up & down FAST 
    case 'b':
    case 'B':
      // Bird
      yavatar-=400;
      break; 
    case 'n':
    case 'N':
      // un-Bird: go deeper 
      yavatar+=400; 
      if (yavatar > floorLevel-120) { // check Floor
        yavatar = floorLevel-(120);
      }
      break;
      // ----------------------------        
      // crouch 
    case 'c':
    case 'C':
      isCrouching = !isCrouching;
      if ( isCrouching ) {
        // crouch
        yavatar = floorLevel - (avatarCrouchHeight/2);
        avatarActualHeight = avatarCrouchHeight;
      }
      else 
      {
        // stand 
        yavatar = floorLevel - (avatarStandHeight/2); 
        avatarActualHeight = avatarStandHeight;
      } // else 
      break;  
    case 'i':
    case 'I':
      // Saves a TIFF file named "Runner1.tif"
      save("Runner1.tif");
      break; 
      // turn heading without Mouse movement
    case 'p':
    case 'P':
      avatarAngle+=1;
      break; 
    case 'l':
    case 'L':
      avatarAngle-=1;
      break;
      // change distance of Camera to avatar 
    case 'o':
    case 'O':
      RadiusCam+=1;
      break; 
    case 'k':
    case 'K':
      RadiusCam-=1;
      break; 
    default: 
      // do nothing 
      break;
    } // switch
  }  // else
  checkBoundariesAvatar ();
}  // keyPressed

// ------------------------------------------- 
// called by keyPressed() 

void moveForward() {
  // forward 
  xavatar =   Radius*sin(radians(AngleFromMouse)) + xavatar;
  zavatar =   Radius*cos(radians(AngleFromMouse)) + zavatar;
  avatarAngle = AngleFromMouse ;
}

void moveBackward () {
  // backward 
  xavatar =  xavatar- (Radius*sin(radians(AngleFromMouse))) ;
  zavatar =  zavatar- (Radius*cos(radians(AngleFromMouse))) ;
  avatarAngle = AngleFromMouse-180 ;
}

void moveLeft() {
  // avatar moves straight to the left and the camera parallel 
  xavatar =   xavatar- Radius*sin(radians(AngleFromMouse-90)) ;
  zavatar =   zavatar- Radius*cos(radians(AngleFromMouse-90)) ;
  avatarAngle = AngleFromMouse+90 ;
}

void moveRight() {
  // avatar moves straight to the right and the camera parallel 
  xavatar =   Radius*sin(radians(AngleFromMouse-90)) + xavatar;
  zavatar =   Radius*cos(radians(AngleFromMouse-90)) + zavatar;
  avatarAngle = AngleFromMouse-90 ;
}

// ===========================================================================================

void checkBoundariesAvatar () {
  // control camera at walls 
  final float boundary=3975;
  if (xavatar<-boundary) {
    xavatar=-boundary;
  }
  else if (xavatar>boundary) {
    xavatar=boundary;
  }
  if (zavatar<-boundary) {
    zavatar=-boundary;
  }
  else if (zCamera>boundary) {
    zavatar=boundary;
  }
}

void checkBoundariesCamera () {
  // control camera at walls 
  final float boundary=3975;
  if (xCamera<-boundary) {
    xCamera=-boundary;
  }
  else if (xCamera>boundary) {
    xCamera=boundary;
  }
  if (zCamera<-boundary) {
    zCamera=-boundary;
  }
  else if (zCamera>boundary) {
    zCamera=boundary;
  }
}

// ===========================================================================================
// the avatar stuff 

void avatar () {
  // the avatar
  pushMatrix();

  // body
  fill (0,255,0);   
  translate(xavatar, yavatar, zavatar);
  rotateY(radians(avatarAngle)); 
  box(50, avatarActualHeight, 10);

  // head
  fill(0,233,233);
  translate(0, -60, 0);
  // head
  sphere (43);
  // eyes
  translate(20,-20, 36);  
  fill(0);
  sphere (7); 
  translate(-20,0, 6);  
  fill(0);
  sphere (7);   

  // nose
  fill(44,1,1);
  translate(10,20, 0);  
  sphere (7);   

  if (hasEars) {
    pushMatrix(); 
    // ears 
    translate(20,-49, -39);  
    scale (1,3,1); 
    sphere (7);  
    translate(-60,-0, 0);  
    // scale (1,3,1); 
    sphere (7);   
    popMatrix();
  }

  // arms
  fill (200,0,0); // left arm (light red)
  translate(60, 40,-45 );  
  box(93, 30, 10);

  fill (100,0,0); // right arm (dark red)
  translate(-130, 0, 40 );  
  rotateY(radians(60)); 
  box(90, 20, 30);    

  popMatrix();
} // avatar 

// ---------------------------------------------------

void mousePressed () 
{
  // bullet start
  if (canShoot) {
    bulletAngle= AngleFromMouse;  // avatarAngle;  // AngleFromMouse; 
    xbullet = RadiusBullet*sin(radians(bulletAngle)) + xavatar;
    ybullet = yavatar-90 ;  
    zbullet = RadiusBullet*cos(radians(bulletAngle)) + zavatar;
    bulletFlies=true;
  }
}

void showBullet() {
  // bullet flies
  xbullet = RadiusBullet*sin(radians(bulletAngle)) + xbullet;
  ybullet = yavatar ;  
  zbullet = RadiusBullet*cos(radians(bulletAngle)) + zbullet;
  pushMatrix();
  fill(244,1,1);
  translate (xbullet,ybullet,zbullet);
  rotateY (radians(bulletAngle-90));
  box(17,9,9);
  popMatrix();
  checkBoundariesBullet ();
}

void checkBoundariesBullet () {
  // bullet ends
  if (xbullet<-3995) {
    bulletFlies=false;
  }
  else if (xbullet>3995) {
    bulletFlies=false;
  }
  if (zbullet<-3995) {
    bulletFlies=false;
  }
  else if (zbullet>3995) {
    bulletFlies=false;
  }
}

// ===========================================================================================
// the level stuff 

void plane () {
  // plane aka floor 
  pushMatrix();
  translate(0, floorLevel, 0); 
  box(9000, 2, 9000); // big and thin 
  popMatrix();
}

void walls () {

  // 4 walls around level 

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

  float height1; 

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
// ######################################################################


