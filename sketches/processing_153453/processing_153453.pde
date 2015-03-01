
/*
 * Creative Coding
 * Exercise W05_02 - TicTok
 * by DEFurugen
 *
 * This sketch shows how to use text in Processing
 * The sketch creates a digital clock that shows the current time in hours, minutes and seconds
 * Use the 'h', 'm' and 's' keys to enlarge the hours, minutes or seconds in the display.
 * Use the 'd', 'o' and 'y' keys to enlarge the day, month or year in the display.
 */

float circle_x = 30;
PFont myFont;    // font data
PImage bg; // display window image
char  selected;  // what is selected (h,m,s,d,o,y)
int   gap;       // gap between digits

void setup() {
  size(824, 532);
   
  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  gap = 230;
  stroke(0);
}

void draw() {
  background(150,0,200);
 
  drawNumber(hour(), selected == 'h', -gap, 0);
  drawNumber(minute(), selected == 'm', 0, 0);
  drawNumber(second(), selected == 's', gap, 0);
  drawNumber(day(), selected == 'd', -gap-60, 180); 
  drawNumber(month(), selected == 'o', -gap+40, 180);
  drawNumber(year(), selected == 'y', -55, 180);
  
  color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  drawBanner(c, 20);
  


float circle_x_size = 56;
  if (random(10) > 5) {
    circle_x_size = 65;
  } 
  stroke(255, 150, 50);
    ellipse(circle_x, 40, circle_x_size, circle_x_size);
  circle_x = circle_x + 1;  
  if (circle_x >798) {
    circle_x = 56;
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
    textSize(300); // set big font size
  else
    textSize(40);  // normal font size

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



