
/* This is a very simple Procdessing sketch
 *
 * Based on an example from "Getting Started with Processing"
 *
 * Erik Brunvand - 9/1/2011
 */
 
 void setup()
 { 
   size(400,400); // Make a 400 x 400 window
   background(0); // set background to black
   smooth();      // make it smooth... 
   noStroke();    // Don't paint the edges
 }
 
 void draw() {
   float d = random(30,100);
   // If you press the mouse, set color to black
   if (mousePressed) fill(0); 
   // otherwise, set to random color (80% opacity)
   else fill(random(100,255), random(100,255), random(100,255), 80);
   
   // Make an ellipse at the current mouse location
   // It wil lbe in a random color if you're just dragging the mouse
   // and black if you're pressing the mouse
   ellipse(mouseX, mouseY, d, d);
 }
 
    
   

