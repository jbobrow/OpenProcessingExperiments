


                
             void setup() {
  size( 600,600);
  background(#ffffff);
}

void draw() {
  for( float y=0; y<600;  y=y+40){
    for( float x=0; x<600;  x=x+40){
      pushMatrix();
      translate(x,y);
      ellipse(20,20,20,20);
      popMatrix();
    }
  }
}
   
