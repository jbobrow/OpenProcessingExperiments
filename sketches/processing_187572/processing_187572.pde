
//  R.A. Robertson 2012.03 "Circle Packing 3" ~ www.rariora.org ~

float x, y, r, minR, maxR, radii, distance; // Location, radius parameters, and distance.
Circle[] circleList = new Circle[1];
boolean toggleLoop = true;
color ground = -15791556;  // Background color.
color colorTest;          // Checks if XY are inside or outside of Circles, using background color.
boolean colorOK;          // Sets boolean from colorTest.
int maxCircles = 500;  // Limit number of Circles. Too high, and program will freeze.

void setup() {
//  frame.setTitle("Circle Packing");
  float base = 720, aspect = 1;  // Window handling properties.
  size(int(base), int(base/aspect));
//  size(screen.width, screen.height);
  frameRate(220);
  background(ground);
  stroke(100, 20, 0);
  fill(10, 0, 60);
  smooth();
  ellipseMode(RADIUS);
  circleList[0] = new Circle(0, 0, 0);  // Set first Circle at origin, no dimension.
  minR = 200;//.5;  // Increase minimum radius value to concentrate packing away from window edges.
  maxR = 200;//160;
}

void draw() {
//  noLoop();
  r = minR;//random(minR, maxR);  // Radius set.
  x = constrain(random(width), r, width - r);  // XY set w/in window boundaries.
  y = constrain(random(height), r, height - r);
  colorOK = true;  // Boolean set.
  colorTest = get(int(x), int(y));  // Test if landing on background color.

  colorOK = (colorTest == ground) ? true : false;  // If XY not on background, relocate. 
    while (!colorOK) {
      x = constrain(random(width), r, width - r);
      y = constrain(random(height), r, height - r);
      colorTest = get(int(x), int(y));
      colorOK = (colorTest == ground) ? true : false;
      //r--;                         // Optional. Reduce R to fill in, esp. near edges.
      //r = constrain(r, .1, maxR);  // If NOT using, may need to reduce maxCircles.
    }

  // Find distance to all Circles in list. If XY too close, reset R.
  if (colorOK) {
    for (int i = 0; i < circleList.length; i++) {
      distance = dist(x, y, circleList[i].x, circleList[i].y);
      radii = circleList[i].r + r;  // Combined R values.
      if (distance < radii) {  // Distance not ok (Circles overlap).
        r = distance - circleList[i].r;  // Reset R.
        strokeWeight(.35);
        line(x, y, circleList[i].x, circleList[i].y);  // Optional connector lines.
      }
    }
  }
  
// Draw Circle.
strokeWeight(1);
circleList = (Circle[]) append(circleList, new Circle(x, y, r));
  
if ((circleList.length - 1) % maxCircles == 0) { noLoop(); }  // Limit Circle count.
    
//  println(frameCount + "  " + (circleList.length - 1) + "  " + frameRate);
}

/* ======================= Circle Class ======================= */

class Circle {
  float x, y, r;
  Circle(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    ellipse(x, y, r, r);  // Turn off and run with lines only for variety.
  }
}

/* =======================       UI       ======================= */

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop(); 
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
   if (mouseButton == RIGHT) {
      circleList = new Circle[1];
      setup();
 } 
}
