
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
   alterations by Chris Smith
 * This sketch is a further change to the standard spinning top code
 *
 */

int noOfTops = 10;

// VARIABLES FOR TOP POSITION DATA
float x[] = new float[noOfTops];
float y[] = new float[noOfTops];      // current drawing position
float dx[] = new float[noOfTops];
float dy[] = new float[noOfTops];    // change in position at each frame
float bx[] = new float[noOfTops];
float by[] = new float[noOfTops];
float handX[] = new float[noOfTops];
float handY[] = new float[noOfTops];
float rad[] = new float[noOfTops];       // radius for the moving hand

// VARIABLES FOR TOP TO HAND LINE (USED TO CALCULATE INTERSECTIONS MORE EFFICIENTLY)
float handDx[] = new float[noOfTops];
float handDy[] = new float[noOfTops];
float midX[] = new float[noOfTops];
float midY[] = new float[noOfTops];
float halfRad[] = new float[noOfTops];

// VARIABLES TO STORE DIFFERENCES BETWEEN EACH TOP
float radModifier[] = new float[noOfTops];  // modifier to change hand rotation radius
float rotModifier[] = new float[noOfTops];   // modifer to change top rotation rate
float handRotModifier[] = new float[noOfTops];   // modifer to change hand rotation rate
float handRadModifier[] = new float[noOfTops];   // modifer to change hand radius from top
color topColor[] = new color[noOfTops]; // color of each top

void setup() {
  size(900, 500);
  
  //initialise all the tops
  for (int i = 0; i < noOfTops; i++) {
    initialiseTop(i);
  }
  
  background(127);
}


void draw() {
  // blend the old frames into the background
  //blendMode(BLEND);
  //fill(0, 5);
  //rect(0, 0, width, height);

  // move all of the tops into their new position
  for (int i = 0; i < noOfTops; i++) {
    moveTop(i);
  }
  
  // draw tops
  drawTops();
}

void initialiseTop(int topNo) {
    // initial position in the centre of the screen
  x[topNo] = width/2;
  y[topNo] = height/2;

  // dx and dy are the small change in position each frame
  dx[topNo] = random(-1, 1);
  dy[topNo] = random(-1, 1);
  
  // randomise various attributes for rotation speed and radius
  radModifier[topNo] = random(1, 2);
  rotModifier[topNo] = random(-2, 2);
  handRotModifier[topNo] = random(-2, 2);
  handRadModifier[topNo] = random(2, 4);
  
  // set the colour of each top to various values of grey
  topColor[topNo] = (int) map(topNo, 0, noOfTops, 0, 255);
  
  // set one of the tops to a brighter color
  if (topNo == 5) {
    switch((int)random(0, 3)) {
      case 0:
        topColor[topNo] = color(100, 100, 0);
        break;
      case 1:
        topColor[topNo] = color(0, 100, 0);
        break;
      default:
        topColor[topNo] = color(100, 0, 0);
        break;
    }
  }
}

void moveTop(int topNo) {
  rad[topNo] = radians(frameCount);
  
  // calculate new position
  x[topNo] += dx[topNo];
  y[topNo] += dy[topNo];

  float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x[topNo] > width-100 || x[topNo] < 100) {
    dx[topNo] = dx[topNo] > 0 ? -random(min, max) : random(min, max);
  }

  if (y[topNo] > height-100 || y[topNo] < 100) {
    dy[topNo] = dy[topNo] > 0 ? -random(min, max) : random(min, max);
  }

  // calculate position of the 'top'
  bx[topNo] = x[topNo] + 100 * sin(rotModifier[topNo] * rad[topNo]);
  by[topNo] = y[topNo] + 100 * cos(rotModifier[topNo] * rad[topNo]);

  // calculate position of the 'hand'
  float radius = 20 + (70 * radModifier[topNo] * abs(sin(rad[topNo]*0.1)));
  handX[topNo] = bx[topNo] + radius * sin(handRotModifier[topNo] * rad[topNo]*handRadModifier[topNo]);
  handY[topNo] = by[topNo] + radius * cos(handRotModifier[topNo] * rad[topNo]*handRadModifier[topNo]);
  
  // Calculate values used for intersection checks (more efficient to calculate here)
  handDy[topNo] = handY[topNo]-by[topNo];
  handDx[topNo] = handX[topNo]-bx[topNo];
  midX[topNo] = (handX[topNo]+bx[topNo])/2;
  midY[topNo] = (handY[topNo]+by[topNo])/2;
  halfRad[topNo] = radius/2;
}

void drawTops() {
  // for each possible pairing of tops
  for(int i = 0; i < noOfTops-1; i++) {
    for (int j = i+1; j < noOfTops; j++) {
        // check if the two tops intersect
        if(topCirclesIntersect(i, j) && topsIntersect(i, j)) {
            // where tops intersect, draw a 'butterfly' shaped quad from each corner in one of the top's colours
            fill(topColor[i], 60);
            stroke(topColor[i], 60);
            quad(handX[i], handY[i], bx[i], by[i], handX[j], handY[j], bx[j], by[j]);
        }
    }
  }

  if (mousePressed) {
    frameRate(mouseX);
  }
  if (keyPressed && key == 's') {
    saveFrame("spinningTop" + frameCount + ".jpg");
  }
}

/*
* calculates whether a circle around each of the two specified tops intersect
* returns true of they do.
* Note, this is just computationally faster than calculating the lines every time so
* this can be calculated first to see if the more complex 'topsIntersect' method is worth running.
*/
boolean topCirclesIntersect(int topNo1, int topNo2) {
  return dist(midX[topNo1], midY[topNo1], midX[topNo2], midY[topNo2]) <= halfRad[topNo1] + halfRad[topNo2];
}

/*
* calculates whether the line between the 'top' and 'hand' for the two specified tops intersect
* returns true if they do.
*/
boolean topsIntersect(int topNo1, int topNo2) {
  float dot = handDx[topNo1]*handDy[topNo2] - handDy[topNo1]*handDx[topNo2];
  // if det = 0, lines are parallel, cannot intersect
  if (dot == 0) {
    return false;
  }
  float diffBx = bx[topNo2]-bx[topNo1];
  float diffBy = by[topNo2]-by[topNo1];
  float line1IntersectPos = (diffBx*handDy[topNo2] - diffBy*handDx[topNo2])/dot;
  if (line1IntersectPos <0 || line1IntersectPos >1) {
    return false;   
  }
  float line2IntersectPos = (diffBx*handDy[topNo1] - diffBy*handDx[topNo1])/dot;
  if (line2IntersectPos <0 || line2IntersectPos >1) {
    return false;
  }

  return true;
}



