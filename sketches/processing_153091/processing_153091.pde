
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
/*@pjs font="arial.ttf";*/
PFont myFont;    // font data
char  selected;  // what is selected (h,m,s)
int   gap, margin;       // gap between digits
int mils, sec0, sec, off;
int colWidth=80;
int []daysinmonth={31,28+int((year()%4==0 && year()%100!=0)||year()%400==0),31,30,31,30,31,31,30,31,30,31};


void setup() {
  size(800, 600);
  char [] charset= {
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
  };
  myFont = loadFont("arial.ttf");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  margin=20;
  off=0;
  sec=sec0=second();
  gap = (width-7*colWidth-2*margin)/6;
  noStroke();
}

void draw() {
  background(200);
  fill(0); 

  mils=millis()-off;
  if (sec!=second() || mils>1000) {
    off=max(999,millis());
  }
  // draw h, m, s
  
  drawNumber(year(), selected == 'y',"Years", margin, height/2-110-(year()-2000)*(height-200)/100);
  drawNumber(month(), selected == 'm',"Months", margin+colWidth+gap, height/2-110-month()*(height-200)/12);
  drawNumber(day(), selected == 'd',"Days", margin+2*colWidth+2*gap, height/2-110-day()*(height-200)/daysinmonth[month()-1]);
  drawNumber(hour(), selected == 'h',"Hours", margin+3*colWidth+3*gap, height/2-110-hour()*(height-200)/24);
  drawNumber(minute(), selected == 'n',"miNutes", margin+4*colWidth+4*gap, height/2-110-minute()*(height-200)/60);
  drawNumber(second(), selected == 's',"Seconds", margin+5*colWidth+5*gap, height/2-110-second()*(height-200)/60);
  drawNumber(min(mils,999), selected == 't',"Thousands", margin+6*colWidth+6*gap, height/2-110-min(mils,999)*(height-200)/1000);
  color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  //drawBanner(c, 10);
  fillTime(0, color(255, 0, 0, 180));
  fillTime(1, color(0, 0, 255, 180));
  fillTime(2, color(200, 0, 255, 180));
  fillTime(3, color(200, 255, 0, 180));
  fillTime(4, color(0, 255, 0, 180));
  fillTime(5, color(0, 255, 255, 180));
  fillTime(6, color(128, 128, 255, 180));
  sec=second();
}

/*
 * drawNumber
 * takes an integer and draws it offset from the centre of the screen by
 * offsetX and offsetY. If big is true then use a big size for the type.
 *
 */
void drawNumber(int number, boolean big,String label, float offsetX, float offsetY) {
  String theText = str(number); // convert number to string
  if (big)
    textSize(40); // set big font size
  else
    textSize(24);  // normal font size

  float textWid = textWidth(theText) * 0.5;
  float textAs = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, offsetX+colWidth/2-textWid, height/2 + textAs + offsetY);
  textSize(18);
  text(label, offsetX+colWidth/2-textWidth(label) * 0.5,height- 80);
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
void fillTime(int mode, color col) {
  switch (mode) {
  case 0:
    fill(#FFFFFF-col);
    int fillH=height-200;
    rect(margin+mode*(colWidth+gap), 100, colWidth, fillH);
    fill(col);
    rect(margin+mode*(colWidth+gap), 100+fillH-(year()-2000)*fillH/100, colWidth, (year()-2000)*fillH/100);
    break;
  case 1:
    fill(#FFFFFF-col);
    int fillH=height-200;
    rect(margin+mode*(colWidth+gap), 100, colWidth, fillH);
    fill(col);
    rect(margin+mode*(colWidth+gap), 100+fillH-month()*fillH/12, colWidth, month()*fillH/12);
    break;
  case 2:
    fill(#FFFFFF-col);
    int fillH=height-200;
    rect(margin+mode*(colWidth+gap), 100, colWidth, fillH);
    fill(col);
    rect(margin+mode*(colWidth+gap), 100+fillH-day()*fillH/daysinmonth[month()-1], colWidth, day()*fillH/daysinmonth[month()-1]);
    break;
  case 3:
    fill(#FFFFFF-col);
    int fillH=height-200;
    rect(margin+mode*(colWidth+gap), 100, colWidth, fillH);
    fill(col);
    rect(margin+mode*(colWidth+gap), 100+fillH-hour()*fillH/24, colWidth, hour()*fillH/24);
    break;
  case 4:
    fill(#FFFFFF-col);
    int fillH=height-200;
    rect(margin+mode*(colWidth+gap), 100, colWidth, fillH);
    fill(col);
    rect(margin+mode*(colWidth+gap), 100+fillH-minute()*fillH/60, colWidth, minute()*fillH/60);
    break;
  case 5:
    fill(#FFFFFF-col);
    int fillH=height-200;
    rect(margin+mode*(colWidth+gap), 100, colWidth, fillH);
    fill(col);
    rect(margin+mode*(colWidth+gap), 100+fillH-second()*fillH/60, colWidth, second()*fillH/60);
    break;
  case 6:
    fill(#FFFFFF-col);
    int fillH=height-200;
    rect(margin+mode*(colWidth+gap), 100, colWidth, fillH);
    fill(col);
    rect(margin+mode*(colWidth+gap), 100+fillH-min(mils,999)*fillH/1000, colWidth, min(mils,999)*fillH/1000);
    break;
  }
}


void keyReleased() {
  // set selected to be the last key released
  selected = key;
}


