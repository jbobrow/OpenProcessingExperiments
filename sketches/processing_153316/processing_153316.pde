
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
PFont myFont;    // font data
char  selected;  // what is selected (h,m,s)
int   gap;       // gap between digits


void setup() {
  size(1024, 600);

  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  gap = 300;
  noStroke();
}

void draw() {
  background(127,127,127);
  fill(255);
  
  color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  drawBanner(c, 10);
  colorMode(HSB,255,255,255);
  color darkNess = color(cos((float)minute()/59*PI)*255, cos((float)second()/59*PI)*255,cos((float)hour()/23*PI)*255);
  fill(darkNess,127);
  rect(0,0,width,height);
  colorMode(RGB);
  // draw h, m, s
  drawNumber(hour(), selected == 'h', -gap, cos((float)hour()/23*TWO_PI)*250, sin((float)hour()/23*PI)*255);
  drawNumber(minute(), selected == 'm', 0, cos((float)minute()/59*TWO_PI)*250, sin((float)minute()/59*PI)*255);
  drawNumber(second(), selected == 's', gap, cos((float)second()/59*TWO_PI)*250, sin((float)second()/59*PI)*255);

}

/*
 * drawNumber
 * takes an integer and draws it offset from the centre of the screen by
 * offsetX and offsetY. If big is true then use a big size for the type.
 *
 */
void drawNumber(int number, boolean big, float offsetX, float offsetY, float dayLight) {
  String theText = str(number); // convert number to string
  if (big)
    textSize(50); // set big font size
  else
    textSize(20);  // normal font size

  float textWidthVal = textWidth(theText) * 0.5;
  float textAscentVal = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  fill(dayLight);
  stroke(255);
  strokeWeight(2);
  text(theText, width/2 - textWidthVal + offsetX, height/2 + textAscentVal + offsetY);
}

/*
 * drawBanner
 * draw a coloured banner at the bottom of the screen in the supplied colour
 */
void drawBanner(color c, float w) {
  noStroke();
  fill(c);
  rect(0, height - w, width, w);
}



void keyReleased() {
  // set selected to be the last key released
  selected = key;
}



