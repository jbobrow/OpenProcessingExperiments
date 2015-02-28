
float y=100;
void setup() {
  size(200,200);
}
void draw() {
  for( int y=2; y<200; y=y+20 ) {
    for( int x=2; x<200; x=x+20) {
      noStroke();
      fill(random(255),random(100),random(80),random(255));
      rect(x,y,15,15);
  }
 }
}

           
