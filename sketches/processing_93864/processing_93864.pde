
//HW 8 Cristina Shin cshin1 Copyright Cristina Shin 2013
int y;
int phase;


void setup() {
  size ( 400, 400 );
  smooth( );

}

void draw( ) {
  if (phase == 0 ) {
    design1( );
  } else if (phase == 1 ) {
    design2( ); 

  }
}

void design1( ) {
  background( 40,30,70);

  for (int r = 0; r < width; r = r + 30) {
  for (int s = 0; s < height; s = s + 30) {
      stroke( 165, 100 );
  strokeWeight( 1);
  noFill( );

  ellipse( r, s, width/6, height/6 );



}}}

void design2( ) {
  background (120, 130, 230);

  y = y + 8;
  int x = 0;
  while (x < width)
  {

    stroke(random(200));
    ellipse(x, y, width/6, height/6);
    x = x + 20;
    
    if ( y > width ) {
      y = 0;
    }
  }

}

void keyPressed( ) { 
  if (key == 'z' ) {
  phase = 1;
  } else if (key == 'x') {
  phase = 0;
  }}


