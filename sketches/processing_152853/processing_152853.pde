
/* (my variation)
 * Creative Coding
 * Week 5, 02 - Digital Clock
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 */
 
PFont myFont;    // font data
int   gap;       // gap between digits

void setup() {
  size(800, 400);

  myFont = loadFont("Calibri-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  gap = width/4;
  noStroke();
}

void draw() {
   background(#000000);
   
  int seconds = second();
  int minutes = minute();
  int hours = hour();
   
  colorMode(HSB, 255, 100, 100);
  rectMode(CENTER);
  float br = map(seconds,0,60,150,50);
  fill(0,90,br);
  noStroke();
  float sz = map(minutes, 0, 60, 50, height);
  rect(width/2, height/2, 60, sz);

  for (int i=0; i<24; i++) {
    float unit = TWO_PI/24;
    float start = PI+unit*i; 
    float diam = 150+ i*5; 
    if (i>hours) {
      fill(#202020);
    } else {
      fill(255.0/24*i, 90, 90);
    }
    arc(width/2-gap, height/2, diam, diam, start, start+unit-radians(1));
  }
  
  fill(#000000);
  ellipse(width/2-gap+2,height/2-5,70,70);

  // draw h, m, s
  drawNumber(hours, false, -gap, 0);
  drawNumber(minutes, false, 0, 0);
  drawNumber(seconds, true, gap, 0);
}

void drawNumber(int number, boolean sec, float offsetX, float offsetY) {
  fill(#ffffff);
  if (sec) {
    float ts = map(second(), 0, 60, 40, 300);
    textSize(ts);
  } else {
    textSize(40);
  }

  //String theText = nf(number, 2, 0); // convert number to string
  String theText = str(number);
  float textW = textWidth(theText) * 0.5;
  float textA = textAscent() * 0.375;



  // draw text offset from the centre of the screen
  text(theText, width/2 - textW + offsetX, height/2 + textA + offsetY);
}

