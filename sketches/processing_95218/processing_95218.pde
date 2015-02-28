
void setup() {  //setup function called initially, only once
  size(600, 600);
 
  background( 60 );
   
  noStroke();
 
}
 
void draw() {  //draw function loops
  FanSpin( 60 );
}
 
void FanSpin( int triangles ) {
 
  float alpha = ( (frameCount) *0.01 ) + (TWO_PI / triangles);
  float h = 1.41 * width/2;
  float w = h * sin( alpha );
  int c = 0;
   
  for (int i = 0; i< triangles; i++) {
    if ( i % 2 == 0) c = 0; else c = 255;
 
    pushMatrix();
    translate( width/2, height/2 );
    rotate( alpha * i );
    fill( c );
    noStroke();
    triangle( 0,0, 0, -h, w, -h);
    popMatrix();
  }
 
   
}
