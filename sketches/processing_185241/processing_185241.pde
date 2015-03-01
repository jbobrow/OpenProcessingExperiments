
//http://www.artsnova.com/Nees_Schotter_Tutorial.html looked up tutorial 
//and read how to do it from there. This is the website. Could not have done it on
//my own without, however I know how to do it and played with it from there.

int columns = 10;       // number of columns
int rows = 10;          // number of rows
int sqrsize=30;         // size of each square
float randstep=.22;      // Rotation Increment in degrees 
float randsum=0;        // Cumulative rotation value 
int padding=1*sqrsize;  // margin area
float randval;          // random value for translation and rotation
float dampen=0.45;      // soften random effect for translation
 
void setup() { 
  size(400, 400); 
  background(255);   // background white
  stroke(0);         // pen color black
  rectMode(CENTER);  // x,y value to center of the square
  noLoop();          // execute draw() just one time
} 
 
void draw() {
  for (int y=1; y <= rows; y++){
    randsum += (y*randstep);  // Increment the random value
    for (int x=1; x <= columns; x++) {
      pushMatrix();
      randval = random(-randsum,randsum);
      translate( padding + (x * sqrsize) - (.5*sqrsize) + (randval*dampen),
         padding + (y * sqrsize) - (.5*sqrsize) + (randval*dampen));
      rotate(radians(randval));
      rect(0,0,sqrsize,sqrsize);
      popMatrix();
    } // end of x loop
  } // end of y loop
} 


