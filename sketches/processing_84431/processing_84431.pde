
// header
/******************************************
*  Processing Sketch Monster
*    
*  This is your first homework:
*  Make a monster like character
*  using simple shapes and color properties


*  Scroll to the bottom of the sketch to copy the grid code
*  copy and paste all things between dividing lines like these
/************************************************************************/

/*
*
*  Matt Richard 
******************************************/

// global variables


// setup
void setup(){
  // the setup function gets executed first thing
  // when the sketch loads and only is executed once
  size(500, 500); //size(width, height); in pixels
  smooth(); //this turns on anti-aliasing, makes things look pretty
}

// draw
void draw(){
  // When planning out the sketch you must think back to front like a painting.
  // The first things that you draw will get overlapped by the later things
  
  // 1. turn all pixels on the screen black
  background(0);
  
  // 2. Head - ellipse(x, y, width, height);
  stroke(0);// black
  fill(255);// white
  ellipse(250, 250, 200, 400);
  
  // 3. left eye - rect(x, y, width, height);
  fill(0);// black eye center
  stroke(100, 100, 255);// blue eye color
  strokeWeight(8);// thicker stroke to act as eye color
  rect(200, 200, 20, 20);
  
  // 4. right eye - rect(x, y, width, height);
  rect(270, 200, 20, 20);
  
  // 5. mustache - ellipse(x, y, width, height);
  stroke(0);
  strokeWeight(1);
  fill(128,128,20);// brown
  ellipse(250, 325, 350, 20);
  
  // 6. mouth - rect(x, y, width, height);
  fill(255,0,0);// red
  rect(230, 350, 40, 5);
  
  // 7. nose - ellipse(x, y, width, height);
  fill(255);// white
  noStroke();
  ellipse(250, 300, 100,50);
  
  
  
  
  
  /************************************************************************/
  // copy and include this line at the end of your draw() loop
  grid(50);// grid(spacing); spacing = distance in pixels from one grid line to the next
  /************************************************************************/
  
}





/************************************************************************/
// begin copy here
// copy this whole function, making sure to get everything, even the comments
// paste this code below your draw() like it exists here
void grid(int _spacing){
  pushStyle();// this command, when paired with popStyle
  // allows us to change the stroke and fill commands without
  // changing there values in other parts of the code
  
  // if you need to adjust the color of the grid line
  // do it here
  strokeWeight(3);
  stroke(0, 255, 255, 64);// blue at 25% opacity
  
  // draw vertical lines of grid
  for( int x = 0; x < width; x += _spacing){
   line(x, 0, x, height); 
  }
  // draw horizontal lines of grid
  for( int y = 0; y < height; y += _spacing){
   line(0, y, width, y); 
  }
  
  popStyle();// mates with pushStyle();
}
// end copy here
/************************************************************************/
