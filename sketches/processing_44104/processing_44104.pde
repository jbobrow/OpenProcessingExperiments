

/* draw tool. shows how to draw with dynamic elements. 
 * 
 * MOUSE
 * drag                : draw with text
 * 
 * KEYS
 * del, backspace      : clear screen
 * arrow up            : angle distortion +
 * arrow down          : angle distortion -
 * s                   : save png
 * r                   : start pdf recording
 * e                   : stop pdf recording
 */

import processing.pdf.*;
boolean recordPDF = false;

float x = 0, y = 0;
float stepSize = 5.0;

PImage img0;
PFont font;
String letters = "In the suburbs I, I learned to drive And you told me we'd never survive Grab your mother's keys we're leavin' You always seemed so sure That one day we'd be fighting A suburban war your part of town against mine I saw you standing on the opposite shore But by the time the first bombs fell We were already bored We were already, already bored Sometimes I can't believe it I'm movin' past the feeling Sometimes I can't believe it I'm movin' past the feeling again Kids wanna be so hard But in my dreams we're still screamin' and runnin' through the yard And all of the walls that they built in the seventies finally fall And all of the houses they built in the seventies finally fall Meant nothin' at all Meant nothin' at all It meant nothin Sometimes I can't believe it I'm movin' past the feeling Sometimes I can't believe it I'm movin' past the feeling and into the night So can you understand? Why I want a daughter while I'm still young I wanna hold her hand And show her some beauty Before this damage is done But if it's too much to ask, it's too much to ask Then send me a son Under the overpass In the parking lot we're still waiting It's already passed So move your feet from hot pavement and into the grass Cause it's already passed It's already, already passed! Sometimes I can't believe it I'm movin' past the feeling Sometimes I can't believe it I'm movin' past the feeling again I'm movin' past the feeling I'm movin' past the feeling In my dreams we're still screamin' We're still screamin' We're still screamin'";
int fontSizeMin = 3;
float angleDistortion = 0.0;

int counter = 0;


void setup() {
  size(525, 700);
 PImage img0 = loadImage("2011_0914Interactivity0015.jpg");
 image (img0, 0, 0, width, height);
  smooth();
  cursor(CROSS);

  x = mouseX;
  y = mouseY;

  font=loadFont ("AkzidGrtskNext-Bold-70.vlw");
  textFont(font,fontSizeMin);
  textAlign(LEFT);
  fill(0, 70);

}


void draw() {
  if (mousePressed) {
    float d = dist(x,y, mouseX,mouseY);
    textFont(font,fontSizeMin+d/2);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x); 

      pushMatrix();
      translate(x, y);
      rotate(angle + random(angleDistortion));
      text(newLetter, 0, 0);
      popMatrix();

      counter++;
      if (counter > letters.length()-1) counter = 0;

      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize; 
    }
  }
}


void mousePressed() {
  x = mouseX;
  y = mouseY;
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == DELETE || key == BACKSPACE)  ;
  PImage img0 = loadImage("2011_0914Interactivity0015.jpg");
 image (img0, 0, 0, width, height);

  // ------ pdf export ------
  // press 'r' to start pdf recordPDF and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, timestamp()+".pdf");
      println("recording started");
      recordPDF = true;
      textAlign(LEFT);
      fill(0);
    }
  } 
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      image (img0, 0, 0, width, height);
    }
  } 
}

void keyPressed() {
  // angleDistortion ctrls arrowkeys up/down 
  if (keyCode == UP) angleDistortion += 0.1;
  if (keyCode == DOWN) angleDistortion -= 0.1; 
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


