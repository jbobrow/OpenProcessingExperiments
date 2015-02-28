
/*
 My goal for this assignment was to create different 'brushes'
 for painting on a blank canvas. Instead of using shapes, 
 for some reason I decided to use letters - specifically, Greek letters.
 I ended up with 5 brushes, with sizes that can be varied with the arrow keys.
 
 Hotkeys:
 Press C to change background color and clear the canvas.
 Press S to save the picture - can save multiple times (see references).
 Press number keys 1 through 5 to access the brushes.
 Drag the mouse to use the first 3 brushes.
 Click the mouse to use brushes 4 and 5.
 Increase the font size (except for brush #5 which has random sizes) with the up arrow key.
 Decrease the font size with the down arrow key.
 Increase the radius of the round brushes with the right arrow key.
 Decrease the radius of the round brushes with the left arrow key.
 
 References:
 http://forum.processing.org/one/topic/color-change-background-with-click.html
 http://www.processing.org/tutorials/text/
 http://processing.org/reference/String_charAt_.html
 http://wiki.processing.org/w/How_to_manage_the_steps_of_a_game:_increasing_levels,_displaying_messages,_etc.%3F
 http://www.processing.org/reference/keyCode.html
 http://forum.processing.org/one/topic/saving-multiple-images-on-keypressed.html
 key presses: http://www.processing.org/discourse/beta/num_1269931902.html 
 download link: http://www.openprocessing.org/sketch/136396
 */

int width = 1280;
int height = 720;
// counter for the start screen
int counter = 0;
// number of rings in the circular brush 
int numOfRings = 3;
int fontSize = 24;
// number for the saved image
int number = 0;

// saturation
float sat; 
//brightness
float b; 
float hue;
// round brush radius
float radius = 15;

// boolean array for pressed number keys
boolean[] bKeys = new boolean[5];
// boolean to prevent drawing on the start screen
boolean displayStartScreen = true; 

// used to create font
PFont f;

// the Greek alphabet in Unicode
String alphabet = "\u0391\u0392\u0393\u0394\u0395\u0396 " +
"\u0397\u0398\u0399\u039A\u039B\u039C " +
"\u039D\u039E\u039F\u03A1\u03A3\u03A4 " +
"\u03A5\u03A6\u03A7\u03A8\u03A9 " +
"\u03B1\u03B2\u03B3\u03B4\u03B5\u03B6 " +
"\u03B7\u03B8\u03B9\u03BA\u03BB\u03BC " +
" \u03BD\u03BE\u03BF\u03C1\u03C2\u03C3\u03C4, " +
" \u03C5\u03C6\u03C7\u03C8\u03C9";


void setup()
{
  size(width, height);
  sat = random(height);
  b = 100;
  f = createFont("CourierBold ", 20, true);
  textFont(f);
  colorMode(HSB, width, height, 100);
  background(hue, sat, b, 100);
  rectMode(CENTER);
  textAlign(CENTER);
  smooth();
  frameRate(60);
 // set the boolean for the double brush to true
  bKeys[2] = true;
}

void draw() {
  drawStartScreen();
}

void mouseReleased() {
  // wait to draw until the start screen is gone 
  if (displayStartScreen == false) {
    // press '4' and click to get a circle of text
    if (bKeys[3]) {
      circleBrush(numOfRings, fontSize);
    }
    // press '5' and click to get  a line of text
    else if (bKeys[4]) {
      lineBrush();
    }
  }
}

void mouseDragged()
{
  // no drawing on the start screen
  if (displayStartScreen == false) {
    // press '1' and drag the mouse to get a round brush
    if (bKeys[0]) {
      ringBrush(radius, fontSize);
    }
    //press '2' and drag the mouse to get a ribbon brush
    else if (bKeys[1]) {
      ribbonBrush(mouseX, mouseY, fontSize);
    }
    // press '3' and drag the mouse to get the double brushes
    else if (bKeys[2]) {
      doubleBrush(mouseX, mouseY, fontSize);
    }
  }
}

// keyReleased (!keyPressed) to disallow multiple key presses
void keyReleased() {
  // set boolean of pressed key to true
  char pressedKey = key;
  switch (pressedKey) {
  case '1':
    boolCheck(); 
    bKeys[0] = true; 
    break;
  case '2':
    boolCheck();  
    bKeys[1] = true;
    break;
  case '3':
    boolCheck(); 
    bKeys[2] = true;
    break;
  case '4':
    boolCheck(); 
    bKeys[3] = true; 
    break;
  case '5':
    boolCheck(); 
    bKeys[4] = true; 
    break;
  } // end switch

  if ( key==CODED ) {
    if ( keyCode == UP) { 
      // increase font size (to infinity?)
      fontSize += 4;
    }
    if ( keyCode == DOWN) { 
      // decrease font size
      fontSize -= 4; 
      //but not to zero
      if (fontSize <= 0) {
        fontSize = 4;
      }
    }
    if ( keyCode == LEFT ) { 
      // decrease the radius of the round brushes
      radius -= 5; 
      // but not to zero
      if (radius <= 0) {
        radius = 5;
      }
      // decrease the number of 'rings' with the radius
      if (radius%25 == 0) {
        numOfRings -=1;
      }
    }
    if ( keyCode == RIGHT ) {
      // increase the radius of the round brushes
      radius += 5;
      // increase the number of 'rings' with the radius
      if (radius%25 == 0) {
        numOfRings +=1;
      }
    } 
    println(radius);
    println(fontSize);
  }

  // press C to redraw the background
  if (key == 'c' || key == 'C') {
    sat = random(height);
    b = random(100);    
    hue += 20;
    hue %= width;
    background(hue, sat, b);
  }
  // you can save multiple pictures
  // from: http://forum.processing.org/one/topic/saving-multiple-images-on-keypressed.html
  if (key == 's') {
    println("Saving...");
    String s = "screen" + nf(number, 4) +".jpg";
    save(s);
    number++;
    println("Done saving.");
  }
}

// so no more than 1 brush available at a time
void boolCheck() {
  // set all booleans in bKey array to false before setting 1 to true
  for (int i = 0; i < bKeys.length;  i++) {
    bKeys[i] = false;
  }
}

// the brushes
// adapted from www.processing.org/tutorials/text/
void ringBrush(float radius, int fontSize) {
  pushMatrix();
  translate(mouseX, mouseY);
  // We must keep track of our position along the curve
  float arclength = 0;
  float w = 0;
  // For every letter
  for (arclength = 0; arclength <= (radius*TWO_PI)+w/2; arclength += w/2) {
    fill(random(width), random(height), random(100), 255);
    textSize(fontSize);
    //stop printing letters at 360º
    if (arclength < TWO_PI*radius) {
      // Instead of a constant width, we check the width of each character.
      char currentChar = alphabet.charAt(int(random(48)));
      w = textWidth(currentChar);
      // Angle in radians is the arclength divided by the radius   
      float theta = arclength / radius;    
      pushMatrix();
      // Polar to cartesian coordinate conversion
      translate(radius*cos(theta), radius*sin(theta));
      // Display the character
      text(currentChar, 0, 0);
      popMatrix();
      // Move halfway again
      arclength += w/2;
    }
  }
  popMatrix();
}

void circleBrush(int numOfRings, int fontSize) {
  float radius = -5;
  for (int i = 0; i < numOfRings;  i++) {
    ringBrush(radius += 20, fontSize += 6);
  }
}

void lineBrush() {
  // one click produces a line of text
  for (int i = 0; i < alphabet.length();  i++) {
    fontSize = int(random(18, 48));
    ribbonBrush(mouseX, mouseY, fontSize);
  }
}

void ribbonBrush(float x, float y, int fontSize) {
  fill(random(width), random(height), random(100), 255);
  char letter = alphabet.charAt(int(random(48))); 
  textSize(fontSize);
  text(letter, x, y);
  mouseX += 2 * textWidth(letter);
}

// 2 brushes for the price of one
void doubleBrush(float px, float py, int fontSize) {
  ribbonBrush(px, py, fontSize);
  ribbonBrush(width/2 + ((width/2) - px), py, fontSize);
}

// the start screen
void drawStartScreen() { 
  if (displayStartScreen )
  {
    counter++;
    fill(#222D64);   
    rect(width/2, height/2, 1280, 720);
    setText(45);
  }
  // if the spent time is over 4 seconds
  if (counter > 240 ) 
  {
    //change the cursor
    cursor(CROSS);
    // draw the background and erase the start screen
    background(hue, sat, b);
    // reset the counter
    counter = 0; 
    //set boolean to false in order to paint
    displayStartScreen = false;
  }
}

// the start screen message
void setText(int y) {
  String[] message = {
    "Press C to change the canvas", 
    "Press S to save the drawing", "Press 1 thru 5 to change the brush", 
    "Press arrow keys to change the brush size", "Drag the mouse to paint with brushes 1 thru 3", 
    "Click the mouse to paint with brushes 4 and 5"
  };
  textSize(24);
  fill(#F6FA1E);
  text(4 - counter/60, width/2, y);
  text("PAINT WITH LETTERS", width/2, y+200);
  for (int i = 0; i < 6;  i++) {
    text(message[i], width/2, y + 250 + i*30);
  }
}

