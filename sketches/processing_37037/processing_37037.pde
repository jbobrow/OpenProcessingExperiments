
// a square sketch produces round circles
size(400, 400);
// smooth the lines out
smooth();
// background color 
background(0);
// remove outlines
noStroke();


// the number of circles per side
int number = 16;
// change to corner mode to place elipses by top left corner
ellipseMode(CORNER);

// calculate width and height of each pattern element in grid
int w = width/number;
int h = height/number;

// embeded for loops for x and y dimensions
for (int i = 0; i<number; i++) {
  for (int j = 0; j<number; j++) {
    
      // calculate x and y coordinates of top left of element
      int x = i*w;
      int y = j*h;
      
    // by determing fill based on i+j we get a checkerboard pattern
    // note: must enclose i+j in () so that mod is done on sum
    // not default eval order ... 
    if ((i+j) % 2 == 0) {
      ellipse(x, y, w, h);
    }
    else if ((i+j) % 3 == 0) {
      rect(x+w/8, y+h/8, w-w/4, h-h/4);
    } 
    else {
      quad(x+w/2,y,x+w, y+h/2,x+w/2,y+h,x,y+h/2);
    }
  }
}


