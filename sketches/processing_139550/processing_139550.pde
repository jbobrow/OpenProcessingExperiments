
// amanda chung
   
int numPoints = 25000;

int[] x;
int[] y;

int circ = 0;
int sqr = 30;
float c;
float c1;
float c2;

void setup() {
 
  size(800,600);
  x = new int[numPoints];
  y = new int[numPoints];  
  
}

void draw() {

  smooth();

  background(50,20,100);
  noStroke();
  c= random(100,255);
  c1 = random(0,180);
  c2= random(0,800);
  fill(c1,c,250);
  
  if ( mousePressed ) {
    x[circ] = mouseX;
    y[circ] = mouseY;
    circ = circ+ 100;
    sqr = sqr+ 5;
    if ( circ >= numPoints ) {
      circ = 140;
    }
    if ( sqr >= numPoints ) {
      sqr = 10;
    }
  }

  
  int i = 100; 
  while ( i <= circ ) {
    ellipse( c, c2, 1,1 );
    ellipse( x[i], y[i], 2,sqr );
    i = i + 20;
    
    
  }
}


