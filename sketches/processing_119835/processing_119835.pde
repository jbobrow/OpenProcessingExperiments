
int STATE = 0;
PFont ROCK;
Artist BobRoss;
void setup() {
  size(300, 600);
  ROCK = loadFont("Rockwell-48.vlw");
  BobRoss = new Artist();
}
void draw() {
  if (STATE == 0) {//TITLE SCREEN
    background(0);
    textFont(ROCK, 30);
    text("howdy!", 100, 400); 
    textFont(ROCK, 20);
    text("press enter to continue", 20, 500);
  } 
  else if (STATE == 1) {//draw some things!
  }
}
void keyPressed() {
  if (keyCode == ENTER) {
    STATE = 1;
    background(255);
  }
  if (key == 'q') {
    BobRoss.switchState(1);
  }
  if (key == 'w') {
    BobRoss.switchState(0);
  }
  if (key == ' ') {
    BobRoss.switchStroke();
  }
}
void mousePressed() {
  //if you just click once
  if (STATE == 1) {
    BobRoss.drawStuff(mouseX, mouseY);
  }
}
void mouseDragged() {
  //if you click and drag
  if (STATE == 1) {
    BobRoss.drawStuff(mouseX, mouseY);
  }
}

class Artist{
  int drawState = 0;
  Boolean isStrokeOn = false;
  Artist() {}
  void drawStuff(int x, int y) {
    //turn the stroke on or off
    if (isStrokeOn == true) {
      stroke(0);
    } else {
      noStroke();
    }
    //draw something based on the state
    if (drawState == 0) {
      fill(21, 140, 20);
      ellipse(x, y, 20, 20);
    } else if (drawState == 1) {
      fill(40, 132, 140);
      rect(x, y, 20, 10);
    }
  }
  void switchState(int newState) {
    drawState = newState;
  }
  void switchStroke() {
    if (isStrokeOn == true) {
      isStrokeOn = false;
    } else {
      isStrokeOn = true;
    }
    //shorthand: isStrokeOn = !isStrokeOn;
  }
}


