
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

int smallVerticalGap ;
int bigVerticalGap;

int[] hourVector;
int[] minutesVector;
int[] secondsVector;

void setup() {
  size(1024, 600);

  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  gap = 300;
  noStroke();
  
  
  smallVerticalGap = 50;
  bigVerticalGap = 200;
  
  hourVector = new int[10];
  minutesVector = new int[10];
  secondsVector = new int[10];
  
  frameRate(1);
}

void draw() {
  background(0);
  fill(255);
  
  for (int i=0; i<9; i++){
    hourVector[i] = hourVector[i+1];
    minutesVector[i] = minutesVector[i+1];
    secondsVector[i] = secondsVector[i+1];
  }
  hourVector[9] = hour();
  minutesVector[9] = minute();
  secondsVector[9] = second();
  
  color c;
  c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  for (int i=0; i<10; i++){
    // draw h, m, s
    drawNumber(hourVector[i], selected == 'h', -gap, 0+i);
    drawNumber(minutesVector[i], selected == 'm', 0, 0+i);
    drawNumber(secondsVector[i], selected == 's', gap, 0+i);
    
    
  }
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
  if (big){
    textSize(200); // set big font size
    offsetY = offsetY*bigVerticalGap;
  }
  else{
    textSize(20);  // normal font size
    offsetY = offsetY*smallVerticalGap;
  }

  float textWidth = textWidth(theText) * 0.5;
  float textAscent = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, width/2 - textWidth + offsetX, 70 + textAscent + offsetY);
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

