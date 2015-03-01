
/* Reason for this program: I was working on spinning a sprite, when I realized I didn't want to deal with all the intricacies of per-pixel rotation.
 I noticed that Processing has a rotate() function which rotates all drawn shapes by a given angle. The problem is that the rotation is done (impractically)
 around the origin. So, I set out to determine the relationship between a point before the rotation and the same point after the rotation. Using this
 relationship, I could then undo the rotation for the center of the sprite, thus keeping it in the desired location. 
 
 If you have any questions about the code feel free to leave a comment.
 */

// Most of these variables are explained later.
float deltaX = 0;
float deltaY = 0;

float angle;
float radius;

float x = 250; // Desired shape x-position
float y = 250; // Desired shape y-position

float originSlope;


void setup()
{
  size(500, 500);
  background(255);

  rectMode(CENTER); // Set rect mode to center. Allows shape to rotate about center rather than corner.

  radius = dist(0, 0, x, y); // Set radius of our rotation to the distance from origin to position.
}

void draw()
{
  // Clear screen
  fill(255);
  rect(250, 250, 500, 500);

  /* The following code took about 6 hours, lots of graph paper, and many headaches to figure out. 
   Essentially, they allow us to cancel out the rotation around the origin for any desired point. 
   So, while the rest of our shape is rotated, the center (or top left corner dependent on RectMode) is held in place.
   Since the shape is drawn based on this point, the shape rotates in place.
   */

  angle += radians(.5);

  originSlope = atan(y/x);

  deltaX = 2 * radius * sin(angle / 2) * cos(originSlope + (angle / 2) - HALF_PI); // Change in x after rotation.
  deltaY = 2 * radius * sin(angle / 2) * sin(originSlope + (angle / 2) - HALF_PI); // Change in y after rotation.

  rotate(-angle); // We rotate at a negative angle so the deltaX and deltaY values can cancel this function's rotation.

  rect(x - deltaX, y - deltaY, 100, 100); // Subtract deltaX and deltaY values to cancel. Draw our rectangle. Boom.
  
  ellipse(100 - deltaX, 100 - deltaY, 10, 10); // Using deltaX and deltaY you can change the point of rotation for anything.
}



