
void setup() {
  smooth();
  size(500, 200, P2D);
  textMode(SCREEN);
  textAlign(CENTER);
  textSize(20);
  PFont font;
}


void draw() {

  // DATA STUFF

  int mPosx = mouseX;
  int mPosy = mouseY;
  

  // RENDER STUFF

  background(100); // background to grey

  line(0, 0, 500, 200);   // we draw a line, for style reasons.

  text("mouse x: " + mPosx, width/2, 50);
  text("mouse y: " + mPosy, width/2, 70);
  text("mousebutton: " + mousePressed, width/2, 90 );
  text("keyboardbutton: " + keyPressed, width/2, 110 );
  text("lastkey: " + key, width/2, 130 );


}

void mouseMoved() {
  text("mouse is moving.", width/2, 160 );
}


