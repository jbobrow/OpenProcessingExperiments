
int cols = 10;
int rows = 10;

void setup () {
  size ( 400, 400);
  background ( 0);
  smooth ();
}

void draw () {

  for ( int i=1; i<cols; i++) {
    for ( int j=1; j<rows; j++) {
      fill ( 255);
      ellipse ( i*(width/cols), j*(height/rows), 30, 30);
    }
  }
}

