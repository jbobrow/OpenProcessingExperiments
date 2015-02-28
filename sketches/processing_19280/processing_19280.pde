
int x = 0;
int speed = 1;

void setup() {
  size(250,250);
  smooth();
}

void draw() {
  background(255);

  // Add the current speed to the x location.
  x = x + speed;
  if ((x > width) || (x < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    speed = speed * -1;
  }

  // Display circle at x location
  stroke(0);
  fill(0);
  ellipse(x,100,32,32);
}


