
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
color whi;

// Wheel radius: inner and outer
float innerR = 75; // inner
float outerR = 150; // outer


void setup() {
  size(960, 400);
  colorMode(HSB, 360, 100, 100);
  whi = color(0,0,100);
  
  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  gap = 300;
  noStroke();
}

void draw() {
//  background(15*hour(), 40, 25);
//  background(6*minute(), 40, 25);
  background(6*second(), 40, 25);
  
  drawHourWheel();
  drawMinWheel();
  drawSecWheel();
  
  // draw h, m, s
  drawNumber(hour(), selected == 'h', -gap, 0);
  drawNumber(minute(), selected == 'm', 0, 0);
  drawNumber(second(), selected == 's', gap, 0);
//  color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  color cM = color(6*minute(), 100, 75);
  color cH = color(15*hour(), 100, 75);
  drawBanner(cM, 10);
  drawBannerTop(cH, 10);
}

/*w
 * drawNumber
 * takes an integer and draws it offset from the centre of the screen by
 * offsetX and offsetY. If big is true then use a big size for the type.
 *
 */
void drawNumber(int number, boolean big, float offsetX, float offsetY) {
  fill(whi);
  String theText = str(number); // convert number to string
  if (big)
    textSize(400); // set big font size
  else
    textSize(100);  // normal font size

  float txtWidth = textWidth(theText) * 0.5;
  float txtAscent = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, width/2 - txtWidth + offsetX, height/2 + txtAscent + offsetY);
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

void drawBannerTop(color c, float w) {
  noStroke();
  fill(c);
  rect(0, 0, width, w);
}

/*
* Draw colour Hour wheel
*/
void drawHourWheel() {
  //draw color wheel - we'll use a QUAD_STRIP for this
  int h = hour();    // Values from 0 - 23
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i=0; i<=24; i++) {
    float angle = radians(15*i-97.5); // 24 x 15 degree steps - 90 to put 0 at 12 o'clock

    //   Hue   Sat  Brightness
    fill(14*i, i==h+1 ? 60 : 100, i==h+1 ? 100 : 50);  // change the colour as we're building the quads

    //outside(top)
    vertex( width/2-gap + outerR*cos(angle), height/2 + outerR*sin(angle) );
    //inside(down)
    vertex( width/2-gap + innerR*cos(angle), height/2 + innerR*sin(angle) );
  }
  endShape(CLOSE);
}

/*
* Draw colour minute wheel
*/
void drawMinWheel() {
  //draw color wheel - we'll use a QUAD_STRIP for this
  int m = minute();  // Values from 0 - 59
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i=0; i<=60; i++) {
    float angle = radians(6*i-93); // 60 x 6 degree steps - 90 to put 0 at 12 o'clock

    //   Hue   Sat  Brightness
    fill(6*i, 100, i==m+1 ? 100 : 60);  // change the colour as we're building the quads

    //outside(top)
    vertex( width/2 + outerR*cos(angle), height/2 + outerR*sin(angle) );
    //inside(down)
    vertex( width/2 + innerR*cos(angle), height/2 + innerR*sin(angle) );
  }
  endShape(CLOSE);
}

/*
* Draw colour second wheel
*/
void drawSecWheel() {
  //draw color wheel - we'll use a QUAD_STRIP for this
  int s = second();  // Values from 0 - 59
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i=0; i<=60; i++) {
    float angle = radians(6*i-93); // 60 x 6 degree steps

    //   Hue   Sat  Brightness
    fill(6*i, 100, i==s+1 ? 100 : 70);  // change the colour as we're building the quads

    //outside(top)
    vertex( width/2+gap + outerR*cos(angle), height/2 + outerR*sin(angle) );
    //inside(down)
    vertex( width/2+gap + innerR*cos(angle), height/2 + innerR*sin(angle) );
  }
  endShape(CLOSE);
}


void keyReleased() {
  // set selected to be the last key released
  selected = key;
}



