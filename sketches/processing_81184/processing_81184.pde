
int d = 0;
//no particular reason why I put d but it stands for direction
int speed = 19;
PImage img;

void setup () {
  size(631,417);
  img = loadImage("tennis.jpg");
}

void draw() {
  background(255);
  image (img,0,0);

  // Add the current speed to the x location.
  d = d + speed;

  // Remember, || means "or."
  if ((d > 347) || (d < -200)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    speed = speed * -1;
  }

  // Display circle at x location
  stroke(0);
  fill(#dcea00);
  // fill # 6 digit determines the colour of the ball
  ellipse(d,100,80,80);
  // 100 is the position, and 80 refers to the size of the ball
  
}

