
/* Joseph Kotay.  Practice Computational Methods. Professor Nick Senske.  Project One. Drawing Machine
 This composition was inspired by Wall Drawing 614 by Sol LeWitt: http://www.massmoca.org/lewitt/walldrawing.php?id=614
 The wall consists of a series rectangular patterns that have 3 in. wide ink strokes.  The main difference is the fact 
 that I use color in my composition.
 
 Instructions for process:
 
 * Using a square drawing surface, complete the following directions. 
 
 * To get a sense of proportions, draw a vertical line at 1/3 the width of the drawing surface that is 2/3 the height of the screen.
 
 * Draw a horizontal line that is the width of the drawing surface at 1/3 of the height from the bottom margin.
 
 * Draw another horizontal line that starts from the first line, and is at 1/3 the height of the sketch from the top
 margin.
 
 * Using these 4 rectangles that you just created as a framework, generate multiple iterations of compositions
 using smaller rectangles that vary in width and height.
 
 * Make the width and height of each rectangle varying mutliples of 1/3 the width and
 height of the entire sketch. 
 
 *Try to stay with the confines of the first 4 rectangles that the first three lines created.
 
 Processing Instructions:
 
 * Click left mouse button to clear sketch and start again. 
 */

void setup() {
  size(500,500);
  background(255);
  smooth();
  strokeWeight(8);
  frameRate(2);
}

void draw() {



  /*These lines are the fixed contraints that frame my composition. They subdivided
   my sketch using multiples of 1/3 of the width and height of the sketch window. This
   is used to create a clear since of controlled paramaters for the variables within the 
   multiple iterations I want to explore.*/

  line(width/3, 0, width/3, 2*(height/3));
  line(width/3, (height/3), width, height/3);
  line(0,2*(height/3), width, 2*(height/3));

  fill(random(40,255),random(40,255),0,85); 

  // This is the nested loop for the rectangle variations.

  for(int rectX = 0; rectX< width; rectX+= random(width/3, 2*(width/3))) {
    for(int rectY=0; rectY< height; rectY+=random(height/3, 2*(height/3))) {
      rect(rectX, rectY, random(width/3, 2*(width/3)), random(height/3, 2*(height/3)));
    }
  }
}  
void mousePressed() {
  background(255);
  if (mouseButton == RIGHT) {
    noLoop();
  }
}








