
float spin01, spin02;

void setup() {

  size( 700, 700 );
  smooth();

  background( #6405FF );
}

void draw() {

  spin01 += .01;
  spin02 -= .02; 

  strokeWeight( .5 );
  fill( 255 );
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

