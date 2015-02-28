
// In-class assignment
// WEEK 8: ARRAY ASSIGNMENT
int[] x = {50,61,83,69,71,50,29,31,7,39};
int[] y = {8,37,43,60,82,90,82,60,43,37};

int[] x2 = new int[5]; // dynamically allocated array
int[] y2 = new int[5];

void setup() {
  size(400,400);
  //colorMode(HSB);
  
  // first, draw the gradient
  for (int i=0; i<400; i++) {
    float percent = (float)i / 400;
    stroke(255*percent);
    line(0,i,400,i); } // for(i<400, i+=40) 
  
  // next, draw the grid
  for (int i=0; i<400; i+=40) {
    stroke(255);
    line(0,i,400,i);
    line(i,0,i,400); } // for(" ")
  
  // then, draw the shape
  for(int i=60; i<440; i+=80) { // start with x-coordinate at 40.
    pushMatrix();
      translate(i,i-80);        // start with y-coordinate 80 units higher
      starShape();
    popMatrix();
    pushMatrix();
      translate(80, 40);
      rotate(QUARTER_PI);
      starShape();
    popMatrix(); } } // setup()

void starShape() {
  // beginShape() and endShape() are to be used
  beginShape();
    for (int i=0; i<x.length; i++) {
      vertex(x[i],y[i]); } // for(i<x.length, i++)
  endShape();
    
} // starShape()


