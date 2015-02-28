
size(400, 400);
background(255);
rectMode(CENTER);
fill(0);

// define 3 variables, x-Position, y-Position and Width
float x = 20;
float y = 0;
float w = 20;

// count i from 0 to 21
for (int i = 0; i < 22; i++) {
  // multiply the width by 0.9 and save into variable
  w = w * 0.9;
  
  // count j from 0 to 21
  for (int j = 0; j < 13; j++) {
    
    // set y in relation to the j-counter
    y = j * 30 + 20;
    
    // draw the rect at x-Position, y-Position with width w
    rect( x, y, w, 20);
  }
  
  // add the width and 10 to x
  x = x + w + 10;
}
