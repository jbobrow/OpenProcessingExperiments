
int xPos = 250; //Starting position
int yPos = 60;  //Starting position


void setup() {
  size(400,400); //Makes the window
  background(97, 199, 203); //Makes the sky
  frameRate(100);
}

void draw() {
  
  // ================================= Controls the Time of Day. Also removes extra suns.
  if (yPos <= 140) {
    background(97, 199, 203);
  } else if ((yPos > 140) && (yPos < 300)) {
    background(19, 154, 160);
  } else {
    background(0, 74, 77);
  }
  // ===================================================

  fill(255,187,0); // Orange
  ellipse(xPos, yPos, 50, 50); //Makes the Sun
  
  fill(50); // Grey
  rect(0, 340, width, 60); //Makes the Floor
  
  noStroke(); //Gets rid of outline.
  fill(100); //Lighter grey
  rect(0, 300, width, 40); //Skyline
  
  stroke(0); //Puts outline back.
  fill(20); //Dark Grey
  rect(40, 80, 50, 300); //Left tower
  rect(90, 110, 50, 270); //Middle Left Tower
  rect(175, 80, 50, 300); //Middle Right Tower
  rect(340, 95, 50, 285); //Right Tower
}

// =================================== Moves the sun around.
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      xPos = xPos - 1;
    } if (keyCode == RIGHT) {
      xPos = xPos + 1; 
    } if (keyCode == UP) {
      yPos = yPos - 1;
    } if (keyCode == DOWN) {
      yPos = yPos + 1;
    }
  }
}
// ============================================


