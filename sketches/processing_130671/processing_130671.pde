
float spin01, spin02, colorize, increment;

void setup() {

  size( 700, 700 );
  smooth();

  background( #6405FF );
}

void draw() {
  
 
  colorize = random( 255 );
  increment = 1;
  //colorize += increment;
  
  if (colorize == 0 || colorize == 255) {
    colorize -= increment;
//    increment *= -1;
  }

  spin01 += .01;
  spin02 -= .02; 

  strokeWeight( .75 );
  stroke( colorize + random(100),200 );
  fill( colorize );
  pushMatrix();
  rectMode( CENTER );
  translate( width/2, height/2 );
  rotate( spin01 );
  //rect( 0, 0, 275, 275 );
  rectMode( CENTER );
  translate( width/2-200, height/2-200 );
  rotate( spin02 );
  rect( 0, 0, 275, 275 );
  rotate( spin01 );
  rotate( spin01 );
  rect( 0, 0, 275, 275 );
  
  translate( width/2+200, height/2+200 );
  rotate( -spin01 );
  rect( 0, 0, 275, 275 );
  popMatrix();

  fill( #6405FF );
  //ellipse( width/2-100, height/2, 50, 50 );

  pushStyle();
  strokeWeight( 20 );
  stroke( #FF0572, 175 );
  fill( 255 );
  //ellipse( width/2, height/2, 50, 50 );
  popStyle();

  fill( #05FF84 );
  //stroke( 255 );
  //ellipse( width/2+100, height/2, 50, 50 );

  //line( 0, height/2, width, height/2 );
}

