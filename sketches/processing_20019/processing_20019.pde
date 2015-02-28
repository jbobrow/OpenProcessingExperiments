
// better way: use a loop!
// the while() loop allows us to repeat a portion 
// of code as long as a condition is true

int d = 60; 

void setup() {
  size(600, 100);
  smooth();
}

void draw() {
  background(128);   
  int counter = 0;
  while( counter <= width ) {
    ellipse(counter, height/2, d, d);
    counter = counter + d;  
    //println("Counter is now: " + counter);
  }
}

