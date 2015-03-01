
/* Code continously creates a grid of 10x10 squares with random width borders, colours and opacity. 
The result is an neverending patchwork of coloured squares and outlines.
*/

// Global Variables
int i = 0;  // For Loop iteration

// Setup Block
void setup() {
  size(600, 600);
  smooth();
  noFill();
  background(#ffffff);
  frameRate(15);

}

// Drawing Block
void draw() {
  
  for (int y = 0; y < height+20; y +=15) {
    for (int x = 0; x < width+20 ; x += 15) {
      stroke(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)),int(random(0, 255)));;
      strokeWeight(int(random(1,5)));
      fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)),int(random(0, 255)));
      rect(x, y, 10, 10);
    }
  }
}



