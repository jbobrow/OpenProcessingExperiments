
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 5-6: Bouncing Ball
int x = 0;
int speed = 1;
PFont font;
PImage img1;

void setup() {
  size(600,397);
  smooth();
  font = loadFont("Neuton-Extrabold-48.vlw");
  textFont(font);
  img1 = loadImage("caution.jpg");
  frameRate(120);
}

void draw() {

  image(img1,0,0);
  // Add the current speed to the x location.
  x = x + speed;

  // Remember, || means "or."
  if ((x > 550) || (x < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    speed = speed * -1;
  }

  // Display circle at x location
  stroke(0);
  fill(226,187,109,240);
  text("bridge out",x/1.3,230);
  fill(95,44,17,250);
  text("stop",x,250);
  fill(117,215);
  text("do not enter",x/1.5,180);
  fill(70,99,69,230);
  text("DANGER",x/1.1,200);
}


