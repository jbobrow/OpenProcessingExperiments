
/*
 * Creative Coding
 * Week 6 - Digital Clock with Background
 * by Lewis, modified code from Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 
 * The sketch creates a digital clock that shows the current time in hours, minutes and seconds
 * It changes the background at various times and idsplays a quote related to travel in the day and a night time quote, from great authors.
 *
 */
PFont myFont;    // font data
PImage[] myImage; // image loader
char  selected;  // what is selected (h,m,s)
int   gap;       // gap between digits


void setup() {
  size(1024, 600);
  
  myImage = new PImage[6];
  myImage[0] = loadImage("sun.jpg");
  myImage[1] = loadImage("beach.jpg");
  myImage[2] = loadImage("night.jpg");
  myImage[3] = loadImage("sun1.jpg");
  myImage[4] = loadImage("beach1.jpg");
  myImage[5] = loadImage("night1.jpg");
  myFont = loadFont("SegoeUI-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  gap = 300;
  noStroke();
  rectMode(RADIUS);

  
}

void draw() {
  if (hour() <= 7){
    image(myImage[1],0,0);
      if (mousePressed) {
      image(myImage[4],0,0); }
    fill(255);
    String s = "\"Life is a journey \n not a destination.\" \n ― Ralph Waldo Emerson";
    textSize(25);
    text(s, 400, 100);
}  else if ((hour() > 7) && (hour() <= 12)) {
    image(myImage[0],0,0);
      if (mousePressed) {
      image(myImage[3],0,0); }
    fill(255);
    String s = "\"Not until we are lost \n do we begin to understand ourselves\" \n ― Henry David Thoreau";
    textSize(25);
    text(s, 100, 100);
    

      
  }  else if ((hour() > 12) && (hour() <= 19)) {
    image(myImage[1],0,0);
      if (mousePressed) {
     image(myImage[4],0,0); }
    fill(255);
    String s = "\"Travel is fatal to prejudice, bigotry \n and narrow-mindedness.\" \n ― Mark Twain";
    textSize(25);
    text(s, 600, 100);
  }  else if ((hour() > 19) && (hour() <= 24)) {
    image(myImage[2],0,0);
      if (mousePressed) {
       image(myImage[5],0,0); }
    fill(255);
    String s = "\"Those who dream by day are cognizant of many things \n which escape those who dream only by night.\" \n ― Edgar Allan Poe, Eleonora";
    textSize(25);
    text(s, 400, 100);
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
  String theText = str(number); // convert number to string
  if (big)
    textSize(200); // set big font size
  else
    textSize(200);  // normal font size

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



