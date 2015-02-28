
/* shirley wang homework 6
      copyright sijia wang 2013 */
      
float rx, ry, rwd, rht, rySpeed;
float ex, ey, eSize, exSpeed, eySpeed;

void setup ( ) {
  
    size ( 400, 400 );
    
    rx= width;
    ry= 400;
    rySpeed= 3;   
    
    ex = 100;
    ey = 100;
    eSize = 50;
    exSpeed = 2;
    eySpeed = -3;
  
}

void draw ( ) {

  smooth ( );
  
  wrapRectangle ( );
  drawRectangle ( 0, 0);
  
  moveImage ( );
  drawImage ( 0, 0 );
  
}


void wrapRectangle ( ) {
  
  ry = ry + rySpeed;
  if ( ry > height * 2.5 ) {
   ry = 0; } 
 
   else if (ry < 0 ) {
     rySpeed = -rySpeed;   } 
}

void drawRectangle ( float x, float y ) {
 pushMatrix ( );
  noStroke ( );
  fill ( 77, 191, width - ex );
  rect ( 0, 0, rx, ry * .4 );  
 
 popMatrix ( );
 
} 


void moveImage ( ) {
  
  ex= ex + exSpeed;
  
  if (( ex > width * .9) || ( ex < 0 )) {
    exSpeed = -exSpeed;
  }
  
  ey = ey + eySpeed;
   if (( ey > height * .9 ) || ( ey < 0 )) {
    eySpeed= -eySpeed;
  }
}


void drawImage ( float a, float b) {
 pushMatrix ( ); 
  fill ( 77, 191, width - ex );
     stroke ( 255, 255, 255 );
     strokeWeight ( 4 );
     ellipse ( ex , ey , eSize, eSize); 
  popMatrix ( );
} 

void keyPressed () {
 
    if ( key == 'a' ) {
    eSize = eSize + 10;
  }
    else if ( key == 's' ) {
    eSize = eSize - 10; } 

}

