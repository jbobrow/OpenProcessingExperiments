
// The message to be displayed
String message = "HAPPY TEXT AROUND AN ARC";

PFont f;
// The radius of a circle
float r = 130;

void setup() {
  size(350, 350);
  
  f = createFont("FUTURA",35,true);
  textFont(f);
  // The text must be centered!
  textAlign(CENTER);
  smooth();
}

void draw() {
  background(255);

  // Start in the center and draw the circle
  translate(width / 2, height / 2);
  fill(20,200,200);
  ellipse(0, 0, r*2, r*2);

  // We must keep track of our position along the curve
  float arclength = 0;

  // For every box
  for (int i = 0; i < message.length(); i++)
  {
    // Instead of a constant width, we check the width of each character.
    char currentChar = message.charAt(i);
    float w = textWidth(currentChar);

    // Each box is centered so we move half the width
    arclength += w/2;
    // Angle in radians is the arclength divided by the radius
    // Starting on the left side of the circle by adding PI
    float theta = PI + arclength / r;    

    pushMatrix();
    // Polar to cartesian coordinate conversion
    translate(r*cos(theta), r*sin(theta));
    // Rotate the box
    rotate(theta+PI/2); // rotation is offset by 90 degrees
    // Display the character
    fill(0,255,0);
    text(currentChar,0,0);
    popMatrix();
    // Move halfway again
    arclength += w/2;
  }
}

