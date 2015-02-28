
/*
/ Norm Krumpe
 / September 23, 2012
 / An object that bounces around the screen.  There are 
 / a couple reasons I made this.
 / 1. To play around with objects that bounce around the
 /    screen.
 / 2. To be extra careful about documenting my code and
 /    factoring my code into methods (functions) that
 /    make it easy to adjust.
 / 3. PLEASE play around with this.  
 */

// The location, size, and speed of the ball
float speedX, speedY;
float objectX, objectY, objectWidth, objectHeight;

// acceleration...modify this to affect
// how the ySpeed changes.  Closer to zero
// reduces the effects of gravity.  For example,
// 0.1 makes it seem more like how things might move
// on the moon.
float GRAVITY = 0.6;

// damping effect...modify this to affect
// the bounciness of the object.  Closer to zero
// loses bounciness.  Closer to 1 makes it more
// like a superball.
float DAMPING = .6;

// friction effect...modify this to affect
// the left-right motion when the object hits the floor.
// Closer to 1 makes the floor "slick", and closer to
// 0 makes the floor rougher, like sandpaper.
float FRICTION = .9;

// Set the screen size, the object's initial size,
// location, and speed.
void setup() {
  size(400, 400);

  objectX = width/2;
  objectY = 0;

  objectWidth = 20;
  objectHeight = objectWidth;

  speedX = 4;
  speedY = 4;
}

// The main driver for the motion
void draw() {

  // The second number in the fill affects
  // the transparency.  Adjust it to increase
  // or decrease the "tail" left behind the moving
  // object.
  fill(255, 30);
  rect(0, 0, width, height);

  drawObject();
  
  adjustForGravity();
  updateObjectLocation();
  checkForCollision();
}

// This draws the object that is bouncing.  Right
// now the object is a rectangle.  But it shouldn't
// be too hard to change this to some other object.
void drawObject() {
  updateColor(); 
  ellipseMode(CORNER);
  ellipse(objectX, objectY, objectWidth, objectHeight);
}



// Adjusts the location of the object based on its
// current location and its speed
void updateObjectLocation() {
  objectX = objectX + speedX;
  objectY = objectY + speedY;
}

// Adjusts the object's y speed based on its
// current speed and the force of gravity
void adjustForGravity() {
  speedY = speedY + GRAVITY;
}

// Make adjustments whenever the object hits
// the wall or a floor.  Any of these should
// reverse the direction of the object (hitting
// the two walls, for example, reverses speedX).
// Hitting the floor will call friction and 
// damping into play.  Should hitting a wall
// be affected by friction?  What about hitting
// the ceiling?
void checkForCollision() {

  // Check for right-wall collision
  // This (perhaps poorly) assumes that
  // the object's position (objectX, objectY)
  // is based on that position being in the
  // upper-left corner of that object.
  // If (objectX, objectY) were in the center
  // of the object, then this code would need
  // to be adjusted appropriately.
  if (objectX > width - objectWidth) {
    objectX = width - objectWidth;
    speedX = -1 * speedX;
  }
  // Check for left-wall collision
  else if (objectX < 0) {
    objectX = 0;
    speedX = -1 * speedX;
  }

  // Check for floor collision:
  if (objectY > height - objectHeight) {
    objectY = height - objectHeight;
    speedY = -1 * speedY;
    speedY = DAMPING * speedY;
    speedX = FRICTION * speedX;
  }
  if (objectY < 0) {
    objectY = 0
    speedY = -1 * speedY;
    }
}

void updateColor() {
    float red = random(256);
    float green = random(256);
    float blue = random(256);
    fill(red,green,blue);
    }
