
int[][] data = new int[16][16];
float  r;
float  g;
float  b; 
float a;




void setup() {
  size(500,500, P3D);
  smooth();

  for( int x = 0; x < 16; x++ ) {
    for( int y= 0; y < 16; y++) {
      data[x][y] = int(random(16));
    }
  }
  frameRate( 10 );
}



void draw() {
 background(255); 
 r = random(255);
 g = random(255);
 b = random(255);
 a = random(255);
 
 translate( width/2, height/2, 0 );
 for( int x = 0; x < 16; x++ ) {
    for( int y= 0; y < 16; y++) {
      pushMatrix();
      fill( r,g,b,a);
      translate( (x-8) * 20, (y-8) * 20, 0 );
      box( 20, 20, 20 * data[x][y]);
      popMatrix();
    }
  }
  
  for( int x = 0; x < 16; x++ ) {
    for( int y= 0; y < 16; y++) {
      data[x][y] += int(random(3))-1;
      if ( data[x][y] > 16 ) data[x][y] = 16;
      if ( data[x][y] < 0 ) data[x][y] = 0;
    }
  }
  
 for( int i = 0; i < 360; i ++ ) {
   int r = int(random( 200 )+100);
   if ( random( 40 ) > 30 ) {
     line ( r * cos( radians( i )), r * sin( radians(i)), 600 * cos( radians(  i )), 600 * sin( radians( i )));
   }
 }
  
  

}

