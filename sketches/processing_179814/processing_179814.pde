
// Most of these variables are explained later.
float deltaX = 0;
float deltaY = 0;

float angle;
float radius;

float x = 250; // Desired shape x-position
float y = 250; // Desired shape y-position

float originSlope;

PImage sprite;
float fslope; // Slope of equation at x
float h = .001; // Calculus

float speed = 3;

boolean debugMode = false;

void setup()
{
  size(500, 500);
  background(255);

  sprite = loadImage("surfer.png");

  rectMode(CENTER); // Set rect mode to center. Allows shape to rotate about center rather than corner.
  imageMode(CENTER);
}

void draw()
{
  // Clear screen
  fill(255);
  strokeWeight(0);
  rect(250, 250, 500, 500);

  strokeWeight(3);
  for (int i = 0; i <= width; i++)
  {
    stroke(0, 0, 203);
    point(i, equation(i));
  }

  if (keyPressed && keyCode == LEFT && x > speed)
    x -= speed;
  else if (keyPressed && keyCode == RIGHT && x < width - speed)
    x += speed;

  y = equation(x); // Obtain the y position from the equation

  fslope = -(equation(x + h) - equation(x - h)) / (2*h); // Roughly calculate slope of tangent line at x

  // Sprite rotation and drawing:
  angle = atan(fslope); // Set the angle of rotation equal to the angle of the tangent line relative to the x-axis
  
  radius = dist(0, 0, x, y); // Set radius of our rotation to the distance from (x, y) to (0, 0)

  originSlope = atan(y/x); // Find slope of line between current (x, y) and (0, 0) 

  deltaX = 2 * radius * sin(angle / 2) * cos(originSlope + (angle / 2) - HALF_PI); // What the change in x would be after rotation()
  deltaY = 2 * radius * sin(angle / 2) * sin(originSlope + (angle / 2) - HALF_PI); // What the change in y would be after rotation()

  rotate(-angle); // Not entirely sure why, but this only works if you rotate opposite the angle.

  image(sprite, x - deltaX, y - deltaY - 12, 30, 30); // Offset sprite location by deltaX and deltaY, causing rotate() to place it at our desired position
  
    
  if (!debugMode && keyPressed && key == 'b')
      debugMode = true;
      
  if (debugMode)
  {
      rotate(angle);
      fill(0);
      textSize(14);
      text("X: " + x + " Y: " + y, 10, 25);
      text("(Rounded) Slope at X: " + round(fslope), 10, 40);
      text("(Degrees) Angle of Rotation: " + round(degrees(angle)), 10, 55);
  }
}

// The graph to be surfed.
float equation(float x)
{
  x -= 250;
  float t = sq(x / 20) * cos(x / 20);
  t = -t + 250;
  return t;
}


