
// header
/******************************************
 *  Processing Sketch Monster with Interaction
 *   
 *  
 *  Take your monster character and draw it using variables
 *  then add some interaction by using if statements and mousepressed
 
/************************************************************************/

/*
*
 *  Matt Richard
 ******************************************/

// global variables


// setup
void setup() {
  // the setup function gets executed first thing
  // when the sketch loads and only is executed once
  size(500, 500); //size(width, height); in pixels
  smooth(); //this turns on anti-aliasing, makes things look pretty
}

// draw
void draw() {
  // When planning out the sketch you must think back to front like a painting.
  // The first things that you draw will get overlapped by the later things

  // 1. turn all pixels on the screen black
  background(0);

  draw_face( mouseX, mouseY );

}


void draw_face(int _x, int _y) {
  // 2. Head - ellipse(x, y, width, height);
  stroke(0);// black
  fill(255);// white
  ellipse(_x, _y, 200, 400);

  // 3. left eye - rect(x, y, width, height);
  fill(0);// black eye center
  stroke(100, 100, 255);// blue eye color
  strokeWeight(8);// thicker stroke to act as eye color
  if ( mousePressed ) {
    rect(_x - 50 + random( -5, 5 ), _y - 50 + random( -5, 5 ), 20, 20);
  } 
  else {
    rect(_x - 50, _y - 50, 20, 20);
  }

  // 4. right eye - rect(x, y, width, height);
  if ( mousePressed ) {
    rect(_x + 20 + random( -5, 5 ), _y - 50 + random( -5, 5 ), 20, 20);
  } 
  else {
    rect(_x + 20, _y - 50, 20, 20);
  }

  // 5. mustache - ellipse(x, y, width, height);
  stroke(0);
  strokeWeight(1);
  fill(128, 128, 20);// brown
  if ( mousePressed ) {
    ellipse(_x, _y + 75, 200, 20);
  } 
  else { 
    ellipse(_x, _y + 75, 350, 20);
  }

  // 6. mouth - rect(x, y, width, height);
  fill(255, 0, 0);// red
  if ( mousePressed ) {
    rect(_x - 50 + random( -5, 5 ), _y + 100 + random( -5, 5 ), 100, 40);
  }
  else {
    rect(_x - 20, _y + 100, 40, 5);
  }

  // 7. nose - ellipse(x, y, width, height);
  fill(255);// white
  noStroke();
  ellipse(_x, _y + 50, 100, 50);
}
