
/*
 *  Title: P10_02_AppendedTextData
 *  By:    Barton Poulson (artbybart.org & dataliteracy.com)
 *  Date:  06 March 2013
 *
 *  Assignment: 
 *    Create a sketch data that uses text data from an appended .txt 
 *    file. You can use real data or you can create artificial data 
 *    for this exercise.
 *
 *  Note:
 *    Once again, fonts don't seem to transfer when saving as javascript
 *    for import into OpenProcessing. Very frustrating.
 */

String[] t;  // Create string array to hold text data

// Create color array: background, line, text
color[] c = {#CCCCCC, #CC0000, #333333};

PFont f;      // Font for dynamic text
PFont s;      // Font for "subtext" instructions
float x = 0;  // Sets beginning x coordinate
float y;      // Declares y variable
int i = 0;    // Declares/initializes index variable
int inc = +1;  // Sets direction of increment

// Array of easing speeds for different words in text file
float[] e = {1, .6, .3, .1, .05, .03, .02, .01};

void setup() {
  size(800, 200);
  smooth();
  noCursor();
  y = height/2;
  f = loadFont("Serif-48.vlw");
  s = loadFont("SansSerif-12.vlw");
  t = loadStrings("faster.txt");
  textFont(f);
}

void draw() {
  background(c[0]);
  
  // Instructions
  textFont(s);
  text("move and click mouse", 10, height - 10);
  
  // Vertical red line replaces cursor
  stroke(c[1]);
  line(mouseX, 0, mouseX, height);
  
  // Place text
  textFont(f);
  x += (mouseX - x) * e[i];
  text(t[i], x + 10, y);
}

// Changes text and easing speed when mouse is clicked
// Cycles down through text file and then back up, etc.
void mousePressed() {
  i += inc;
  if ((i == 7) || (i == 0)) inc = -1 * inc;  // Reverse direction at ends
}

