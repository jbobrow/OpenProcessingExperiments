
/*
  Ka Kit Cheong
 Type Character V1 - Dodge
 02/21/2012
 */

// objects
PFont font;

PVector textLoc;
PVector mouseLoc;

// golbal variables
String myText ="dodge";

void setup() {
  size(500, 500);

  font = loadFont("SynchroLET-48.vlw");
  textFont(font, 36);
  textAlign(CENTER, BASELINE);

  textLoc = new PVector(width/2, height/2, 0);
}

void draw() {
  background(0);

  mouseLoc = new PVector(mouseX, mouseY, 0);

  ellipse(mouseLoc.x, mouseLoc.y, 20, 20);

  text(myText, textLoc.x, textLoc.y);

  float distance = mouseLoc.dist(textLoc);

  if (distance > 0 && distance <80) {
    textLoc.x += random(-80, 80);
    textLoc.y += random(-80, 80);
  }

  if (textLoc.x < 0) {
    textLoc.x +=100;
  } 
  else if  (textLoc.x > width) {
    textLoc.x -=100;
  }
  else if  (textLoc.y < 0) {
    textLoc.y +=100;
  }
  else if  (textLoc.y > height) {
    textLoc.y -=100;
  }
}


