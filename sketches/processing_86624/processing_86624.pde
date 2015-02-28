
void setup() {
  size(400,400);
  smooth();
  
  strokeWeight(10);
}


void draw () {
  background(0);
  stroke(255);
  for ( int i = 0 ; i < 400 ; i++ )  {
    float x = random( 0, width);
    float y = random ( 0, height);
    point(x,y);
  }
  
}
