
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
  fill(227,207,174);// white
  ellipse(250, 250, 300, 400);
  // 3. left eye - rect(x, y, width, height);
  fill(0);// black eye center
  stroke(100, 100, 255);// blue eye color
  strokeWeight(8);// thicker stroke to act as eye color
  ellipse(200, 220, 50, 50);
  // 4. right eye - rect(x, y, width, height);
  ellipse(300, 220, 50, 50);
  // 5. hair
  noStroke();
  fill(185,168,36);
  curve(100,1200,115,175,385,175,400,1200);
  triangle(20, 100, 20, 200, 120, 140);
  triangle(480,100,480,200,380,140);
  fill(98,19,116);
  rect(110,120,15,40);
  rect(370,120,15,40);
  strokeCap(ROUND);
  line(120,20,30,30);
  // 6. mouth - rect(x, y, width, height);
  fill(255,0,0);// red
  rect(230, 350, 40, 5);
  // 7. nose - ellipse(x, y, width, height);
  fill(240,201,201);// white
  noStroke();
  ellipse(250, 275, 50,50);
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


