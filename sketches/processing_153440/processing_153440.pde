
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
  size(600, 400);

  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  gap = 180;
  noStroke();
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(3);
  color hourPhase  = int(map(hour(), 0, 24, 0, 255));
  fill(hourPhase, int(hourPhase/60)  , int(hourPhase/60));
  ellipse(width/2 - gap, height/2, 120, 120);
  color minPhase  = int(map(minute(), 0, 60, 0, 255));
  fill(int(minPhase/60), minPhase , int(minPhase/60));
  ellipse(width/2, height/2, 120, 120);
  color secPhase  = int(map(second(), 0, 60, 0, 255));
  fill(int(secPhase/60), int(secPhase/60) , secPhase);
  ellipse(width/2 + gap, height/2, 120, 120);
  //fill(255);
  // draw h, m, s
  float secsPos = map(second(), 0, 60, 0 , TWO_PI);
  float minsPos = map(minute(), 0, 60, 0 , TWO_PI);
  float hrsPos = map(hour(), 0, 24, 0 , TWO_PI);
  color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  drawNumber(hour(), selected == 'h', -gap, 0, hrsPos, c);
  drawNumber(minute(), selected == 'm', 0, 0, minsPos, c);
  drawNumber(second(), selected == 's', gap, 0, secsPos, c);
  //color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  //drawBanner(c, 10);

}

/*
 * drawNumber
 * takes an integer and draws it offset from the centre of the screen by
 * offsetX and offsetY. If big is true then use a big size for the type.
 *
 */
void drawNumber(int number, boolean big, float offsetX, float offsetY, float position, color c) {
  String theText = str(number); // convert number to string
  if (big){
    textSize(25); // set big font size
    fill(c);}
  else{
    textSize(15);  // normal font size
    fill(255);}
  float textWidthfoo = textWidth(theText) * 0.5;
  float textAscentfoo = textAscent() * 0.375;
  float xPosition = (width/2 - textWidthfoo + offsetX) + 85* cos(position-HALF_PI);
  float yPosition = (height/2 + textAscentfoo + offsetY) + 85* sin(position-HALF_PI);
  float xLine = (width/2 + offsetX) + 65* cos(position-HALF_PI);
  float yLine = (height/2 + offsetY) + 65* sin(position-HALF_PI);

  // draw text offset from the centre of the screen
  //text(theText, width/2 - textWidth + offsetX, height/2 + textAscent + offsetY);
  text(theText, xPosition, yPosition);
  line(width/2 + offsetX,height/2 + offsetY, xLine, yLine);
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



