
// header
/******************************************
*  Processing Sketch Monster
*    
*  This is your first homework:
*  Make a monster like character
*  using simple shapes and color properties
*
*  Matt Richard 
******************************************/

// global variables


// setup
void setup(){
  // the setup function gets executed first thing
  // when the sketch loads and only is executed once
  size(600, 600); //size(width, height); in pixels
  smooth(); //this turns on anti-aliasing, makes things look pretty
}

// draw
void draw(){
  // When planning out the sketch you must think back to front like a painting.
  // The first things that you draw will get overlapped by the later things
  
  // 1. turn all pixels on the screen brown
  background(113, 80, 45);
  // 2. Head - ellipse(x, y, width, height);
  noStroke();// none
  fill(216, 102, 63);// orange
  ellipse(250, 205, 370, 345);
  // 3. left eye - rect(x, y, width, height);
  fill(70);// gray
  stroke(0);// black stroke
  strokeWeight(18);// thicker stroke to act as eye color
  ellipse(320, 170, 100, 120);
  // 4. eye part 2;
  ellipse(320, 170, 30, 30);
  // 5. ear
  noStroke();
  fill(216, 102, 63);// orange
  triangle(410, 128, 532, 178, 420, 223);
  // 6. mouth - rect(x, y, width, height);
  fill(180,0,0);// red
  ellipse(203, 283, 220, 113);
  // 7. nose - ellipse(x, y, width, height);
  fill(255);// white
  noStroke();
  ellipse(120, 120, 20, 20);
  
  fill(255);// white
  noStroke();
  ellipse(159, 133, 20, 20);
}


