
int depth     = 1;
int MAX_DEPTH = 8;

void setup() {
  size(800, 600);
}

void draw() {
  background(54, 54, 60); // Set the background to a dark gray
  fill(0);                // Draw black triangles
  
  // Draw the Sierpinski triangle with "depth" number of iterations
  makeFractal(new PVector(0, 600), new PVector(800, 600), new PVector(400, 0), depth, 0); 
  
  fill(255); // Draw white text
  
  text("Click To Continue", 350, 200);
  text("Depth: " + depth, 375, 400);
}

void mousePressed() {  
  if(depth >= MAX_DEPTH) {
    depth = 1;
  } else {
    depth++;
  }  
}

void makeFractal(PVector lowerLeft, PVector lowerRight, PVector topCenter, int maxDepth, int curDepth) {
  if(curDepth < maxDepth) {
    // The middle point of the left side of the triangle
    PVector middleLeft = new PVector(lowerLeft.x + (topCenter.x - lowerLeft.x) / 2, 
                                     lowerLeft.y + (topCenter.y - lowerLeft.y) / 2);
    
    // The middle point of the right side of the triangle
    PVector middleRight = new PVector(lowerRight.x + (topCenter.x - lowerRight.x) / 2, 
                                      lowerRight.y + (topCenter.y - lowerRight.y) / 2);

    // The middle point of the bottom side of the triangle
    PVector bottomCenter = new PVector(lowerLeft.x + (lowerRight.x - lowerLeft.x) / 2, lowerLeft.y);
    
    int newDepth = curDepth + 1;
    
    // Recursively call makeFractal for each of the three new triangles
    makeFractal(middleLeft,   middleRight,  topCenter,   maxDepth, newDepth); // top-center triangle
    makeFractal(lowerLeft,    bottomCenter, middleLeft,  maxDepth, newDepth); // bottom-left triangle
    makeFractal(bottomCenter, lowerRight,   middleRight, maxDepth, newDepth); // bottom-right triangle
  } else {
    // The maximum depth has been reached, draw a single triangle at the present position
    triangle(lowerLeft.x, lowerLeft.y, lowerRight.x, lowerRight.y, topCenter.x, topCenter.y);
  }
}
