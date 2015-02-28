
/**
 * Text revealing flashlight<br>
 * Click to reverse the effect<br>
 * Use the UP and DOWN arrows to change the light size
 *
 * <p>Elie Zananiri<br>
 * ACAD Processing workshop<br>
 * April 2008</p>
 */

/*------- global variables ----------*/
int TRACKING = 2;

PFont f;
byte[] textFile;  // contents of external file split by glyphs
int lineHeight;

float flashlightSize = 50;
boolean whiteOnBlack = true;  // light mode toggle

/*------- initialization ------------*/
void setup() {
  size(400, 580);
  smooth();
  colorMode(RGB, 1.0);
  noCursor();

  // load and set the font
  f = loadFont("Mandingo-24.vlw");
  textFont(f, 12);
  lineHeight = int(textAscent()+textDescent());

  // load the contents of the external file into the byte array
  textFile = loadBytes("hamsters.txt");
}

/*------ function definitions -------*/
// writes a grid of characters with the ones closest to the mouse being brighter
void drawText() {
  // draw all characters in the grid one at a time
  int currX = TRACKING;
  int currY = lineHeight;
  for (int i=0; i < textFile.length; i++) {
    // get the next character
    char c = char(textFile[i]);
    if (Character.isWhitespace(c)) {
      // if it's any type of whitespace (space, tab, line feed), 
      // convert it to a single space
      c = ' ';
    }
    
    // calculate the distance between the current position and the mouse
    float distance = dist(currX, currY, mouseX, mouseY);
    // set a fill color relative to that distance
    float col = map(distance, 0, flashlightSize, 0, 1);
    if (whiteOnBlack) {
      col = 1-col;
    }
    
    // draw the character
    fill(col);
    text(c, currX, currY);
    
    // set the next position
    currX += int(textWidth(c)+TRACKING);
    if (currX > (width-TRACKING)) {
      // go to the next line
      currX = TRACKING;
      currY += lineHeight+TRACKING;
    }
    
    // if we've reached the end of the window
    if (currY > height) {
      // skip the remaining characters
      break;
    }
  }
}

/*------ event handlers -------------*/
void keyReleased() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      flashlightSize -= 5;
    } else if (keyCode == UP) {
      flashlightSize += 5;
    }
  }
}

void mouseReleased() {
  whiteOnBlack = !whiteOnBlack;
}

/*------ main loop ------------------*/
void draw() {
  // erase the background
  if (whiteOnBlack) {
    background(0);
  } else {
    background(1); 
  }
  
  drawText();
}


