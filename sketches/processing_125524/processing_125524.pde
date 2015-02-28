
size(400, 400);
background(255);
rectMode(CENTER);

// define two variables of type integer
int x = 0;
int y = 0;

// count i from 0 to 9
for (int i = 0; i < 10; i++) {
  // calculate the x value depending on i
  x = i * 40;
  
  // fill the rectangle black if x is less than 200
  if (x < 200) {
    fill(0);
  } else {
    fill(255);
  }
  
  // count j from 0 to 9
  for (int j = 0; j < 10; j++) {
    // calculate the y value depending on j
    y = j * 40;
    
    // draw the rect at x + 20 and y + 20
    rect( x + 20, y + 20, 20, 20);
  }
}
