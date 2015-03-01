
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
int   daylightOffset = 0;  // Used during testing to offset the day / night cycle

void setup() {
  size(1024, 600);

  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  gap = 300;
  noStroke();
}

void draw() {
  float orbitRadius = height/4;
  float orbitX;
  float orbitY;
  background(0);
  fill(255);
  
  // Local version to allow testing
  int myHour = (hour()+daylightOffset) % 24;
  
  // Draw sun / moon
  if (myHour >- 6 && myHour < 18) {
    noStroke();
    fill(140,140,255);
    rect(20, 20, width-40, height/2-20); 
    orbitX = width/2 - orbitRadius * cos(((myHour-6) + minute()/60.0 + second()/3600.0) / 12.0 * PI);
    orbitY = height/2 - orbitRadius * sin(((myHour-6) + minute()/60.0 + second()/3600.0) / 12.0 * PI);
    fill(255, 255, 0, 10);
    for (int circleCount = 10; circleCount > 0; circleCount--) {
      ellipse(orbitX, orbitY, width/10 * circleCount, width/10 * circleCount);
    }
    fill(255, 255, 0);
    ellipse(orbitX, orbitY, width/8, width/8);
    fill(64, 128, 64);
    rect(20, height/2, width-40, height/2-20);
    fill(128);
  }
  else {
    noStroke();
    fill(10,10,32);
    rect(20, 20, width-40, height/2-20); 
    orbitX = width/2 - orbitRadius * cos(((myHour+6 % 12) + minute()/60.0 + second()/3600.0) / 12.0 * PI);
    orbitY = height/2 - orbitRadius * sin(((myHour+6 % 12) + minute()/60.0 + second()/3600.0) / 12.0 * PI);
    fill(255, 5);
    for (int circleCount = 10; circleCount > 0; circleCount--) {
      ellipse(orbitX, orbitY, width/10 * circleCount, width/10 * circleCount);
    }
    fill(255, 255, 255);
    ellipse(orbitX, orbitY, width/8, width/8);
    fill(10, 32, 10);
    rect(20, height/2, width-40, height/2-20);
    fill(48, 48, 64);
  }

  // draw h, m, s
  drawNumber(hour(), selected == 'h', -gap, height/4);
  drawNumber(minute(), selected == 'm', 0, height/4);
  drawNumber(second(), selected == 's', gap, height/4);
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
  String theText = number; // convert number to string
  if (big)
    textSize(300); // set big font size
  else
    textSize(200);  // normal font size

  float tWidth = textWidth(theText) * 0.5;
  float tAscent = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, width/2 - tWidth + offsetX, height/2 + tAscent + offsetY);
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



