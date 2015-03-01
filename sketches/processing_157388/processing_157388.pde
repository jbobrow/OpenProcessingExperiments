
int numPoints = 5000;
 
float[] x;
float[] y;
 
float[] xDirection;
float[] yDirection;
  
int index = 0;
 
void setup() {
 
  size(600, 600);
  x = new float[numPoints];
  y = new float[numPoints]; 
 
  xDirection = new float[numPoints];
  yDirection = new float[numPoints]; 
 
  int i = 0;
  while ( i < numPoints ) {
    xDirection[i] = random(-1, 1);
    yDirection[i] = random(-1, 1);
 
    i = i + 1;
  }
}
 
void draw() {
 
  background(255);
  stroke(50, 50, 150);
  fill(random(0,255));
 
  if ( millis() > .01 ) {
    x[index] = random(0, width);
    y[index] = random(0, height);
    index = index + 1;
    if ( index >= numPoints ) {
      index = 0;
    }
  }
 
  int i = 0;
  while ( i < index ) {
    ellipse( x[i], y[i], xDirection[i], yDirection[i] );
 
    x[i] = x[i] + xDirection[i];
    y[i] = y[i] + yDirection[i];
 
    if ( x[i] > width || x[i] < 0 ) {
      xDirection[i] = xDirection[i] * -1;
    }
    if ( y[i] > height || y[i] < 0 ) {
      yDirection[i] = yDirection[i] * -1;
    }
 
    i = i + 2;
  }
}


