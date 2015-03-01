
 // Georg Nees Schotter Reproduction by Jim Plaxco, www.artsnova.com
 
 
 
int columns = 12;       // number of columns of squares
int rows = 22;          // number of rows of squares
int sqrsize=30;         // size of each square
float rndStep=.22;      // Rotation Increment in degrees 
float randsum=0;        // Cumulative rotation value 
int padding=2*sqrsize;  // margin area
float randval;          // random value for translation and rotation
float dampen=0.45;      // soften random effect for translation
 
void setup() { 
  size((columns+4)*sqrsize,(rows+4)*sqrsize); 
  background(255);   // set background color to white
  stroke(0);         // set pen color to black
  smooth();          // use line smoothing 
  noFill();          // do not fill the squares with color
  rectMode(CENTER);  // use x,y value as the center of the square
  noLoop();          // execute draw() just one time
} // end of setup()
 
void draw() {
  for (int y=1; y <= rows; y++){
    randsum += (y*rndStep);  // Increment the random value
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
} // end of draw()
