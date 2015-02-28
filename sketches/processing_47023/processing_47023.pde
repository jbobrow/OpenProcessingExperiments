


// fonts =====================================================

PFont font;

// vars ====================================================

int Speed = 3; 

int Line_X = 100;
int Line_Y = 80; 
int Line_Z = -20;

// main functions ========================================

void setup() {
  // automatic init
  size(700, 650, P3D );
  fill(204);
  // noSmooth(); 
  // Create the font on the fly 
  font = createFont("Sans Serif", 80); 
  // font 
  textFont(font);
} // function 

void draw() {
  // automatically loops
  background ( 0, 0, 54 );
  lights();

  // camera 
  camera( 200, 210, Line_Z*.7+920, // eyeX, eyeY, eyeZ	
  -100, 200, -1000000, // centerX, centerY, centerZ	   
  0.0, 1.0, 0.0 );                 // upX, upY, upZ   

  // Floor
  CheckeredFloor();
  // Coordinates x,y and z
  ShowCoordinates (); 

  // flying red line
  stroke(255);
  drawLine (Line_X + 180, Line_Y, Line_Z+407, 
  Line_X + 180, Line_Y, 607 + Line_Z, 
  33, color (230, 10, 0));

  // flying yellow Box
  BoxParameters ( Line_X * 1.32 - 100, Line_Y+230, 1010+Line_Z*1.6, 
  34, 37, 30, 
  0, 0, 45 ); 

  // constant yellow sphere 
  SphereParameters (700, 300, -300, 44); 

  // decline Line_Z means fly further into the screen 
  Line_Z-= Speed;
} // function 

// minor functions ========================================
// CheckeredFloor and ShowCoordinates

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

void ShowCoordinates () {
  // Show Coordinates x, y and z

  // X 
  stroke (255, 0, 0);
  line (0, 0, 0, 100, 0, 0 ) ; 
  fill(255, 0, 0);
  SphereParameters (100, 0, 0, 13); 
  text ("X", 120, 60, 0); 

  // Y
  stroke    (0, 255, 0); 
  line (0, 0, 0, 0, 100, 0 ) ;     
  fill(0, 255, 0);
  SphereParameters (0, 100, 0, 13);     
  text ("Y", 0, 180, 0); 

  // Z 
  stroke (0, 0, 255);
  line (0, 0, 0, 0, 0, -300 ) ;  
  fill(0, 0, 255);
  SphereParameters (0, 0, -300, 33);     
  text ("-Z", 30, 50, -300);
} // function 

// ===================================================
// functions for 3D Shapes

void SphereParameters ( float x, float y, float z, 
float w ) {
  // Position and size of a sphere
  noStroke(); 
  pushMatrix();
  translate ( x, y, z );
  sphere ( w );
  popMatrix();
} // function 

void BoxParameters ( float x, float y, float z, 
float w, float h, float d, 
float RotateX, float RotateY, float RotateZ ) {
  // Position and size and rotation of a box 
  noStroke(); 
  fill (254, 254, 1);
  pushMatrix();
  translate ( x, y, z );
  rotateX ( radians(RotateX) );
  rotateY ( radians(RotateY) );
  rotateZ ( radians(RotateZ) );  
  box ( w, h, d );
  popMatrix();
} // function 

void drawLine ( float x1, float y1, float z1, 
float x2, float y2, float z2, float weight, color strokeColour)
// drawLine programmed by James Carruthers
// see http://processing.org/discourse/yabb2/YaBB.pl?num=1262458611/0#4
// It is a 3D-replacement for the Line from x1,y1,z1 to xy,y2,z2 with 
// weight and strokeColour. 
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
  translate(v1.x, v1.y, v1.z);
  rotateZ(the);
  rotateY(phi);
  noStroke();
  fill(strokeColour);
  box(weight, weight, p1.dist(p2)*1.2);
  popMatrix();
} // function 


