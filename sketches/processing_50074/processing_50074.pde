
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/50074*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
void setup(){
  size(400,400);    // Sets the window size.
  frameRate (30);   // The code in void draw() will be updated every 30 milliseconds.
}

float v;          // Float variable to move the sun slowly downward.
int rojo=247;     // Red variable for background, initialized .
int verde=196;    // Green variable for background, initialized.
int azul=65;      // Blue variable for background, initialized.

void draw(){
 
  background (rojo,verde,azul);  // Background colour set with current RGB values.
  fill (165,37,12);              // Set ellipse's colour with RGB values.
  stroke(0);                     // The stroke() function determines the colour
                                 // of the ellipse's outline.
  smooth();                      // Smooth ellipse's outline.
  ellipse(mouseX,v,50,50);       // Set ellipse's position and size. The horizontal 
                                 // position is set with the mouse, the vertical 
                                 // position is set with the 'v' variable. Both 
                                 // vertical and horizontal radius' are set to 50.
  
    
  
  v = v + 0.5;    // Increment 'v' value by 0.5. This moves the ellipse slowly but 
                  // relatively smoothly in conjuntion with the frame rate established
                  // at the setup().
  
  if (v == 450){              // Checks if 'v' value is equal to 450. If so, 
                              // re-initialize 'v' value to -50. 450 is 50 over 
                              // the vertical edge of the window. This ensures
                              // that the ellipse is completely out of sight before
                              // re-initialization. Same goes for re-initializing 
                              // to -50, the ellipse is created out of sight, instead 
                              // of just appearing half-way.
                              
    rojo= int(random(255));   // Once the ellipse reaches 450, the RGB values will
    verde= int(random(255));  // be randomized. The int() function must be used to
    azul= int(random(255));   // round off any decimal points created by the random()
                              // function. This will return a random integer value
                              // between 0 and 255. These values will then be used 
                              // by the background() function to set a new colour
    
    v = -50;        // Re-initializing 'v' to -50 makes the ellipse come in from the
                    // top of the window. Try setting this to zero '0' to see what I 
                    // mean. 
  }
}




