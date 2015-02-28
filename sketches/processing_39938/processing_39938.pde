
//========================================
//SetUp
//========================================

void setup() {
  //Canvas
  size(720, 480);
  //Background
  background(0);
}

//========================================
//Draw
//========================================

void draw() {
  //pic a random color for the background
  background(random(255), random(255), random(255));

  //========================================
  //For loop for the grid of the patern.
  //========================================

  //Start for loop one with variables 
  for (int lineY = 0; lineY < 820; lineY = lineY + 80) {
    //Start for loop two with variables
    for (int lineX = 0; lineX < 820; lineX = lineX + 80) {
      //Rectangles with random forms and white lines
      stroke(255);
      fill(0, 0, 0, 50);
      rect(lineX, lineY, random(-80, 80), random(-80, 80));
      //Ellipses with random forms and white lines
      stroke(255);
      fill(0, 0, 0, 50);
      ellipse(lineX-20, lineY-20, random(-80, 80), random(-80, 80));
    }
  }
}

