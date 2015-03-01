
/*
 * Creative Coding
 * Week 5, 01 - Basic Text
 * by Jon McCormack
 *
 *Challenge - keep the text reporting the location of the target inside the presentation window -
 */

PFont myFont;      // STEP 1: the font to be used
float xSize = 10;

void setup() {
  size(400, 400);

  String [] fonts = PFont.list();
  println("Fonts available:");
  println(fonts);

  // STEP 2: create the font object and reference it to myFont
  // Using the Arial font, 16 point with antialiasing (smoothing)
  myFont = createFont("Arial", 16, true); 

  // STEP 3: use myFont at size 24
  textFont(myFont, 24);

  // set the fill colour to white
  fill(255);
}

void draw() {
  // clear the screen to black
  background(0);

  // get the current mouse position as a string in the form "(x,y)"
  String mousePosition = "(" + str(mouseX) + "," + str(mouseY) + ")";

  // STEP 4: display the mousePosition string at the current mouse location
  // text(mousePosition, mouseX, mouseY);

  // STEP 4: display the mousePosition string - start typing at the center of the display window
  text(mousePosition, (width/2), (height/2));

  // draw the red '+' at the mouse location
  stroke(255, 0, 0);
  line(mouseX - xSize, mouseY, mouseX + xSize, mouseY);
  line(mouseX, mouseY - xSize, mouseX, mouseY + xSize);
}
