
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
  fill(255);
  
  // draw h, m, s
  drawNumber(hour(), selected == 'h', -gap, 0);
  drawNumber(minute(), selected == 'm', 0, 0);
  drawNumber(second(), selected == 's', gap, 0);
  color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  drawBanner(c, 10);
  
  displayHourArc();
  displayMinuteArc();
  displaySecondArc();
}


/*
 * drawNumber
 * takes an integer and draws it offset from the centre of the screen by
 * offsetX and offsetY. If big is true then use a big size for the type.
 *
 */
 
 void displayHourArc() {
  int x = width/2 - 300;
  int y = height/2;
  float arc_start = PI+HALF_PI;
  float arc_stop = arc_start + map( hour()/2, 0, 12, 0, TWO_PI );
  stroke(255, 0, 0, 128);
  strokeWeight(10);
  noFill();
  arc(x, y, 100, 100, arc_start, arc_stop);
}
 
 
void displayMinuteArc() {
  int x = width/2;
  int y = height/2;
  float arc_start = PI+HALF_PI;
  float arc_stop = arc_start + map( minute(), 0, 60, 0, TWO_PI );
  stroke(0, 255, 0, 128);
  strokeWeight(10);
  noFill();
  arc(x, y, 100, 100, arc_start, arc_stop);
}
 
 
void displaySecondArc() {
  int x = width/2 + 300;
  int y = height/2;
  float arc_start = PI+HALF_PI;
  float arc_stop = arc_start + map( second(), 0, 60, 0, TWO_PI );
  stroke(0, 0, 255, 128);
  strokeWeight(10);
  noFill();
  arc(x, y, 100, 100, arc_start, arc_stop);
}
 
void drawNumber(int number, boolean big, float offsetX, float offsetY) {
  String theText = str(number); // convert number to string
  if (big)
    textSize(400); // set big font size
  else
    textSize(20);  // normal font size

  float textWidth = textWidth(theText) * 0.5;
  float textAscent = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, width/2 - textWidth + offsetX, height/2 + textAscent + offsetY);
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



