
// a simple for-loop
// the for loop is a loop made specifically for counting iterations 

void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  background(255);
  // (try the division without the .0 after the 20.. what's the difference?)
  strokeWeight(mouseX/20.0);  
  for (int counter=0; counter < width; counter += 25) {
    line( counter, 0, 0, counter );
    line( counter, height, width, counter );
  }
}


