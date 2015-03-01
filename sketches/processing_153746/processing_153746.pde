
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

  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23


void setup() {
  size(900, 600);

  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to font
  selected = '0';
  gap = 200;
  noStroke();
}

void draw() {
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  if (h < 4) {
    background(#0F1F5A);
  }
  if (h > 4 && h < 6) {
    background(#2A3F90);
  }
   if (h > 5 && h < 7) {
    background(#667AC6);
  }
  if (h > 6 && h < 8) {
    background(#EFF0A7);
  }
  if (h > 7 && h < 16){
    background(#F7F7E1);
  }
  if (h > 15 && h < 19) {
    background(#64B3CE);
  }
  if (h > 18 && h < 20) {
    background(#A553C9);
  }
  if (h > 19 && h < 22) {
    background(#762998);
  }
  if (h > 21 && h < 24) {
    background(#3D0C52);
  }
  fill(255);
  
  // draw h, m, s
  drawNumber(h, selected == 'h', -gap, 0);
  drawNumber(m, selected == 'm', 0, 0);
  drawNumber(s, selected == 's', gap, 0);
 // color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
 // drawBanner(c, 10); 
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
    textSize(300); // set big font size
  else
    textSize(30);  // normal font size

  float textWidthVar = textWidth(theText) * 0.5;
  float textAscentVar = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, width/2 - textWidthVar + offsetX, height/2 + textAscentVar + offsetY);
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


