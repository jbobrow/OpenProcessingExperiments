


float x = 0;
float y = 0;
float circleXspeed = 4;
float circleYspeed = 1.5;
float r = 32;

void setup() {
  size(400,400);
  smooth();
}

void draw() {
  background(255);

  // this will add the current speed to the x location.
  x = x + circleXspeed;
  y = y + circleYspeed;

  // || means "or."
  if ((x > width) || (x < 0)) {
    // if the circle reaches the edge of the window, multiply speed by -1 will turn it around.
    circleXspeed = circleXspeed * -1;
    r = 80;
  }
  
   // || means "or."
  if ((y > height) || (y < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    circleYspeed = circleYspeed * -1;
    r = 80;
  }



  // Display circle at x location
  fill(167,242,48);
  stroke(0);
  ellipse(x,y,r,r);
  
  r = constrain(r-4,32,64);
  
}

