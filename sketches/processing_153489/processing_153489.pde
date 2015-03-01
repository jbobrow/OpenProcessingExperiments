
/*
 * Creative Coding
 * Week 5, 02 - Digital Clock
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows how to use text in Processing
 * The sketch creates a digital clock that shows the current time in hours, minutes and seconds
 * Cycles through spectrum, once a day for hours, once an hour for minutes 
 * and once a minute for seconds
 */  
/*@pjs font="HATTEN.TTF"; */


PFont myFont;    // font data
int   gap;       // gap between digits
float hhue;      // hours hue value
float mhue;      // minutes hue value
float shue;      // seconds hue value


void setup() {
  size(970, 400);
  colorMode(HSB);
  
  hhue = 0;
  mhue = 0;
  shue = 0;


  myFont = createFont("HATTEN.TTF", 16, true);  // load the font from file
  textFont(myFont);  // set the current font to myFont
  gap = 310;
  noStroke();
}

 
void draw() {
  background(0);
  
  hhue = (float(hour())/24 * 255);
  mhue = (float(minute())/60 * 255);
  shue = (float(second())/60 * 255);
  
  fill(255);
  // dots
  ellipse(width/3 - 4, height/2 - 60, 15, 15);
  ellipse(width/3 - 4, height/2 , 15, 15);
  ellipse((width/3)*2 - 10 , height/2 - 60, 15, 15);
  ellipse((width/3)*2 - 10, height/2 , 15, 15);  
  
  // draw h, m, s
  fill(hhue, 255, 255);
  drawNumber(hour(),  -gap, 0);
  fill(mhue, 255, 255);
  drawNumber(minute(),  0, 0);
  fill(shue, 255, 255);
  drawNumber(second(),  gap, 0);
}

/*
 * drawNumber
 * takes an integer and draws it offset from the centre of the screen by
 * offsetX and offsetY. 
 *
 */
void drawNumber(int number,  float offsetX, float offsetY) {
  if (number >= 10){
  String theText = str(number); // convert number to string
  }
  else { String theText = "0" + str(number);  // adds 0s for single digits
  }
  
  textSize(350);  // normal font size
 
 float textW = textWidth(theText) * 0.5;
  float textA = textAscent() * 0.375;
 
 
  // draw text offset from the centre of the screen
  text(theText, width/2  - textW + offsetX, height/2  + textA + offsetY);
}




