
// Sogang University
// 20121181 JiHoon Han
// Digital Media Art Workshop
 
 
 
//////////////////////////////// VARIABLES ////////////////////////////////
 
// maximum number of mouse points to memorize
int numMaxPoints = 50000;
 
// array for memorizing mouse points
float pointX[] = new float[numMaxPoints];
float pointY[] = new float[numMaxPoints];
 
// new(modified) array that is a little bit random from original
float newpointX[] = new float[numMaxPoints];
float newpointY[] = new float[numMaxPoints];
 
// random Opacity and Size values to memorize for clouds
float randomOpacity[] = new float[numMaxPoints];
float randomSize[] = new float[numMaxPoints];
 
// number of current points memorized
int numPoints = 0;
 
// man's position calculated by curve
float manX[] = new float[numMaxPoints];
float manY[] = new float[numMaxPoints];
 
// number of man location memorized
int manPoint = 0;
 
// current frame number
int frameNumber = 0;
 
 
//////////////////////////////// SETUP ////////////////////////////////
 
void setup() {
  size(800, 800);
  background(149, 215, 255);
 
  // initialize the array
  for (int a = 0; a < numMaxPoints; ++a) {
    pointX[a] = 0;
    pointY[a] = 0;
  }
}
 
 
//////////////////////////////// FUNCTIONS ////////////////////////////////
 
void mouseDragged() {
  // assign values when mouse is dragged
  pointX[numPoints] = mouseX;
  pointY[numPoints] = mouseY;
 
  // randomize the points for small clouds
  newpointX[numPoints] = pointX[numPoints] + random(-30, 30);
  newpointY[numPoints] = pointY[numPoints] + random(-30, 30);
 
  // randomize and memorize other values
  randomOpacity[numPoints] = random(10, 50);
  randomSize[numPoints] = random(30, 50);
 
  ++numPoints;
}
 
// cloud drawing function
// Send the numPoints value to draw at specific location
void cloud(int i) {
 
  noStroke();
  fill (255, 255, 255, random(50, 100));
  ellipse(pointX[i] +random(-5, 5), pointY[i] +random(-5, 5), 30, 30);
 
  smallCloud(i);
  smallCloud(i);
}
 
// Draw small clouds surrounding the main clouds
// Send the numPoints value to draw at specific location
void smallCloud(int i) {
  if (i > 50) {
 
    fill(255, 255, 255, random(10, 50));
    ellipse(newpointX[i-50], newpointY[i-50], randomSize[i-50] +random(-5, 5), randomSize[i-50] +random(-5, 5));
  }
}
 
// the function drawing the smiling man
void man() {
  
  pushMatrix();
  translate(0, -20);
 
  fill(0);
  stroke(0);
  strokeWeight(3);
 
  // body
  line(0, 0, 0, 50);
  // legs
  line(0, 50, -10, 80);
  line(0, 50, 10, 80);
  // hands
  line(0, 35, 15, 15);
  line(0, 35, -15, 15);
 
  // face
  pushMatrix();
  translate(0, 0);
  pushMatrix();
 
  scale(0.1);
  translate(-250, -250);
 
  noStroke();
  //the face
  strokeWeight(2);
  fill(250, 245, 41, 255);
  ellipse(250, 250, 250, 250);
  strokeWeight(1);
 
  //the mouth
  fill(0, 0, 0, 255);
  arc(250, 230, 250, 250, PI/5, PI/1.5, CHORD);
 
  //the eyes
  ellipse(200, 200, 50, 50);
  ellipse(300, 200, 50, 50);
 
  popMatrix();
  popMatrix();
  popMatrix();
}
 
 
//////////////////////////////// MAIN DRAW FUNCTION ////////////////////////////////
 
void draw() {
  background(149, 215, 255);
 
  // Erase memorized points (erase canvas) if right mouse button is clicked
  if (mousePressed && (mouseButton == RIGHT)) {
    numPoints = 0;
    manPoint = 0;
  }
 
  // Count the frame number
  ++frameNumber;
 
  // Print information in console for coding
  println("Frame Number: " + frameNumber);
  println("Memorized Points(numPoints): " + numPoints);
 
  // call cloud() to draw clouds
  for (int i = 0; i < numPoints; ++i) {
    cloud(i);
  }
 
  // Calculate the man's location by using bezier curves
  if (numPoints>101) {
    fill(0);
    stroke(255, 0, 0, 128);
    strokeWeight(2);
 
    float aa = pointX[numPoints-100];
    float bb = pointY[numPoints-100];
    float cc = pointX[numPoints-50];
    float dd = pointY[numPoints-50];
 
    noFill();
    bezier(aa, bb, (aa+cc)/2 -100, (bb+dd)/2 -100, (aa+cc)/2 +100, (bb+dd)/2 -100, cc, dd);
 
    // Save the location of the man to the manX[], manY[] array.
    fill(255);
    int steps = 10;
    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      manX[manPoint] = bezierPoint(aa, (aa+cc)/2 -100, (aa+cc)/2 +100, cc, t);
      manY[manPoint] = bezierPoint(bb, (bb+dd)/2 -100, (bb+dd)/2 -100, dd, t);
      ++manPoint;
    }
 
    // Draw the man with the location info stored in manX[], manY[].
    pushMatrix();
    translate(manX[manPoint-10], manY[manPoint-10]);
    man();
    popMatrix();
  }
}

