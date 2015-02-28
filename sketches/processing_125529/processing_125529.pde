
size(400, 400);
background(255);

noFill();

// remember the current state of the coordinate system
pushMatrix();
  // move the coordinate system to x=100 and y=200
  translate(100, 200);
  rect(0, 0, 50, 50);
  ellipse(0, 0, 50, 50);
  
  // remember the now current state of the coordinate system
  pushMatrix();
    // rotate the coordinate system by 45 degrees
    rotate(radians(45));
    rect(0, 0, 50, 50);
  // restore the previous state of the coordinate system
  popMatrix();
  
  // move the coordinate system to x=100
  translate(100, 0);
  
  // scale the coordinate system by half
  scale(0.5);
  rect(0, 0, 50, 50);
  
// restore the first remembered state of the coordinate system
popMatrix();

// move the coordinate system to x=100
translate(100, 0);
rect(0, 0, 50, 50);
