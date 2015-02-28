
size(400, 400);
background(255);
rectMode(CENTER);
fill(0);

// define 3 variables, x-Position, y-Position and Width
float x = 20;
float y = 20;
float w = 20;

// count i from 0 to 21
for (int i=0; i<22; i++) {
  // set the width to a sin calculation relative to x
  w = sin( (100 - x) / 100 ) * 10 + 20;
  
  // count j from 0 to 12
  for (int j=0; j<13; j++) {
    
    // set y in relation to the j-counter
    y = j * 30 + 20;
    
    // draw the rect at x-Position, y-Position with width w
    rect(x, y, w, 20);
  }
  
  // add the width and 10 to x
  x = x + w + 10;
}
