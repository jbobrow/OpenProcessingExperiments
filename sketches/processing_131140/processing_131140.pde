
/**
 Katie Manduca
 
 This is a modified version of the Lissajous code shown 
 in class (Thank you Professor Andrews!).
 
 This code draws a Lissajous figure and connects all the points together
 in order to create a lattice effect. I modified this code by altering 
 the parameters based on readings from an EEG. This creates a changing 
 figure with a complexity reflecting the interactions of 4 different inputs
 as well as having color dependent on a 5th input stream.  
 **/

float phi =  PI/2;
int numPoints = 600;
int amplitude = 250;

// parameters for the parametric equations
float a;
float b;
float aM;
float bM;

// variables to keep track of input stream
int NUM_PARAMETERS = 4;
float[] weights;
String[] names = {
  "AF3", "F7", "F3", "FC5", "T7", "P7", "O1", "O2", "P8", "T8", "FC6", "F4", "F8", "AF4"
};
Table table;
int row;

// this is the maximum distance apart we want to draw lines
int connectionDistance = 150;

// we will be storing a list of all of the points we generate in this array
PVector[] points;

/**
 set up the canvas and initialize the input data
 **/
void setup() {
  size(600, 600);
  noFill();
  noLoop();
  smooth();
  colorMode(HSB, 100, 100, 100);

  // read input data
  weights = new float[NUM_PARAMETERS];
  row = 1;
  table = loadTable("math_clean.csv", "header");

  // create the array of points
  points = new PVector[numPoints];
}

/**
 draw a figure based on current input data
 **/
void draw() {
  // center the image
  background(0, 0, 0);
  translate(width/2, height/2);

  // read input data
  for (int i = 0; i < NUM_PARAMETERS/2; i++) {
    weights[i] = table.getRow(row).getFloat(names[i]);
    weights[NUM_PARAMETERS - i - 1] = table.getRow(row).getFloat(names[names.length - i - 1]);
  }

  // set color based on input data
  float c1 = map(table.getRow(row).getFloat(NUM_PARAMETERS/2 + 1), 3500, 5000, 0, 100);
  // update for next iteration
  row++;

  // set parameters based on input data 
  a = map(weights[0], 3500, 5000, 1, 8);
  b = map(weights[3], 3500, 5000, 1, 8);
  aM = map(weights[1], 3500, 5000, 1, 8);
  bM = map(weights[2], 3500, 5000, 1, 8);


  // get all the points on the curve
  float x = 0;
  float y = 0;
  // walk through the curve, adding the points to an array instead of drawing them
  for (int i = 0; i < numPoints; i++) {
    float angle = map(i, 0, numPoints, 0, TWO_PI);
    x = sin(a * angle + phi)*cos(aM*angle + phi)*amplitude;
    y = sin(b * angle)*cos(bM*angle + phi)*amplitude;
    points[i] = new PVector(x, y);
  }

  // and draw the figure
  // iterate through all of our points
  for (int i = 0; i < points.length; i++) {
    // for each point, iterate through all points
    for (int j = 0; j < points.length; j++) {
      PVector p0 = points[i];
      PVector p1 = points[j];
      // figure out the distance between the two points
      float distance = dist(p0.x, p0.y, p1.x, p1.y);
      if (distance < connectionDistance) { // don't draw lines that are too long
        // calculate what alpha should be based on the distance
        float alpha = pow(1/ ((distance/connectionDistance) + 1), 6) * 50;

        stroke(c1, 80, 50, alpha);
        line(p0.x, p0.y, p1.x, p1.y);
      }
    }
  }
}


/**
 code to redraw the figure with the next set of data
 and to save images
 **/
void keyReleased() {

  switch(key) {
  case 'r':
    redraw();
    break;

  case 's':
    saveFrame("eeg_####.png");
    break;
  }
}



