
/* homework 5 sijiaw
        copyright 2013 shirley wang */
        

float dia;
float a, b, wd, ht;

void setup ( ) {
  size ( 400, 400 );
  smooth ( );
 
  
  dia = 50;
  wd  = width;
  ht  = height;
  a   = width  / 2;
  b   = height / 2;
  
}

void draw ( ) {
  
  background ( 227, 229, 213 );
  
  circle ( .5  * wd, .25 * ht );
  circle ( .75 * wd, .5  * ht );
  circle ( .5  * wd, .75 * ht );
  circle ( .25 * wd, .5  * ht );
  
  if ( 175 < mouseX && 225 > mouseX && 75 < mouseY && 125 > mouseY ) {
    sqare ( .44 * wd, .19 * ht );
  } else if ( 275 < mouseX && 325 > mouseX && 175 < mouseY && 225 > mouseY) {
    sqare ( .69 * wd, .44 * ht );
  } else if ( 175 < mouseX && 225 > mouseX && 275 < mouseY && 325 > mouseY) {
    sqare ( .44 * wd, .69 * ht );
  } else if ( 75 < mouseX && 125 > mouseX && 175 < mouseY && 225 > mouseY ) {
   sqare ( .19 * wd, .44 * ht);
  }
}

void circle ( float x, float y ) {
  fill ( 224, 250, 58 );
  noStroke ( );
  ellipse ( x, y, dia, dia);
}

void sqare ( float x, float y ) {
  fill ( 227, 90, 53 );
  noStroke ( );
  rect ( x, y, dia, dia );
}

