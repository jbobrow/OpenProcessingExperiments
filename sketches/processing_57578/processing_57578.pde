
//  R.A. Robertson 2012.03 "Circle Packing, Onscreen Image" ~ www.rariora.org ~

float x, y, r, minR, maxR, radii, distance, spacing; // Location, radius parameters, distance, spacing.
Circle[] circleList = new Circle[1];
boolean toggleLoop = true;
color ground = color(75);  // Background color.
color colorTest;          // Samples image color.
float radiusVal;          // Brightness-to-radius ratio.
boolean distanceOK;      // Used in distance setting.
int maxCircles = 10000;  // Limit number of Circles. Too high, and program will freeze.
PImage img;
  
void setup() {
  img = loadImage("galatea.jpg");  // Setup background image.
//  frame.setTitle("Circle Packing, Onscreen Image");
//  size(img.width, img.height);
//  size(screen.width, screen.height);
  size(423, 587);
  frameRate(200);
//  background(ground);
  smooth();
  ellipseMode(RADIUS);
  circleList[0] = new Circle(0, 0, 0);  // Set first Circle at origin, no dimension.
  minR = .5;  // Increase minimum radius value to concentrate packing away from window edges.
//  maxR = 10;
  spacing = 0;  // Separation between Circles. Negative values cause overlap.
  radiusVal = .025;
  image(img, 0, 0);
}

void draw() {
//  noLoop();

  distanceOK = false;

    while (distanceOK == false) {
      x = random(width);
      y = random(height);
      colorTest = get(int(x), int(y));
      r = brightness(colorTest) * radiusVal;  // Set radius.
      r = constrain(r, minR, r);
  //  r = random(minR, r);
      
      for (int i = 0; i < circleList.length; i++) {
        distance = dist(x, y, circleList[i].x, circleList[i].y);
        if (distance < circleList[i].r + spacing) {  // If any instance is inside Circle,
          distanceOK = false;              // reset boolean,
          break;                           //  break and rescan. 
          }
        else {
          distanceOK = true;
        }  
      }
    }

  // Find distance to all Circles in list. If XY too close, reset R.
    for (int i = 0; i < circleList.length; i++) {
      
      distance = dist(x, y, circleList[i].x, circleList[i].y);
      radii = circleList[i].r + r;  // Combined R values.
      
      if (distance < radii + spacing) {  // Distance not ok (Circles overlap).
        r = distance - circleList[i].r - spacing;  // Reset R.
        stroke(0, 100);
        strokeWeight(.55);
        line(x, y, circleList[i].x, circleList[i].y);  // Optional connector lines.
      }
      
      if (x < r) { r = x; }                    // Constrain for window boundaries.
      if (x > width - r) { r = width - x; }
      if (y < r) { r = y; }
      if (y > height - r) { r = height - y; }
      
    }
  
  if (distanceOK) {  // Draw Circle.
    stroke(10);  // colorTest is interesting here. Also w/alpha.
    strokeWeight(.5);
//    noStroke();
    fill(colorTest);
//    noFill();
    circleList = (Circle[]) append(circleList, new Circle(x, y, r));
  }
  
    if ((circleList.length - 1) % maxCircles == 0) { noLoop(); }  // Limit Circle count.
    
//    println(frameRate + "  " +frameCount + "  " + (circleList.length - 1) + "  " + distanceOK
//     + "  " + x  + "  " + y  + "  " + r);
//println(hex(colorTest, 6) + "  " + brightness(colorTest) + "  " + r);
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

/* =======================      UI      ======================= */

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

void keyPressed() {
  if (key == 'i' || key == 'I') { // Saves an image file.
      saveFrame("circle_pack_image_####.jpg");
  }    
}

/* =======================      Notes      ======================= */

/* 

Load image onscreen and overlay circle packing.

*/


