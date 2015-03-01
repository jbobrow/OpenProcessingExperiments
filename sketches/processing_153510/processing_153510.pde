
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
boolean night;  // night or day
int noOfModes;
int currentMode;
int moonSize;
int moonX;
int moonY;

void setup() {
  size(1024, 600);

  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  gap = 300;
  night = false;
  noOfModes = 2;
  currentMode = 1;
  noStroke();
}

void draw() {
  if(hour()>19 || hour()<8){
    night = true;
  }
  switch (currentMode) {
    case 1:
      background(0);
      fill (255);
       // draw h, m, s
  drawNumber(hour(), selected == 'h', -gap, 0);
  drawNumber(minute(), selected == 'm', 0, 0);
  drawNumber(second(), selected == 's', gap, 0);
  color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
      drawBanner(c, 10);
    
    break;
    case 2:
  if(night)
  {
  background(13,5,90);  
  fill(255);
 drawMoon();
  }
  else{
    background(90, 255, 245);
    fill(255,247,0);
    drawMoon();
  }
  break;
  }
 

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

  float textWidthW = textWidth(theText) * 0.5;
  float textAscentA = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, width/2 - textWidthW + offsetX, height/2 + textAscentA + offsetY);
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

void mouseClicked(){
  //cycle through modes
  if(currentMode >= noOfModes){
    currentMode = 1;
  }
  else{
    currentMode ++;
  }
}
  void drawMoon(){
     moonSize = 220;
  moonX = 150 + hour()*30;
  moonY = 120;
      ellipse(moonX, moonY, moonSize, moonSize); //draw moon
  
  fill(0);
  textSize(20);
  String theTime = (str(hour()) + " : " + str(minute()) + " : " + str(second()));
  text(theTime, moonX - 40, moonY);
  }




