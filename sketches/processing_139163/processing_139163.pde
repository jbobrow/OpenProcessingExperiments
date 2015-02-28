
int numPoints = 5000;

int[] x;
int[] y;
int[] px;
int[] py;
int[] r;
int[] g;
int[] b;

int index = 0;

void setup() {

  size(600, 600);
  x = new int[numPoints];
  y = new int[numPoints];
  px = new int[numPoints];
  py = new int[numPoints];
  r = new int[100];
  g = new int[100];
  b = new int[100];
  
}

void draw() {

  background(255);
  noStroke();


  if ( mousePressed ) {
    x[index] = mouseX;
    y[index] = mouseY;
    px[index] = pmouseX;
    py[index] = pmouseY;
    r[index] = round(random(0,255));
    g[index] = round(random(0,255));
    b[index] = round(random(0,255));
    index = index + 1;
    if ( index >= numPoints ) {
      index = 0;
    }
  }

  int i = 0; 
  while ( i < index ) {
  fill(r[i],g[i],b[i],10);
    triangle( x[i], y[i], px[i], py[i], 300, 300);
  
    i = i + 1;
  }
}

