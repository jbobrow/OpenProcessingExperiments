

void setup() {
  size(400,400);
  smooth();

}


void draw() {
  background(255);
  strokeWeight(2);
  stroke(0);
  for ( int i = 0; i < width ; i = i + 5) {
    line(i,0,i,width); 
  }
 
  
 
}



