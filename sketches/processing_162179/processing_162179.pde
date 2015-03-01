
void setup() {
  size(500,500);
  smooth();
}

void draw() {
  translate( width/2, height/2);
  scale( 0.25 );
  background(255);
  stroke(0);
  noFill();
  for( int i=0; i<360; i++ ) {
    float f = i * map( mouseY, 0, height, .2, 5 );
    float x = cos( radians( i * 4 )) * f;
    float y = sin( radians( i * 4 )) * f;
    float r = i * map( mouseX, 0, width, .2, 5 ) ;
    ellipse(  x, y, r, r );    
  }
  
}
