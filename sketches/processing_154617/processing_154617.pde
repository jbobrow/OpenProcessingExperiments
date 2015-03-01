
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
  size(900, 600);

  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  gap = 250;
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
    textSize(400); // set big font size
  else
    textSize(20);  // normal font size

  //float textWidth = textWidth(theText) * 0.5;
  //float textAscent = textAscent() * 0.375;
  float tW = textWidth(theText) * 0.5;
  float tA = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  //text(theText, width/2 - textWidth + offsetX, height/2 + textAscent + offsetY);
  text(theText, width/2 - tW + offsetX, height/2 + tA + offsetY);
}

/*
 * drawBanner
 * draw a coloured banner at the bottom of the screen in the supplied colour
 */
void drawBanner(color c, float w) {
  noStroke();
  fill(c);
  rect(0, height - w, width, w);

  stroke(255);
  if (selected=='h') {
    float x=width/2 - gap;
    float y=height*4/5;
    float r=50;
    ellipse(x, y, 2*r, 2*r);
    float x1=x+0.9*r*cos(-((float)(hour()<12? hour() : hour()-12)/12*TWO_PI)+HALF_PI);
    float y1=y+0.9*r*-sin(-((float)(hour()<12? hour() : hour()-12)/12*TWO_PI)+HALF_PI);
    line(x, y, x1, y1);
    fill(255);
    ellipse(x1, y1, 5, 5);
  }
  else if (selected=='m') {
    float x=width/2 - 0;
    float y=height*4/5;
    float r=50;
    ellipse(x, y, 2*r, 2*r);
    float x1=x+0.9*r*cos(-((float)minute()/60*TWO_PI)+HALF_PI);
    float y1=y+0.9*r*-sin(-((float)minute()/60*TWO_PI)+HALF_PI);
    line(x, y, x1, y1);
    fill(255);
    ellipse(x1, y1, 5, 5);
  }
  else if (selected=='s') {
    float x=width/2 + gap;
    float y=height*4/5;
    float r=50;
    ellipse(x, y, 2*r, 2*r);
    float x1=x+0.9*r*cos(-((float)second()/60*TWO_PI)+HALF_PI);
    float y1=y+0.9*r*-sin(-((float)second()/60*TWO_PI)+HALF_PI);
    line(x, y, x1, y1);
    fill(255);
    ellipse(x1, y1, 5, 5);
  }
}



void keyReleased() {
  // set selected to be the last key released
  selected = key;
}

void mouseMoved() {
  selected=' ';
  if (width/2 - textWidth(str(hour()))*0.5 - gap < mouseX && mouseX < width/2 + textWidth(str(hour()))*0.5 - gap) selected='h';
  if (width/2 - textWidth(str(hour()))*0.5 - 0 < mouseX && mouseX < width/2 + textWidth(str(hour()))*0.5 - 0) selected='m';
  if (width/2 - textWidth(str(hour()))*0.5 + gap < mouseX && mouseX < width/2 + textWidth(str(hour()))*0.5 + gap) selected='s';
}

