
/**
 This example generates the Sierpinski triangle through a 
 randomized process. The idea is that we start with three points.
 We pick one as our start point. Then we start a process where we
 take the last point we drew and a random one of the three main points
 and find the midpoint between them. We draw this point and repeat.
 
 I've tweaked this example a little bit since class. The three main
 points are now stored in an array, eliminating the need for the 
 switch statement. I also added mouse control so you can click and 
 change the points of the triangle. To make the rendering faster, I
 also added a loop in draw to place 100 points at a go, rather than just
 1 at a time.
 
 
 C. Andrews
 2014-01-23
 **/

PVector[] points; // the three points that define the triangle
PVector lastPoint; // the most recent point
int index; // the index of the next point to be replaced in points

void setup() {
  size(600, 600);

  // start with a basic cavnas filling triangle
  points = new PVector[3];
  points[0] = new PVector(width/2, 50);
  points[1] = new PVector(width/8, height - 50);
  points[2] = new PVector(width - width/8, height - 50);
  lastPoint = points[1];
  index = 0;
  background(255);
  strokeWeight(2);
  stroke(0);
}

/**
 This does the main work (what there is of it). Note that I added
 a for loop that knocks out 100 iterations on every pass to speed
 up the amount of time it takes to get an obvious shape.
 **/
void draw() {

  for (int i = 0; i < 100;i++) {
    // pick a random point 
    PVector pick = points[(int)random(3)];
    // create a new point by calculating the midpoint between our chosen
    // point and the last one we drew
    PVector n = new PVector((lastPoint.x - pick.x)/2 + pick.x, (lastPoint.y - pick.y)/2 + pick.y);

    point(n.x, n.y);
    lastPoint = n;
  }
}

/**
This listens for mouse clicks. If the user clicks the mouse, it replaces
one of the points in the triangle with the mouse location.
**/
void mouseClicked() {
  points[index].x = mouseX;
  points[index].y = mouseY;
  index = (index + 1) % 3;// mod 3 makes sure index is never greater than 2
  background(255);
}



