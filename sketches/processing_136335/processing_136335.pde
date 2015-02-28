
// "Entwined in Sound" by Sarah Kettell
// The inspiration for this sketch came from the visualization of
// sound waves, which are represented by randomly sized lines that
// draw along the canvas. In my mind, the loops break the sound up
// into smaller parts, showing how every thing that we hear is
// a collection of smaller, distinct sounds.

// colour palette
color palette[] = {#C9D3D1, #99BEC3, #94A5B3, #8B7F97, #91637F};

// dimensions
int midHeight = 300;

// setup
void setup() {
  size(800, 600);
  background(palette[0]);
  noLoop();
}

// draw
void draw() {
  
  // variables
  color nextColor = 1;
  int moveRight = 0;
  int varySize;
  
  // draw lines from left to right across canvas
  while (moveRight < width) {
    
    // switches to next color in the palette each line
    while (nextColor < 4) {
      
      // sets the random size of each line
      varySize =  int(random(10,201));
      
      // draws line
      stroke(palette[nextColor]);
      strokeWeight(2);
      line(moveRight, midHeight - varySize, moveRight, midHeight + varySize);
      moveRight += 2;
      nextColor++;
    }
    
    // switches to previous color in the palette each line
    while (nextColor > 1) {
      // sets the random size of each line
      varySize =  int(random(10,201));
      
      // draws line
      stroke(palette[nextColor]);
      strokeWeight(2);
      line(moveRight, midHeight - varySize, moveRight, midHeight + varySize);
      moveRight += 2;
      nextColor--;
    }
  }
  
  // resets moveRight to start on left again
  moveRight = 0;
  
  // draws circles of random size across canvas
  while (moveRight < width) {
    // sets random size
    varySize = int(random(50,200));
    
    // draws circle
    stroke(palette[0]);
    strokeWeight(5);
    noFill();
    ellipse(moveRight, midHeight, varySize, varySize);
    moveRight += varySize/2;
  }
}



