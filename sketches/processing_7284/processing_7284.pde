
// Example 5-6: Bouncing Ball
int x = int(random(16,184));
int y = int(random(16,184));
int speedX = int(random(1,5));
int speedY = int(random(1,5));

void setup() {
  size(200,200);
  smooth();
  ellipse(x,y,32,32);
}

void draw() {
  background(255); 
  // Add the current speed to the x location.
  x = x + speedX;
  y = y + speedY;
  // Remember, || means "or."
  if ((x > width-16) || (x < 16)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    //speedX = int(random(1,5))
    speedX = -1 * speedX;
    }
  if ((y > height-16) || (y < 16)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    speedY = -1 * speedY;
    //speedY = int(random(1,5));
  }
  // Display circle at x location
  stroke(0);
  fill(175);
  ellipse(x,y,32,32);
}
void mousePressed() {
  if (mouseButton == LEFT) {
  speedX = -1 * speedX;
} else if (mouseButton == RIGHT) {
  speedY = -1 * speedY;
} else if (mouseButton == CENTER) {
  speedX = int(random(-5,5));
  speedY = int(random(-5,5));
} if ((x > width-16) || (x < 16)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    //speedX = int(random(1,5))
    speedX = -1 * speedX;
    }
  if ((y > height-16) || (y < 16)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    speedY = -1 * speedY;
    //speedY = int(random(1,5));
  }
  stroke(0);
  fill(175);
  ellipse(x,y,32,32);
}

