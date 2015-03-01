
/*
 * To the extent possible under law, Russell Gordon has waived all copyright and related
 * or neighboring rights to Rule Based Sketch. This work is published from: Canada.
 * http://creativecommons.org/publicdomain/zero/1.0/
 *
 * Thursday, June 26, 2014
 * 
 * Rule-based art sketch, homework for week 3 of Creative Coding course.
 * https://www.futurelearn.com/courses/creative-coding
 *
 * Element 0
 *
 * Form 1       Circle
 * Behaviour 1  move in a straight line
 * Behaviour 2  constrain to a surface
 *
 * Process 0
 *
 * A rectangular surface filled with copies of Element 0.
 * If two Elements intersect then draw a line connecting their
 * centres, colouring the line based on the circle being odd or even.
 */

float x[], y[];      // position
float dx[], dy[];    // change in position
float diameters[];       // diameters of each element

boolean captureOutput = false; // whether to save GIF files for output
int captureInterval = 500;

boolean fadeAtEdge = false; // whether to make elements transparent at edges

boolean drawElements = false; // whether to actually draw the elements

void setup() {

  // create canvas
  size(800, 800);

  // number of elements
  int num = 4;

  // initialize arrays
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  diameters = new float[num];

  // initalize elements
  for (int i = 0; i < x.length; i++) {
    // initial position
    x[i] = random(0, width);
    y[i] = random(0, height);

    // initial direction
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);

    // radius of each element
    diameters[i] = random(width/num, width/(num/2));
  }

  // background
  background(255);

  // border thickness
  strokeWeight(1);

  // smoother lines
  smooth(2);
}

void draw() {

  // update elements on screen
  for (int i = 0; i < x.length; i++) {

    // Change position of element
    x[i] += dx[i];
    y[i] += dy[i];

    // Check for boundary
    constrainToSurface(x, y, dx, dy, i);

    // Further from centre, more faint
    float transparency = 5;
    if (fadeAtEdge) {
      transparency = dist(x[i], y[i], width/2, height/2); // distance of element from middle of image
      transparency = 100 - map(transparency, 0, dist(0, height/2, width/2, height/2), 0, 100); // transparency based on a radius / circular boundary
    }

    // Implement process 0
    // We must check the position of the current element against all other elements on the screen
    for (int j = 0; j < x.length; j++) {

      // Don't check an element against itself
      if (i == j) {
        continue;
      }

      // Check distance from other elements – if circles overlap, draw the line connecting them
      if ( (diameters[i]/2 + diameters[j]/2) > dist(x[i], y[i], x[j], y[j])) {
        // Different colour depending on whether current element is even or odd
        if (j % 2 == 0) {
          stroke(255, 126, 0, 90); // orange
        } else {
          stroke(44, 208, 255, 90); // blue
        }
        line(x[i], y[i], x[j], y[j]);
      }
    }

    // Draw elements
    if (drawElements) {
      stroke(0, transparency);
      noFill();

      // Draw element on screen
      ellipse(x[i], y[i], diameters[i], diameters[i]);
    }
  }

  // Save frames every so often
  if (frameCount % captureInterval == 0 && captureOutput == true) {
    saveFrame("output-#######.gif");
  }
}

// constrainToSurface
// 
// Purpose: Ensure that an element does not go off the screen
//
// Parameters:      x[]      A reference to an array containing x values for all elements
//                  y[]      A reference to an array containing y values for all elements
//                  dx[]     A reference to an array containing horizontal change values for all elements
//                  dy[]     A reference to an array containing vertical change values for all elements
//                  i        What element to check the position of
void constrainToSurface(float[] x, float[] y, float[] dx, float[] dy, int i) {

  // constrain horizontally
  if (x[i] + dx[i] > width) {    // right boundary
    dx[i] = random(-1, -0.25);
  } else if (x[i] + dx[i] < 0) { // left boundary
    dx[i] = random(0.25, 1);
  }

  // constrain vertically
  if (y[i] + dy[i] > height) {    // bottom boundary
    dy[i] = random(-1, -0.25);
  } else if (y[i] + dy[i] < 0) { // top boundary
    dy[i] = random(0.25, 1);
  }
}


