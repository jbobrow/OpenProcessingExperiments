
/*
  Norm Krumpe
 Miami University
 krumpenj@muohio.edu
 I wanted to play around with sorting,
 and so this is something that allows you to
 sort a bunch of circles by size or by radius.
 It uses one of the lousiest, greatest sorting algorithms:
 bubble sort (lousy in that it is inefficient, great in
 that it is easy to learn).
 */

// An array of circles
Circle[] circles;

// How many circles do you want?
final int CIRCLE_COUNT = 150;

// Try .2 to speed things up
// Try .05 to slow things down
float speedFactor = .1;

// Keeps track of which direction to sort.
// Allows toggling.
boolean ascendingSize = true;
boolean ascendingColor = true;

// Create the array of circles
void setup() {
  size(600, 300);
  circles = new Circle[CIRCLE_COUNT];
  initCircles();
  mix();
}

// Draw the circles and the menu
void draw() {
  background(255, 255, 0);
  drawCircles();
  showOptions();
}

// Draw each circle based on its x- and y-coordinates
void drawCircles() {
  noStroke();
  for (Circle c: circles) {
    fill(c.shade, 0, 0, 100);
    ellipse(c.x, c.y, 2 * c.rad, 2 * c.rad);
  }
  updateLocations();
}

// Set up a circle with some sensible values
// for the center, size, and color.
void initCircles() {
  for (int i = 0; i < circles.length; i++)
    circles[i] = new Circle();

  for (Circle c: circles) {
    c.rad = random(5, 30);
    c.x = random(c.rad, width - c.rad);
    c.y = random(c.rad, height - c.rad);
    c.shade = random(100, 256);
  }
}

// Bubble sort to sort the circles by color
// Bubble sort is inefficient to begin with,
// but even if you keep it a bubble sort, it 
// could be made more efficient.
void colorSort() {
  speedFactor = .2;
  for (int end = circles.length - 1; end > 0; end--) {
    boolean swapped = false;
    for (int i = 0; i < end; i++) {
      if ((ascendingColor && circles[i].shade > circles[i + 1].shade) ||
        (!ascendingColor && circles[i].shade < circles[i + 1].shade)) {
        Circle temp = circles[i];
        circles[i] = circles[i + 1];
        circles[i + 1] = temp;
        swapped = true;
      }
    }
    if (!swapped) { // stop sorting if a pass results in no swaps
      break;
    }
  }

  ascendingColor = !ascendingColor;
  setDestinations();
}

// Bubble sort to sort the circles by size
// Bubble sort is inefficient to begin with,
// but even if you keep it a bubble sort, it 
// could be made more efficient.
void sizeSort() {
  speedFactor = .2;
  for (int end = circles.length - 1; end > 0; end--) {
    boolean swapped = false;
    for (int i = 0; i < end; i++) {
      if ((ascendingSize && circles[i].rad > circles[i + 1].rad) ||
        (!ascendingSize && circles[i].rad < circles[i + 1].rad)) {
        Circle temp = circles[i];
        circles[i] = circles[i + 1];
        circles[i + 1] = temp;
        swapped = true;
      }
    }
    if (!swapped) { // stop sorting if a pass results in no swaps
      break;
    }
  }
  ascendingSize = !ascendingSize;
  setDestinations();
}

// After sorting circles, their destinations should be updated
// so that circle 0 is left most, circle 1 is next, etc.
void setDestinations() {
  for (int i = 0; i < circles.length; i++) {
    circles[i].destX = (i + 1) * width/(circles.length + 1);
    circles[i].destY = height/2;
  }
}

// Adjust the speed based on distance from destination:
// Circles farther from their destination travel faster
void setSpeeds() {
  for (Circle c: circles) {
    c.speedX = -(c.x - c.destX) * speedFactor;
    c.speedY = -(c.y - c.destY) * speedFactor;
  }
}

// Move the circles toward their destinations.
void updateLocations() {
  for (Circle c: circles) {
    c.x += c.speedX;
    c.y += c.speedY;

    if (dist(c.x, c.y, c.destX, c.destY) < .5) {
      c.x += random(-2, 2);
      c.y += random(-2, 2);
    }
  }

  // Each time a circle moves, its speed needs to
  // be updated too.
  setSpeeds();
}

// Set the circles in random locations on the screen
void mix() {
  speedFactor = .25; // move circles quickly
  for (Circle c: circles) {
    c.destX = random(c.rad, width - c.rad);
    c.destY = random(c.rad, height - c.rad);
  }
}

// Show the menu
void showOptions() {
  fill(255, 255, 0);
  noStroke();
  rect(0, 0, width, 20);
  fill(0);
  text("(c)olor-sort, (s)ize-sort, (m)ix", 0, 19);
}

// What does the user want to do?
void keyPressed() {
  if (key == 'm')
    mix();
  else if (key == 'c')
    colorSort();
  else if (key == 's')
    sizeSort();
}

// A simple Circle class
// The x and y are the location of the circle's
// center.  destX and destY are where the circle
// wants to be.
class Circle {
  float x, y;
  float shade;
  float rad;
  float destX, destY;
  float speedX, speedY;
}
