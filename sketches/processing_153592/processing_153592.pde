
/*
 * Creative Coding
 * Week 5, 02 - Digital Clock
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows how to use text in Processing
 * The sketch creates a digital clock that shows the current time in hours, minutes and seconds
 * Use the 'h', 'm' and 's' keys to enlarge the hours, minutes or seconds in the display.
 *
 */
PFont myFont;       // font data
char  selected;     // what is selected (h,m,s)
int   gap;          // gap between digits


void setup() {
  size(924, 600);
  // using createFont() instead of loadFont() for it to work in JavaScript
  // RADIOLAND.TTF is stored in the data directory.
  myFont = createFont("RADIOLAND", 144);
  textFont(myFont);  // set the current font to myFont
  textSize(72);
  selected = '0';
  gap = 300;
  noStroke();
}

void draw() {

  float grey = map(hour()-6, 0, 24, 255, 0);
  background(grey);

  float r = map(hour(), 0, 24, 0, 255);
  float g = map(minute(), 0, 60, 0, 255);
  float b = map(second(), 0, 60, 0, 255);


  // draw h, m, s
  fill(r, 0, 0);
  drawNumber(hour(), selected == 'h', -gap, 0);
  fill(0, g, 0);
  drawNumber(minute(), selected == 'm', 0, 0);
  fill(0, 0, b);
  drawNumber(second(), selected == 's', gap, 0);
  fill(r, g, b);
  textSize(44);
  textAlign(CENTER, BOTTOM);
  text("... tempus fugit ...", width/2-40, 500);
  color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  drawBanner(c, 10);
}

/*
 * drawNumber
 * takes an integer and draws it offset from the centre of the screen by
 * offsetX and offsetY. If big is true then use a big size for the type.
 *
 */
void drawNumber(int number, boolean big, float offsetX, float offsetY) {
  String theText = str(number); // convert number to string
  if (big)
    textSize(144); // set big font size
  else
    textSize(72);  // normal font size

  float myTextWidth = textWidth(theText) * 0.5;
  float myTextAscent = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, width/2 - myTextWidth + offsetX, height/2 + myTextAscent + offsetY);
}

/*
 * drawBanner
 * draw a coloured banner at the bottom of the screen in the supplied colour
 */
void drawBanner(color c, float w) {
  noStroke();
  fill(c);
  rect(0, height-w, width, w);
}

void keyReleased() {
  // set selected to be the last key released
  selected = key;
}



