
/*
/ FutureLearn
 / Monash University
 / MOOC: Creative Coding
 / Week 6
 / Final Challenge
 / Create a Generative Postcard
 / by Federico Andrea Siciliano
 */

PFont myFont;

void setup() {
  size (420, 297);

  String [] fonts = PFont.list();
  myFont = createFont("Verdana", 48, true);
  textFont (myFont, 16);
}

void draw() {
  colorMode(HSB);
  background (150, 250, 240);

  noStroke();
  fill (50, 255, 255);
  rectMode(CENTER);
  translate (width/2, height/2);
  rect (0, 0, width, 45);
  rect (width/6, 0, 45, height);

  resetMatrix();
  textAlign(CENTER);
  fill (10);
  text ("Greetings from Sweden", mouseX, mouseY);
}



