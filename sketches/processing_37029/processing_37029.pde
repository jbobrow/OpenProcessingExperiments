
// a square sketch produces round circles
size(400, 400);
// smooth the lines out
smooth();
// background color red
background(255,51,51);
// remove outlines
noStroke();


// the number of circles per side
int number = 16;
// change to corner mode to place elipses by top left corner
ellipseMode(CORNER);

// embeded for loops for x and y dimensions
for (int i = 0; i<number; i++) {
  for (int j = 0; j<number; j++) {
    // by determing fill based on i+j we get a checkerboard pattern
    // note: must enclose i+j in () so that mod is done on sum
    // not default eval order ... 
    if ((i+j) % 2 == 0) {
      fill(0); // black
    }
    else {
      fill(255); // white
    } 
    // draw ellipse at a fraction of sketch width and height
    // at size based on fraction of width and height
    ellipse(i*width/number, j*height/number, width/number, height/number);
  }
}


