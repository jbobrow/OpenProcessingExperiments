

                void setup() {
  size(200,200);
}

void draw() {
  for( float y=10; y<200; y=y+20) {
    for( float x=10; x<200; x=x+20) {
    ellipse(x,y,10,10);
    ellipse(10,10,10,10);
    }
  }
  
  

  
}
