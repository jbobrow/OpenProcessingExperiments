
float angle = 0; 
char letter = 'A';

void setup () {
  size(400, 400);
  PFont font = loadFont("JazzLetPlain-48.vlw");
  textFont(font, 48); 
  smooth();
  noStroke();
  fill(0);
}

void draw() {
  background(255);
  // angle depends on mouse horiz position
  angle = TWO_PI*mouseX/width;
  //println(angle);
  // call box function with position and  angle
  rotBox(width/3, mouseY, angle);
  // call letter function first converting character to String
  rotLetter(Character.toString(letter), 2*width/3, mouseY, angle);
}

void mousePressed() {
  // mouse click function to show how this works with different characters
  letter++;
  if (letter>128) {
    letter = 0;
  }
}

void rotBox(int x, int y, float ang) {
  rectMode(CENTER); // draw from center of box
  pushMatrix(); // push previous matrix on stack
  translate(x, y); // translate to desired location
  rotate(angle); // rotate
  rect(0, 0, 40, 40); // draw centered on origin!
  popMatrix(); // return to previous coordinate state
}

void rotLetter(String l, int x, int y, float ang) {
  pushMatrix(); // save state
  textAlign(CENTER); // center letter horiz
  translate(x, y); // move to position
  rotate(angle); // rotate
   // draw char centered on acsender
   // this will work for most Caps, and some lc letters
   // but it will not allways vert center letters
  text(l, 0, textAscent()/2);
  popMatrix(); // return to saved coordinate matrix
}


