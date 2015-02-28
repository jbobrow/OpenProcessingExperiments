
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/127341*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
// Miu Ling Lam 2013-09-04

int bg = 255; // Declare and initialize background color bg to white 255

void setup() {
  size(600,600); // Define display window size
  smooth(); // Draw all geometry with smooth
}

void draw() {
  background(bg); // Change background color
  bg = bg - 1; // Decrease bg by 1
  if (bg == -1) // Check if bg < 0 (black is 0)
    bg = 255; // If so, change the value of bg to 255
  ellipse(300, 300, 400, 400); // Draw a circle of width & height = 400 
                               // with its center at coordinates (300, 300)
}
