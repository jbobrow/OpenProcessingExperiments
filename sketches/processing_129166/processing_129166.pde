
/**
 This is a simple exmaple of writing on a curve. 
 Again, this is based on the Processing text tutorial
 http://www.processing.org/tutorials/text/
 
 The main difference is a different combination of transformations
 to put the letters in the right place. This also has an addition
 (not seen in class) that centers the text on the top of the circle.
 
 
 C. Andrews
 2014-01-20
 **/

String str = "Bowties are cool";
PFont font;
float w = 40;
float h = 40;
float r = 100;


void setup() {
  size(600, 600);
  font = createFont("Arial", 48, true);
  background(255);
  smooth();
  textFont(font);
  textAlign(CENTER);
  strokeWeight(1);
  noLoop();
}


void draw() {
  // move the origin to the center of the canvas
  translate(width/2, height/2);

  // Draw a a circle with radius r
  noFill();
  stroke(0);
  ellipse(0, 0, r*2, r*2);   

  // current distance around the circle
  float arcLength = 0; 

  // total number of radians that the text will consume
  float totalAngle = textWidth(str) / r;

  // iterate over each individual character in the String
  for (int i = 0; i < str.length();i++) {
    // charAt(i) gets the character at position i in the String
    char currentChar = str.charAt(i); 
    float w = textWidth(currentChar);
    // since the letters are drawn centered, we advance by half a letter width
    arcLength += w/2;

    // use a some trig to find the angle matching this arclength
    // the totalAngle/2 just adds some additional rotation so the 
    // text starts wraps evenly around the circle
    float theta = arcLength / r - totalAngle/2;

    // save our current origin
    pushMatrix();
    // rotate to line up with the orientation of the letter
    rotate(theta);
    // translate out along the radius to where the letter will be drawn 
    translate(0, -r);
    // set the fill based on which character we are on
    fill(0, 80 + 20*i);
    // draw the character
    text(currentChar, 0, 0);
    // pop back to our origin in the middle of the circle
    // (undoing the rotate and translate)
    popMatrix();
    // add the other half of the character width to our current position
    arcLength += w/2;
  }
}



/**
 This is a little helper function that draws an XY coordinate axis .
 
 If you want to see where the coordinate axis is and which way it is facing,
 put drawAxis() in the code above.
 **/
void drawAxis() {
  stroke(255, 0, 0);
  line(0, 0, 20, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 20);
}



