
//PRESS ANY KEY TO SEE SHADOW OF THE DRAWING

int numPoints = 5000;

int[] x;
int[] y;

int index = 0;

void setup() {

  size(600, 600);
  x = new int[numPoints];
  y = new int[numPoints];
}

void draw() {

  background(255);
  stroke(50, 50, 150);
  fill(150, 150, 255);

  if ( mousePressed ) {
    x[index] = mouseX;
    y[index] = mouseY;
    index = index + 1;
    if ( index >= numPoints ) {
      index = 0;
    }
  }

  // use a while loop here to draw all the points in some way
  int i = 0; 
  while ( i < index ) {
    stroke(0);
    fill(255);
    ellipse( x[i], y[i], 10, 10 );
    i = i + 1;

    if (keyPressed == true) {
      fill (0);
      ellipse ( x[i]+2, y[i]+2, 10, 10 );
    } 
    else {
      ellipse( x[i], y[i], 10, 10 );
      i = i + 1;
    }
  }
}



