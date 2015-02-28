
/******************************************************
circleBoxCollide

Demostrates collision of a moving circle and static 
rectangle. The problem first is to figure out how
whether the two shapes touch, and then what to do as
a consequence. For this sketch I just cover detection of
collision between two shapes.

For whether two shapes touch, see the function 
isCollidingCircleRectangle at the bottom of this sketch,
it covers the case of circle and rectangle intersection.
Rectangle to rectangle should be slightly easier, and
circle to circle intersection is even easier.

See http://en.wikipedia.org/wiki/Collision_detection for more
info, or check out the processing simulation libraries at
http://processing.org/reference/libraries/#simulation_math or
http://jbox2d.nfshost.com/processing/ . Be warned that the
links above make heavy use of code not covered in class.

******************************************************/


// circle is controlled by the mouse
float circleLocationX; // set this later in draw
float circleLocationY; 
float circleRadius = 30.0;

// rectangle is static in the environment
float rectangleLocationX = 320.0;
float rectangleLocationY = 75.0;
float rectangleWidth = 25.0;
float rectangleHeight = 330.0;

void setup() {
  size(640, 480);
  ellipseMode(CENTER);
  rectMode(CORNER);
}

void draw() {
  background(0);
  
  // draw the rectangle, this is the barrier
  fill(255);
  rect(rectangleLocationX, rectangleLocationY, rectangleWidth, rectangleHeight);
  rect(430, 75, 25, 330);
  
  // move to the mouse coordinates 
  circleLocationX = mouseX;
  circleLocationY = mouseY;
  
  // determine whether collision detected for our new location
  boolean collisionDetected = isCollidingCircleRectangle(circleLocationX, circleLocationY,
      circleRadius, rectangleLocationX, rectangleLocationY, rectangleWidth, rectangleHeight);
      
  boolean collisionDetected2 = isCollidingCircleRectangle(circleLocationX, circleLocationY,
      circleRadius, 430, 75, rectangleWidth, rectangleHeight);
  
  // draw circle
  if ((collisionDetected == true) || (collisionDetected2 == true)) {
    fill(255,0,0); // colored red on collision
  }
  else {
    fill(255);     // white for no collision
  }
  
  ellipse(circleLocationX, circleLocationY, circleRadius*2.0, circleRadius*2.0);
  
}

/********************************************************
isCollidingCircleRectangle()
  
  params:
   circleX - center x coordinate for circle
   circleY - center y coordinate for circle
   radius  - radius of circle
   rectangleX - top left corner X coordinate
   rectangleY - top left corner Y coordinate
   rectangleWidth - width of rectangle
   rectangleHeight - and the height
 
 returns boolean - whether the two shapes are colliding
 
 code adapted from:
   http://stackoverflow.com/questions/401847/circle-rectangle-collision-detection-intersection
 adapted by: Jonathan Cecil
********************************************************/
boolean isCollidingCircleRectangle(
      float circleX, 
      float circleY, 
      float radius,
      float rectangleX,
      float rectangleY,
      float rectangleWidth,
      float rectangleHeight)
{
    float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
    float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);

    if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
    if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }

    if (circleDistanceX <= (rectangleWidth/2)) { return true; } 
    if (circleDistanceY <= (rectangleHeight/2)) { return true; }

    float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                         pow(circleDistanceY - rectangleHeight/2, 2);

    return (cornerDistance_sq <= pow(radius,2));
}



