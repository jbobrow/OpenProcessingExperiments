
// Assignment 2
// Computational Arts : Processing
// Coursera
// Drawing 100 squares with random position, random size
// and random color from color palette array
// The square will be drawn only if it's entirely inside the canvas
// Last update : 18 February 2014

// Define Color Palette
color[] palette = {#000000, #210CE8, #BF142A, #087F24, #FFF421, #E76011};
int counter;

// Setup
void setup(){
  // window size for this assignment
  size(900, 900);
  // set background with the first color from the palette
  background(palette[0]);
}

void draw(){
  while (counter < 100) {
    // set color random from palette
    stroke(palette[int(random(1, 6))]); 
    strokeWeight(2);
    noFill();
    
    // set square origin location
    float x = random(10, width);
    float y = random(10, height);
    
    // set size of square
    float s = random(10, width/4); 
    
    // draw square if not out of screen
    if ((x+s < width-10) && (y+s < height-10)) {
      rect(x, y, s, s);
      // increment counter
      counter++;
    }
  }
}



