
//int STATE;
//draw { if (STATE == 0) {//draw title}
//else if (STATE == 1) {// draw stuff}
//}

int STATE = 0;
PFont BellMT; //font that you choose, go to tools and create font
Artist BobRoss;


void setup () {
  size(300, 600);
  BellMT = loadFont("BellMT-48.vlw");
  BobRoss = new Artist();
}

void draw () {
  if (STATE == 0) {// title screen
    background(0);
    textFont(BellMT, 20);//put separate textfont for different font size
    text("hello!", 100, 400);
    textFont(BellMT, 34); //(typename, font size)
    text("press enter to continue", 50, 500);
  } 
  else if ( STATE == 1) {
    //draw stuff
    //ellipse(mouseX, mouseY, 10, 10); now goes into the class tab drawStuff
    // BobRoss.drawStuff(mouseX, mouseY); Bring down to mousePressed and mouseDragged
  }
}

void keyPressed () {
  if (keyCode == ENTER) {
    STATE = 1; //when press enter, it will start drawing ellipse
    background(255);
  }
  //println(keyCode + "" + LEFT);
  //println(key);//whatever key you pressed comes up on println

  //  if (key == '2') {
  // STATE = 0; //switch back to state 0
  //  }
  if (key == '1') {
    BobRoss.switchState (1); //according to switchState in the Artist tab, if press 1 draw square
  }
  if (key == '2') {
    BobRoss.switchState(0); //switch back to state 0
  }
  if (key =='3') {  
    BobRoss.switchState(2);
  }
  if (key == ' ') {
  BobRoss.strokeSwitch();
  }
}
void mousePressed() {
  if (STATE == 1) {
    BobRoss.drawStuff(mouseX, mouseY); //draw when mouse is pressed
  }
}
void mouseDragged() {
  if (STATE == 1) {
  BobRoss.drawStuff(mouseX, mouseY); //draw when mouse is dragged
  }
}
class Artist {
  int drawState = 0; //it's a state not an integer
  Boolean strokeSwitch = false; // or call it isStrokeOn Boolean is either true or false
  Artist() {
  }
  void drawStuff (int x, int y ) {
    if (strokeSwitch == true) {
      stroke(0);
    } 
    else {
      noStroke();
    }
    if (drawState == 0) {
      fill(21, 140, 20);
      ellipse(x, y, 20, 20);
    } 
    else if (drawState ==1) {
      fill(200, 50, 130);
      rect(x, y, 20, 10);
    }
    else if (drawState == 2) {
      fill(255, 100, 60);
      ellipse(x, y, 30, 30);
    }
  }
  void switchState (int newState) {
    drawState = newState;
  }

  void setStroke() {
    if (strokeSwitch == true) {
      strokeSwitch = false;
    } 
    else {
      strokeSwitch = true;
    }
  }
  // strokeSwitch = !strokeSwitch; ! means 'not'
}

