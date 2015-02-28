
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
  background(25, 32, 25);
  // 2. Head - ellipse(x, y, width, height);
  stroke(255);// black
  fill(270, 200, 20);// white
  //ellipse(250, 250, 250, 400);
  // 3. left eye - rect(x, y, width, height);
  fill(0);// black eye center
  stroke(200, 100, 100);// blue eye color
  strokeWeight(2);// thicker stroke to act as eye color
  ellipse(180, 180, 100, 100);
  // 4. right eye - rect(x, y, width, height);
  ellipse(330, 200, 40, 30);

  noFill();
  beginShape();
  curveVertex(255, 240);// this needs to be right of actual point
  curveVertex(250, 250);
  curveVertex(260, 275);// not be so far right
 // curveVertex(21, 17);
  curveVertex(250, 310);
  curveVertex(252, 300);// this needs to be right of actual point
  endShape();


  // 5. mustache - ellipse(x, y, width, height);
  //stroke(0);
  strokeWeight(0);
  fill(128,1,1);// brown
  //ellipse(250, 325, 350, 20);
  quad(300, 431, 386, 200, 200, 463, 155, 400);
  // 6. mouth - rect(x, y, width, height);
  //fill(255, 0, 0);// red
  //rect(230, 350, 40, 5);
  // 7. nose - ellipse(x, y, width, height);
  fill(255);// white
  noStroke();
  //ellipse(250, 300, 100, 50);
  
 
}



