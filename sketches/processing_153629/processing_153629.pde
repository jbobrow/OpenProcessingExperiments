
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
  background(0);
  //color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  fill(255);
  
  // draw h, m, s
  color n = color(selected == 'h' ? 255 : 22, selected == 'm' ? 255 : 120, selected == 's' ? 255 : 237);
  drawNumber(hour(), selected == 'h', -gap, 0, n);
  drawNumber(minute(), selected == 'm', 0, 0, n);
  drawNumber(second(), selected == 's', gap, 0, n);
  
  color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  drawBanner(c, 10);
  
  if(hour() >= 6 || hour() <= 18)
  {
    color sun = color(231, 247, 12, 30 * (hour() - 6));
    drawSun(85 * (hour() - 6), 20 * (hour() - 6), sun);
  }
  
  if(hour() <= 6 || hour() >= 18)
  {
    color moon = color(242, 250, 255, 30 * (hour() - 6));
    drawMoon(85 * (hour() - 6), 20 * (hour() - 6), moon);
  }
}

/*
 * drawNumber
 * takes an integer and draws it offset from the centre of the screen by
 * offsetX and offsetY. If big is true then use a big size for the type.
 *
 */
void drawNumber(int number, boolean big, float offsetX, float offsetY, color n) {
  fill(n);
  String theText = str(number); // convert number to string
  if (big)
    textSize(400); // set big font size
  else
    textSize(20);  // normal font size

  float mytextWidth = textWidth(theText) * 0.5;
  float mytextAscent = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, width/2 - mytextWidth + offsetX, height/2 + mytextAscent + offsetY);
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


void drawSun(int x, int y, color c)
{
  fill(c);
  noStroke();
  ellipse(x, y, 100, 100);
}

void drawMoon(int x, int y, color c)
{
  fill(c);
  noStroke();
  ellipse(x, y, 100, 100);
}



void keyReleased() {
  // set selected to be the last key released
  selected = key;
}



