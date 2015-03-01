
// set global variables
boolean[][] coloured = new boolean[5][5];
int colouredCounter = 0;


void setup() {
  randomSeed( hour() + minute() + second() + millis() );
  size( 560, 560 );
  colorMode(HSB);
  noStroke();
  noLoop();
  selectFiveRectangles();
} // end setup()


void draw() {
  for (int r=0; r<5; r++) {
    for (int c=0; c<5; c++) {
      drawRectangle( c, r );
    } // end for c()
  } //end for r()
} // end draw()


void selectFiveRectangles() {
  // select 5 rectangles to colour red
  while (colouredCounter < 5) {
    int x=int(random(5));
    int y=int(random(5));
    if ( coloured[x][y] == false ) {
      coloured[x][y] = true;
      colouredCounter++;
    } // end if()
  } // end while()
} // end selectFiveRectangles()


void drawRectangle( int c, int r ) {
  color myStroke; // declare rectangle colour variable
  // set colour according to prechosen values (see selectFiveRectangles)
  if (coloured[c][r] == true) {
    myStroke = color( 250, 255, 140 ); // red
  } else {
    myStroke = color( 250, 170, 100 ); // brown
  } // end if()
  // draw rectangle using point() instead of rectangle to apply noise
  int rndX=int(random(20))-10; // create random x displacement
  int rndY=int(random(20))-10; // create random y displacement
  int x = 20 + ( c * 105 ) + rndX; // calculate rectangle left x position
  int y = 20 + ( r * 105 ) + rndY; // calculate rectangle top y poistion
  for (int nx=x; nx<x+100; nx++) {
    for (int ny=y; ny<y+100; ny++) {
      stroke ( myStroke, int(random(200,230)) );
      point( nx, ny );
    } // end for ny()
  } // end for nx()
} // end drawRectangle()


