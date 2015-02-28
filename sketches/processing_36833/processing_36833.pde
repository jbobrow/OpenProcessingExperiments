
void setup() {
  size(600, 300);
  background(235);
  smooth();
  frameRate(20);
}
float count=0;
float leftCircle = 40;  // number of circles on the left
float leftRect = 30;    // number of rectangles on the left
float leftSize;          // size of circles/rectangles on the left

float rightCircle = 60;  // number of circles on the right
float rightRect = 40;   // number of rectangles on the right
float rightSize;         // size of circles/rectangles on the right

float verticalLine;      // x-coordinate of vertical line
float verticalSize;      // strokeWeight vertical line

float horizontalLine;    // y-coordinate of horizontal line
float horizontalSize;    // strokeWeight of horizontal line

void draw() {

  if (leftCircle > 0) {        // setup for circles on the left
    fill(102, 151, 252, 100);
    leftSize = random(4, 90);  // possible radii 
    ellipse(random(75, 225), random(75, 225), leftSize, leftSize);
  }

  if (leftRect > 0) {          // setup for rectangles on the left
    fill(50, 57, 234, 100);
    leftSize = random(4, 90);  // possible rectangle dimensions
    rect(random(75, 225), random(75, 225), leftSize, leftSize);
  }

  if (rightCircle > 0) {        // setup for circles on the right
    noFill();
    rightSize = random(6, 40);  // possible radii
    ellipse(random(375, 525), random(75, 225), rightSize, rightSize);
  }

  if (rightRect > 0) {          // setup for rectangles on the right
    fill(237, 219, 50,100);
    rightSize = (random(6, 40)); // possible rectangles dimensions
    rect(random(375, 525), random(75, 225), rightSize, rightSize);
  }
  
  if (leftCircle > 0) {        // setup for lines; needed a statement
    verticalLine = random(350,375);
    horizontalLine = random(200,205);
    strokeWeight(0);
    stroke(0,0,0,100);
    line(verticalLine,0,verticalLine,height);
    line(0,horizontalLine,width,horizontalLine);
  }
  
  leftCircle--;    // terminate circle generation at 40
  leftRect--;      // terminate rectangle generation at 30
  rightCircle--;   // terminate circle generation at 60
  rightRect--;     // terminate rectangle generation at 40
  
}

