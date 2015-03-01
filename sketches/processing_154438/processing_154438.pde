
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


void setup() {
  size(600, 600);

  textAlign(CENTER);
  textMode(MODEL);
  colorMode(HSB);

  smooth();

  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  noStroke();
}

void draw() {
  if (hour()>7 && hour()<21) {
    background(255);
    fill(0);
    stroke(0);
  } else {
    background(0);
    fill(255);
    stroke(255);
  }

  textSize(40);

  for (float i=1; i<13; i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i)*30);
    line(0, -200, 0, -250);
    popMatrix();
  }

  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(hour())*30);
  line(0, 0, 0, -100);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(map(minute(), 0, 60, 0, TWO_PI));
  line(0, 0, 0, -150);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(map(second(), 0, 60, 0, TWO_PI));
  line(0, 0, 0, -125);
  popMatrix();

  text(hour()+" : "+minute()+" : "+second(), width/2, height*0.75);

  for (int i=1; i<minute(); i++) {
    for (int ii=1; ii<minute(); ii++) {
      stroke(map(second(),0,24,0,255),map(minute(),0,60,0,255),map(hour(),0,60,100,255), 50);
      noFill();
      ellipse(i*width/minute(), ii*height/minute(), i+second(),i+second());
      ellipse(i*width/minute(), ii*height/minute(), -ii+second(),-ii+second());
    }
  }
}



