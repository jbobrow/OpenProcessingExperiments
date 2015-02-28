
// Did some algebra to translate dates from 3/09/11 to 4/07/11 into millisecond values at a ratio of 2 days/sec.

int time_off = 4500;
int time_off2 = 8500;
int time_off3 = 8800;
int time_off4 = 8850;
int time_off5 = 12000;
int time_off6 = 15000;


PImage myImage;
PFont bootFont;
// The font must be located in the sketch's 
// "data" directory to load successfully



void setup() {
  bootFont = createFont("myriad", 16, true);
  noStroke();
  smooth();
  size(774, 873);
  textFont(bootFont, 18);
}



void draw() {
  myImage = loadImage("JapanMap.jpg"); //background image borrowed (hopefully under Fair Use) from mappery.com
  image(myImage, 0, 0);
  noFill();
  strokeWeight(1);
  smooth();

  // x,y values roughly correspond to GPS coords. Size of circles correspond linearly (and roughly) to the magnitude of the earthquake.

  if (time_off < millis()) {
    stroke(255, 255, 0);
    for (int j=0;j<72;j+=5) {
      noFill();
      ellipse(594, 361, j, j);
    }
    fill(255, 255, 0);
    text("March 9, 2011   02:45a  Magnitude 7.2", 15, 50);
  }

  if (time_off2 < millis()) {
    noFill();
    stroke(255, 0, 0);
    strokeWeight(1);
    for (int j=0;j<120;j+=5) {
      noFill();
      ellipse(581, 400, j, j);
    }
    fill(255, 0, 0);
    text("March 11, 2011  05:46a  Magnitude 9.0", 15, 70);
  }


  if (time_off3 < millis()) {
    noFill();
    stroke(247, 148, 29);
    strokeWeight(1);
    for (int j=0;j<80;j+=5) {
      ellipse(518, 511, j, j);
    }
    fill(247, 148, 29);
    text("March 11, 2011  06:15a  Magnitude 7.9", 15, 90);
  }

  if (time_off4 < millis()) {
    noFill();
    stroke(247, 148, 29);
    strokeWeight(1);
    for (int j=0;j<77;j+=5) {
      ellipse(654, 423, j, j);
    }
    fill(247, 148, 29);
    text("March 11, 2011  06:25a  Magnitude 7.7", 15, 110);
  }

  if (time_off5 < millis()) {
    noFill();
    stroke(247, 148, 29);
    strokeWeight(1);
    for (int j=0;j<80;j+=5) {
      ellipse(532, 412, j, j);
    }
    fill(247, 148, 29);
    text("April 7, 2011      2:32p   Magnitude 7.1", 15, 130);
  }
  
  if (time_off6 < millis()) {
    fill(255);
    text("Then the recovery begins...", 25, 180);
  }  
  
}


