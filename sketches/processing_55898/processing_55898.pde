


int centerX, centerY, total, c;
float[] centersX;
float[] centersY;
color[] colors;
color bg;
int ballSize;

void setup(){
  ballSize = 50;
  size(500,500);
  background(0);
  noStroke();
  noCursor();  // AMAGA EL CURSOR
  total = 100; 
  centersX = new float[total];
  centersY = new float[total];
  colors = new int[total];
  for( c = 0; c< total; c++ ) {
    colors[c] = color( random(255), random(255), random(255) );
    centersX[c] = random( 0, width);
    centersY[c] = random( 0, height);
  }
  //colorMode(RGB, 100);
  bg = color( 0, 0, 0 , 2 );
}

void draw() {
  for( int c = 0; c< total; c++ ) {
    fill( colors[c] );
    ellipse( centersX[c] - ballSize, centersY[c] - ballSize , ballSize, ballSize);
    centersX[c] = ((centersX[c]+1) % (width+(ballSize*2)) ) ;
    centersY[c] = ((centersY[c]+1) % (height+(ballSize*2)) ) ;
  // QUE GUAY AIXO >> centerX = (centerX+1) % width;
  }
  fill( bg );
  rect( 0,0,width,height );
  
}
