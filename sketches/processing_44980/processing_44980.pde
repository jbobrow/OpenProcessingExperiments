
 /*
 Created By Aldis Ozolins
 Interactive 2 // Fall 2011
 Logo mouse Transition
 */


import processing.video.*;

MovieMaker mm;  // Declare MovieMaker object


float[] yTop = new float[4];
char[] post = {'P', '0', 'S', 'T'};
char[] analog = {'A', 'N', 'A', 'L', 'O', 'G'};
char[] gibberish = {'@', '#', '!', '%', '&', '['};
PFont fontA;
float[] roff = new float[5];
float[] roff2 = new float[7];

int myMax = int(random(gibberish.length));

void setup() {
  size(600, 400);
  smooth();
  ellipseMode(RADIUS);
  colorMode(HSB, 100);
  fontA = loadFont("Klavika-Light-48.vlw");
  textFont(fontA, 48);
  println(yTop[0]);
  println(post[2]);
  frameRate(10);
  mm = new MovieMaker(this, width, height, "drawing4.mov",20, MovieMaker.ANIMATION, MovieMaker.HIGH);
}

void draw() {
  background(0);
  int mv = int(map(mouseX, 0, width, 0, gibberish.length));
    for (int i = 0;i<mv;i++) {
    roff[i] = random(-10, 10);
    if (i<post.length) {
      int temp = int(random(6));
      post[i] = gibberish[temp];
    }
  }
   for (int i = 0;i<mv;i++) {
    roff2[i] = random(-10, 10);
    if (i<analog.length) {
      int temp = int(random(6));
      analog[i] = gibberish[temp];
    }
  }
  drawShape(5);
  
  mm.addFrame();  // Add window's pixels to movie
}

void drawShape(int sw) {
  strokeWeight(sw);
  stroke(31, 0, 100);
  pushMatrix();
  translate(0, 150);
  for (int i = 0;i<4;i++) {
    int xpos = 80*(i+1);

    if (i==0) {
      text(post[i], xpos, roff[i+1]);
    }
    else {
      text(post[i], xpos, roff[i+1]);
      line(xpos-50, roff[i], xpos-5, roff[i+1]);
    }
  }
  popMatrix();
  pushMatrix();
  translate(0, 250);
  for (int i = 0;i<6;i++) {
    int xpos = 80*(i+1);

    if (i==0) {
      text(analog[i], xpos, roff2[i+1]);
    }
    else {
      text(analog[i], xpos, roff2[i+1]);
      line(xpos-50, roff2[i], xpos-5, roff2[i+1]);
    }
  }
  popMatrix();
   mm.addFrame();  // Add window's pixels to movie
}


void keyPressed() {
  if (key == ' ') {
    mm.finish();  // Finish the movie if space bar is pressed!
  }
}


