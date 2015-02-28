
size(400, 400);
background(255);

fill(0);

// count i from 0 to 39
for (int i=0; i<40; i++) {
  
  // remember the current stat of coordinate system
  pushMatrix();
  
  // calculate size relative to i
  float w =  i / 4.0;
  
  // count j from 0 to 39
  for(int j=0; j<40; j++) {
    rect(0, 0, w, w);
    
    // rotate the coordinate system by 1 degree
    rotate(radians(1));
    // move coordinate system by 15 pixels in y direction
    translate(0, 15);
  }
  // restore the previously remembered state
  popMatrix();
  
  // move coordinate system by 15 pixels in x direction
  translate(15, 0);
}
