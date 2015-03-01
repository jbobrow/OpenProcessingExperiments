
/*
 * Creative Coding
 * Week 5, 02 - Digital Clock
 * by Indae Hwang and Jon McCormack
 * modified badly by Neroli Wesley
 * Don't read this to learn!
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows how to use text in Processing
 * The sketch creates a digital clock that shows the current time in hours, minutes and seconds
 * Use the 'h', 'm' and 's' keys to enlarge the hours, minutes or seconds in the display.
 *
 */
PFont myFont;    // font data
char  selected;  // what is selected (h,m,s)
int   gap;       // gap between digits
float hue;
float saturation;
float brightness;


void setup() {
  size(960, 600);
  colorMode(HSB);
  myFont = loadFont("Rod-120.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  gap = 350;
  noStroke();
}
/*
 * drawNumber
 * takes an integer and draws it offset from the centre of the screen by
 * offsetX and offsetY.
 */
void drawNumber(color c, int aNumber, float offsetX, float offsetY) {
  String theText = str(aNumber); // convert number to string
    textSize(200); // set font size

  float textyWidth = textWidth(theText) * 0.5;
  float textyAscent = textAscent() * 0.375;
  fill(c);
  // draw text offset from the centre of the screen
  text(theText, width/2 - textyWidth + offsetX, height/2 + textyAscent + offsetY+15);
  //println(textWidth);
  //println(textAscent);
}

/*
 * drawBG
 * draw a coloured bacground based on the time as hsb
 */
void drawBanner(color c) {
  noStroke();
  //fill(255,0,0);
  fill(c);
  rect(0, 0, width, 200);
  rect(0, 400, width, height);
}
void draw() {
  // refresh background
  background(0);
  fill(255);
  
  // create hsb colour by mapping time onto hsb
  hue = map(hour(), 0, 24, 20, 360);
  //println(hour());
  saturation = map(minute(), 0, 60, 20, 99);
  brightness = map(second(), 0, 60, 20, 99);
  color c = color(hue,saturation,brightness);
  drawBanner(c);
// draw h, m, s
  drawNumber(c, hour(), -gap, 0);
  drawNumber(c, minute(), 0, 0);
  drawNumber(c, second(), gap, 0);
  //color c = color(selected == 'h' ? 180 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
}
