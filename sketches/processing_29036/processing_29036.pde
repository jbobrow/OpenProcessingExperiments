

// { imaginary opening code block for global variables
// global variables
//int iPos = 200                            // data type 
//int jPos = 200
void setup() {                              // opening code block
  size(450, 450);                           // set up project size
  smooth();                                 // add smooth
}                                           // closing block code

void draw() {
  background(225, 0,0);  // set up background color
  int a = 20;
  // local variable
  for (int i = 0; i < 60; i++) {      // for loops | variable 0 | reaching area 60 | add by 1 | adding 60 times
    for (int j = 0; j < 60; j++) {
      
      fill(255, 0, 0);
      ellipse (i  * 20, j * 20, a, a);
      ellipse (i  * 20, j * 20, a - 10, a - 10);    // set up ellipse position and size
      //ellipse (200,200, 20, 20);
    }
  }
}
// } imaginary closing code block for global variables
























