
/*
* workshop MIRADAS - trace(s) 2014
 * mariana carranza
 * introduction to Processing
 * array-random
 * 20 circles in random position x
 */


// declare the arrays: what sort of thing stored the boxes
// int, float, vectors or other objects
float[] posX;
int[] grayScale;
int[] radios;

// the vertical distance between circles
float vstep;


// setup is called just one time at the beginning
void setup() {

  size(400, 400);
  smooth();
  // black background
  background(0);

  // initialize the arrays: how many boxes stores the array
  posX = new float[20];
  grayScale = new int[20];
  radios = new int[20];
}


void draw() {

  //background(0);

  //fill the boxes using a "for" structure
  for (int i = 0; i < 20; i++) {
    posX[i] = random(35, 365);
    grayScale[i] = int(random(0, 255));
    radios[i] = int(random(10, 60));
  }

  vstep = (400-70)/19;
  // draw the first circle at ypos = 35
  float posY = 35;

  //drawing circles using the array's data
  stroke(255);
  strokeWeight(5);
  for (int i = 0; i < 20; i++) {
    fill(grayScale[i]);
    ellipse(posX[i], posY, radios[i], radios[i]);
    // aument of y position
    posY += vstep;
  }
}


