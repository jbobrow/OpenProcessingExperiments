
/*
Name: Muhamad Firadaus Khazis
Project: EYES
Description: This sketch tries to extend 
the http://www.generative-gestaltung.de/P_2_2_5_02 sketch by
adding some behaviour.
1. each individual circle is filled with smaller ellipse or iris
2. Each iris will pointing at mouse location.
3. Each ellipse will blink at random time

The script on http://www.generative-gestaltung.de/P_2_2_5_02 
positioned each individual big ellipse by random with condition
it does not intersect and fill in with smaller ellipse in
between the space.

However to understand how eyes will attract to mouse location,
I have built simpler version of grid, and fill in with iris.

Problem: at the moment I cant make each individual iris act
individually (because it is positioned, using grid set in loop). 
Possible solution:
1. I have thought of making number of iris with individual behaviour
but it doesn't seems right and redundant.
2. I have thought about using intersection of line from each
point WITH the individual eyeball ellipse, but it doesn't work out
*/

// GLOBAL VARIABLE
float blackEyePosY;
float blackEyePosX;
int gridX=0; 
int gridY= 0; 

// GLOBAL SETUP
void setup() {
  size (600, 600, P3D);
    }

// DRAWING
void draw () { 
  background (255);
// Creating the grid by using the loop function, with 50 interval
  for (int gridX = 0 ; gridX <width; gridX += 50) {
    for (int gridY = 0 ; gridY <height; gridY += 50) {
      // calling the canvas to work in 3 dimension
      pushMatrix();
      // position the canvas slightly 50 pxl off to right and bottom
      translate (gridX+50, gridY+50, 0);
    fill (255);
    // the eyeball ellipse
      ellipse (0, 0, 40, 40);
      /* map the mouse location from 0 to width/ height of the screen
      into within the eyeball */
       blackEyePosY= map(mouseY,0,height,-10,10); 
       blackEyePosX= map(mouseX,0,width,-10,10);
       // the iris ellipse
       fill(1);
      ellipse (blackEyePosX, blackEyePosY, 20, 20);
      popMatrix ();    
  
    }
  }
}


