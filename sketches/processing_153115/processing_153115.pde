
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
  size(1024, 600);

  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  gap = 300;
  noStroke();
}

void draw() {


  if ( 5 < hour( ) < 20) {// daytime
    background( #6CBDF2);
    fill( 255, 255, 0, 200);//outer ring for sun
    ellipse( 100,100,150,150);
    
    fill( 255, 255, 0);// inner sun
    ellipse( 100,100,100,100);
    
    fill( 255, 255, 0);// text fill
  } else { //night
    background(#072E48);
    fill(255,225);// moon
    ellipse(100,100,200,200);
    fill(255,195);// moon
    ellipse(100,100,190,190);
    fill(255,225);// moon
    ellipse(150,150,50,50);
   
    fill(0, 255, 255);// text fill
  }

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
  String theText = str(nf(number, 2)); // convert number to string and use nf to make 2 digits for numbers<10 in jscript
  textSize(200); 

  float text_Width = textWidth(theText) * 0.5;
  float text_Ascent = textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, width/2 - text_Width + offsetX, height/2 + text_Ascent + offsetY);
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



