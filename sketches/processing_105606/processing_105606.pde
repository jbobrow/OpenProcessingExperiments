
// Basic for loop, a grid

size(400, 400);
background(20);
//stroke(100);

//Initialize; Test; Increment 
//for (int i = 0; i<400; i+=10) {
//  // Horizontal Lines
//  line(0, 0+i, 400, 0+i);
//  point(10, 10+i);
//}
//
////VErtical Lines
//for (int j = 0; j<400; j+=10 ) {
//  //  line(0+j, 0, 0+j, 400);
//}

//COMBINED LINES...
//Initialize; Test; Increment 
for (int i = 0; i<400; i+=10) {
  for (int j = 0; j<400; j+=10 ) {
    // Horizontal Lines
   // stroke(200, 0, 0);
     line(0, 0+i, 400, 0+i);

    //Vertical 
  //  stroke(0, 0, 200);
    line(0+j, 0, 0+j, 400);
  }
}



//RECTS 
for (int i = 0; i<400; i+=10) {
  for (int j = 0; j<400; j+=10 ) {
    // Horizontal Lines
    stroke(100, 200, 100);
    fill(250, 200, 50);
    rect(0+i, 0+j, 40, 40);
  }
}
