
// bring in opengl
import processing.opengl.*;

//CLASSES DECLARED

Blast staffBlast;

void setup () {
  size(1024,900,OPENGL);
  ellipseMode( CENTER );
  rectMode( CENTER );
  frameRate(20);
  smooth();
  
  //INITIALIZE OBJECTS
 staffBlast = new Blast(targeterX, targeterY);
 
 
  
}
//GLOBAL VARIABLES
float xpos,xOffset,velocity,height1,targeterY,targeterX;
float ypos = 750;
boolean crouch = false;
boolean aim = false;
boolean facedLeft = false;
float gravity = 5;
float speed = 20;



color skin1 = color(75,45,12);
color skin2 = color(110,60,0);
color armor1 = color(96,96,96);
color armor2 = color(128,128,128);
color armor3 = color(64,64,64);
color lips1 = color(80,27,10);


// baseline colors
color cBlack  = color(   0,   0,   0 );
color cGray80 = color( 204, 204, 204 );
color cGray90 = color( 230, 230, 230 );
color cRed    = color( 255,   0,   0 );
color cGreen  = color(   0, 255,   0 );
color cBlue   = color(   0,   0, 255 );

// camera parameters for orthographic viewing
float camera_left   = -512;
float camera_right  = 512;
float camera_bottom = -450;   // note flipping signs on bottom and top flips the world
float camera_top    = 450;   // so everything else thinks in terms of y-axis pointing up
                               // --as long as the ortho() call is set up right

float camera_x = xpos;          // now introduce camera "center", and
float camera_y = 450;          // change L,R,B,T to offsets from the center

// pan across the world with the left and right arrow keys
void keyPressed() {
  if ( keyCode == LEFT ) {
    camera_x -= 5;
  } else if ( keyCode == RIGHT ) {
    camera_x += 5;
  }
}







