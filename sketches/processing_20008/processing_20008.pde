
// detects when the mouse cursor is within the area 
// of a rectrangle 

// first, define our "button" area using four variables
int btnX = 100;
int btnY = 100;
int btnW = 200;
int btnH = 200;

void setup() {
  size(400, 400);
  noStroke();
}

void draw() {
  background(0);
  
  // see if mouse is inside the rectangle area defined
  // by btnW and btwH located at (btnX, btnY)
  if ( mouseX > btnX && mouseX < (btnX + btnW) && mouseY > btnY && mouseY < (btnY + btnH)) {
    // yes, it is, set the fill to white
    fill(255);
  }
  else {
    // nope, it isn't, set the fill to gray
    fill(64);
  }
  
  // draw the "button"
  rect(btnX, btnY, btnW, btnH);  
}
