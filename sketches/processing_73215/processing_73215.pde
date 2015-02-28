
////////////////////////////////////////////////////////////////
//Emma Lipscomb
//October 2, 2012
//CSE homework 6
//this program draws a sky background with a transparent rectangle 
//over whichever quadrant that the mouse is in.  
//The program lets a smiley face appear/dissapear when the mouse 
//is pressed.  The smiley starts off already appearing.
////////////////////////////////////////////////////////////////

int trans;
PImage b;
boolean smileyOn = true;

void setup() {
  size(600, 600);

  b = loadImage("Rainbow.jpg");
  b.resize(width, height);
  background(b);
}

//draws translucent colored rectangles over the background
//in the quadrant of the mouse's current location.
void draw() { 

  background(b);
  if (mouseX < 300 && mouseY < 300) {
    drawRecUL();
  }


  if (mouseX > 300 && mouseY < 300) {
    drawRecUR();
  }

  else if (mouseX < 300 && mouseY > 300) {
    drawRecLL();
  }

  else {
    if (mouseX > 300 && mouseY > 300) {
      drawRecLR();
    }
    drawDot();
  }

  //if the mouse is pressed and the boolean for 
  //whether the smiley is on or not is true, then
  //have the smiley face show up.
  if (smileyOn) {
    drawSmiley();
  }
}

//shows smiley face or makes smiley face dissappear
void mousePressed() {
  smileyOn = !smileyOn;
}

//draws smiley face
void drawSmiley() {
  fill(248, 252, 3);
  ellipse(300, 300, 150, 150);
  fill(0);
  ellipse(275, 275, 20, 20);
  ellipse(325, 275, 20, 20);
  arc(300, 310, 90, 70, 0, PI/2);
  arc(300, 310, 90, 70, PI/2, PI);
}

//rectangle for upper left
void drawRecUL() {
  fill(0, 255, 0, 50);
  rect(0, 0, 300, 300);
}

//rectangle for upper right
void drawRecUR() {
  fill(0, 255, 206, 50);
  rect(300, 0, 300, 300);
}

//rectangle for lower left
void drawRecLL() {
  fill(255, 0, 30, 50);
  rect(0, 300, 300, 300);
}

//rectangle for lower right
void drawRecLR() {
  fill(255, 115, 0, 50);
  rect(300, 300, 300, 300);
}

int dotSize(int diam){
  diam = diam + frameCount;
  return diam;
}


//dot that follows the mouse
void drawDot() {
  int purple = 200;
  fill(purple, 0, purple);
  //I was unable to plug in the previous method to 
  //make the ellipse change size with the frameCount.
  ellipse(mouseX, mouseY, 15, 15);
}



