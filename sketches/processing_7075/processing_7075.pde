



// Is like Windows Screensaver with 3D-Tubes

// use space and r 

// To Do: whole cube rotates slowly
//        collision detection with old tubes

// imports ---------------------------

// use tube from 3DShapes by quark
import shapes3d.utils.*;
import shapes3d.*;

// vars -----------------------------

// one tube length
final float MaxLength = 700; 
// size of whole containing box from 0 to 
float boundaries = 800.0; 

// speed of movement
int speed = 4; 

// Vectors
PVector OldPosition;
PVector Buffer; 

// tube 
Tube tube;

// direction 
int direction=0;
int oldDirection=-1;

// Movement vars 
boolean showMovie = false; 
boolean boolCommandToEndMovie = false; 
boolean boolCodeMovieYesNo = false; 
int lengthMovie=0; 
float Length = 0;

// sphere
color sphereColor = color(0,155,0); 

// pairs 
int[] numbers = new int[6];


// Main functions ---------------------------- 

void setup() {

  // Init

  size ( 850, 650, P3D ); 
  background (117);
  OldPosition = new PVector(230, 230, -230);
  Buffer = new PVector(230, 230, -230);
  noStroke();
  camera(440, 440, 2700, 
  20, 720, 0, 
  0, 1, 0);
  // smooth(); 
  tube = new Tube(this, 8, 60);
  // tube.setTexture("sampler01.jpg");
  tube.fill(color(155,0,0));
  // tube.setSize(100,30,30,100,240);
  fill (155,0,0);

  numbers[0] = 1;
  numbers[1] = 0;
  numbers[2] = 3;
  numbers[3] = 2;
  numbers[4] = 5;
  numbers[5] = 4;

} // setup 

void draw() {

  // loop in draw to draw 

    // stage lighting
  directionalLight(200, 200, 400, 100, 150, -400);
  ambientLight(160, 160, 160);

  // material 
  shininess(2.0);
  specular(255, 255, 255); 

  if ( ! showMovie ) {

    // INIT MOVIE 

    // Length
    Length = random (180,MaxLength); 
    // Angle
    direction = getDirection(oldDirection);
    oldDirection=direction ; 
    OldPosition.set( Buffer.x,Buffer.y,Buffer.z);
    lengthMovie=0; 
    showMovie=true; 

  }
  else 
  {

    // SHOW MOVIE 
    MyTube2 ( OldPosition.x,OldPosition.y,OldPosition.z, 
    32,lengthMovie,direction,color(253,0,0));  
    // if end-position is reached
    if ((lengthMovie >= Length) || (boolCommandToEndMovie) ) { 
      // stop movie 
      // decide color sphere
      if (boolCommandToEndMovie == true) { 
        // green
        sphereColor = color(0,155,0); 
      } 
      else  { 
        // blue
        sphereColor = color(0,0,155); 
      } 
      endMovie(); 
      boolCommandToEndMovie = false;
    } 
    else {
      // continue movie
      if (boolCodeMovieYesNo){
        lengthMovie=lengthMovie+speed;   
      } 
      else
      {
        lengthMovie=int(lengthMovie + Length); 
      }
    }
  }

} // draw 

void keyPressed(){
  switch(key){
  case ' ':
    // Space
    background (117);
    break;
  case 'r':
    // toggle
    boolCodeMovieYesNo = !boolCodeMovieYesNo;
  default:
    break; 
  }

} // keyPressed 

// Other functions ---------------------------- 

void MyTube2(float x1, float y1, float z1, 
float weight, float myDistance, int direction, 
color strokeColour)  {

  pushMatrix();

  tube.setSize ( weight,weight,weight,weight, myDistance);

  switch (direction) {
  case 0:
    translate(x1+myDistance/2,y1,z1);
    rotateZ(radians(-90));
    if (x1+myDistance > boundaries) {
      Buffer.set(x1+myDistance,y1,z1);
      boolCommandToEndMovie = true; 
    }   
    else {
      Buffer.set(x1+myDistance,y1,z1); 
    }
    break; 
  case 1:
    translate(x1-myDistance/2,y1,z1);  
    rotateZ(radians(90));
    if (x1-myDistance < 0) {
      Buffer.set(x1-myDistance,y1,z1);
      boolCommandToEndMovie = true; 
    } 
    else {
      Buffer.set(x1-myDistance,y1,z1); 
    }
    break; 

  case 2:
    translate(x1,y1+myDistance/2,z1);    
    rotateY(radians(-90));
    if (y1+myDistance > boundaries) {
      Buffer.set(x1,y1+myDistance,z1);
      boolCommandToEndMovie = true; 
    }    
    else {
      Buffer.set(x1,y1+myDistance,z1);
    }
    break; 
  case 3:
    translate(x1,y1-myDistance/2,z1);      
    rotateY(radians(90));
    if (y1-myDistance < 0) {
      Buffer.set(x1,y1-myDistance,z1);
      boolCommandToEndMovie = true; 
    }      
    else {
      Buffer.set(x1,y1-myDistance,z1);
    }
    break; 

  case 4:
    translate(x1,y1,z1+myDistance/2);      
    rotateX(radians(-90));
    if (z1+myDistance > boundaries) {
      Buffer.set(x1,y1,z1+myDistance);    
      boolCommandToEndMovie = true; 
    }          
    else {
      Buffer.set(x1,y1,z1+myDistance);     
    }
    break; 
  case 5:
    translate(x1,y1,z1-myDistance/2);        
    rotateX(radians(90));
    if (z1-myDistance < 0) {
      Buffer.set(x1,y1,z1-myDistance);    
      boolCommandToEndMovie = true; 
    }          
    else {
      Buffer.set(x1,y1,z1-myDistance);     
    }
    break; 
  default:
    break; 
  } // switch 

  tube.draw();  
  popMatrix();

} // function 

int getDirection (int oldDirection) {  

  // Generate new dir with 
  // a) old-dir != new-dir
  // b) when old-dir =x or =-x, new-dir is not 
  // allowed to be the opposite (called "isPair")

  int Buffer = 0; 
  int i=0;
  Buffer = int(random (0,6)); 
  // as long as i small enough and values bad: repeat find new direction
  while ( (i<12) && (( Buffer == oldDirection ) || (isPair (Buffer, oldDirection))  ) ) {
    Buffer = int(random (0,6)); 
    i=i+1;
  }
  return(Buffer);
}

boolean isPair (int direction, int oldDirection) {
  // Ist es ein Paar? Wenn Ja, ist es schlecht, da er 
  // dann bspw. nach rechts gehen würde, wenn er 
  // vorher gerade nach links gegangen war. Also in sich 
  // selbst zurück. Was doof aussieht. 
  // Paare sind links/rechts, vorne/hinten und oben/unten.
  boolean Buffer = false; 
  if (numbers[direction] == oldDirection) {
    Buffer=true; 
  } // if 
  return (Buffer); 
} // function 

void endMovie() {

  // function to stop the movie 
  showMovie=false; 
  // optional sphere: green or blue 
  fill (sphereColor);
  pushMatrix();
  translate (Buffer.x, Buffer.y, Buffer.z);
  sphere (37);
  popMatrix();      
  // green
  sphereColor = color(0,155,0); 
}








