
//Performative Architecture Studio- Task 1
//By Kirilly Barnett
//Attractor Point Sketch_Invert
 
//For Performative Architecture Studio (The University of Melbourne).
//Research information gathered from Gennware Tutorials.
//Orginal code from the processing portfolio of Mark Lukas on OpenProcessing.org 

//GLOBAL VARIABLES
int space = 25;                 //space between circles
float influence = 130;          //Effect on surrounding circles
float minRadius = 20;           //Min circle
float maxRadius = 100;          //Max circle

//SETUP
//Initialize variable. To happen once at the beginning of the code.
void setup () {
  size (600, 600, P3D);         //Window size and engine.
}

//DRAW
// Functions that draw and display in every frame
// Draw circle
void draw () {
  background (0);
  circle (0, 255, 255, 255, 100);
}

// Define loop / repeat
void circle (float contour, float _r, float _g, float _b, float _y) {
  strokeWeight(contour);
  stroke(1);
  fill (255, 45);             //colour and opacity (aplha)

  for (int x = 15; x <width; x += space) {
    for (int y = 15; y <height; y += space) {

      // Using position tracking
      float radius = 1 - (min (dist (x, y, mouseX, mouseY), influence) / influence);
      radius = lerp (minRadius, maxRadius, radius); 
      // Lerp- Calculates a number between two numbers at a specific increment.
      ellipse (x, y, radius, radius);
    }
  }
}



