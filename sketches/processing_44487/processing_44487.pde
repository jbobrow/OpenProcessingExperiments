
//Timmis Paint

void setup() {
  size( 500,500 );
  frameRate( 60 );
  smooth();
  noStroke();
}


void draw() {
  fill( 100, 1 );
  rect( 0, 0, 500, 500 );


  if( mousePressed == true )
  fill( 21, 234, 179 );
  ellipse( mouseX -10, mouseY -10, 10, 10 );
  }


