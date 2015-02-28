
color[][] c0;
color[][] c1;
int w=49;
int h=33;
int last=0;
float r;
void setup() {
  size(199,264);
  c0 = new color[w][h];
  c1 = new color[w][h];
  //frameRate(2);
  for( int y=0; y<h; y++ ) {
    for( int x=0; x<w; x++ ) {
      c1[x][y] = color(0);
      c0[x][y] = color(random(255),random(255),random(255));
    }
  }
  background(0);
   
}
 
void draw() {
  r=r+0.01;
  if( r>1 ) r = 1;
 
  noStroke();
  for( int y=0; y<h; y++ ) {
    for( int x=0; x<w; x++ ) {
      color c = lerpColor(c1[x][y],c0[x][y],r);
      fill( c );
      rect( x*4+2,y*8+0,3,7);
    }
  }
     
  if( millis() - last > 3000 ) {
    last = millis();
    r = 0;
    for( int y=0; y<h; y++ ) {
      for( int x=0; x<w; x++ ) {
        c1[x][y] = c0[x][y];
        c0[x][y] = color(random(255),random(255),random(255));
      }
    }
  }
   
  windows();
}
 
void windows() {
  stroke(0);
  strokeWeight(1);
  for( int x=1; x<width; x+=4 ) {
    line(x,0,x,height);
  }
}

