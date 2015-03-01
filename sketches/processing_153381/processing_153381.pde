
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
 * added analogue clock and date, Mike Smith, 1/7/2014
 */
PFont myFont;    // font data
char  selected;  // what is selected (h,m,s)
int   gap;       // gap between digits
String months = "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec";
String month[] = split(months, ',');
float daysInMonth[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
String suffix = "";


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
  smooth();
  
  // draw h, m, s
  drawNumber(hour(), selected == 'h', -gap, 0);
  drawNumber(minute(), selected == 'm', 0, 0);
  drawNumber(second(), selected == 's', gap, 0);
  color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  drawBanner(c, 10);
  
  // draw clock
  
  // draw month (white arc) and day (red arc) to clock
  float monthAngle = radians(360*month()/12 - 90);
  float dayAngle = radians(360*day()/daysInMonth[month()-1] - 90);
  noStroke();
  fill(255);
  arc(130, 130, 240, 240,  - HALF_PI, monthAngle);
  fill(255, 0, 0);
  arc(130, 130, 220, 220, - HALF_PI, dayAngle);
  
  // draw face
  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse(130, 130, 200, 200);
  // am/pm
  stroke(0);
  fill(255);
  if(hour() > 11) fill(0);
  ellipse(130, 60, 30, 30);
  // draw hands
  strokeWeight(8);
  stroke(255, 0, 0);
  strokeCap(SQUARE);
  float hourAngle = radians(360*(hour()-12)/12 - 90);
  float minAngle = radians(360*minute()/60 - 90);
  float secAngle = radians(360*second()/60 - 90);
  line(130, 130, 130 + 70*cos(hourAngle), 130 + 70*sin(hourAngle));
  line(130, 130, 130 + 20*cos(hourAngle - PI), 130 + 20*sin(hourAngle -PI));
  line(130, 130, 130 + 90*cos(minAngle), 130 + 90*sin(minAngle));
  line(130, 130, 130 + 20*cos(minAngle - PI), 130 + 20*sin(minAngle - PI));
  strokeWeight(2);
  line(130, 130, 130 + 100*cos(secAngle), 130 + 100*sin(secAngle));
  line(130, 130, 130 + 20*cos(secAngle - PI), 130 + 20*sin(secAngle - PI));
 
 // print date in double format
  fill(255);
  textSize(20);
  text(day() + " - " + month() + " - " + year(), 800, 120);
  if(day() == 1) {
    suffix = "st";
  } else if (day() == 2) {
    suffix = "nd";
  } else if (day() == 3) {
    suffix = "rd";
  } else  {
    suffix = "th";
  }
  text(day() + suffix + " " + month[month() - 1] + " " + year(), 800, 150);
  
  
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
    textSize(200); // set big font size
  else
    textSize(20);  // normal font size

  float textWidth = textWidth(theText) * 0.5;
  float textAscent = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, width/2 - textWidth + offsetX, 3*height/4 + textAscent + offsetY);
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



