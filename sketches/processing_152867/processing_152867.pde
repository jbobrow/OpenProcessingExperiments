
PFont myFont;    // font data
char  selected;  // what is selected (h,m,s)
int   gap;       // gap between digits


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
  if (big
    textSize(400); // set big font size
  else
    textSize(20);  // normal font size
    
  float textWidth = textWidth(theText) * 0.5;
  float textAscent = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, (int) width/2 - textWidth + offsetX, (int) height/2 + textAscent + offsetY);

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


