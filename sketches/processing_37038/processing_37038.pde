
// a square sketch produces round circles
size(600, 400);
// smooth the lines out
smooth();
// background color 
background(0);
// remove outlines
noStroke();


// the number of circles per side
int number = 50;
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

    fill((3*(x+y))%255);
    rect(x, y, w, h);
  }
}


