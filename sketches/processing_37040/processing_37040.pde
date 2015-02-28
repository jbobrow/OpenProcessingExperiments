
size(600, 400);
background(255); // white ground
stroke(255,0,0); // red lines

// set initial increment between lines
int increment = 12;

// loop down sketch until y exceeds height
for (int y = 0; y<height; y+=increment) {
  
println(y); // debug: look at y value

  // draw line across sketch at current y
  line(0, y, width, y);
  
  // decrement y so that each subsequent line is closer together
  increment--;
  // if the increment is < 1 reset making a pattern
  if (increment<1) {
    increment = 10;
  }
}


