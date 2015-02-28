
// Sherol Chen
// My creature
// 8-5-2013

// This is my setup function. It setsup the canvas


void setup() {

  size(500, 500);
  smooth();

  println("settin up");
}

//==========================


// This is my draw function. 
// It loops through like a flipbook

void draw() {

  // Creature code goes here.

  background(255, 255, 255);

  if (!mousePressed) {
    mySadCreature();
  } else {
    myHappyCreature();
  }
}

//==========================

void mySadCreature() {

  fill(255, 0, 0);  
  ellipse(mouseX + 50, mouseY + 50, 80, 80);

  // eyes
  ellipse(mouseX + 60, mouseY + 45, 10, 10); 
  ellipse(mouseX + 40, mouseY + 45, 10, 10);
}

//==========================

void myHappyCreature() {

  fill(0, 255, 0);
  ellipse(mouseX + 50, mouseY + 50, 80, 80); 

  // eyes 
  ellipse(mouseX + 60, mouseY + 45, 10, 10); 
  ellipse(mouseX + 40, mouseY + 45, 10, 10);
}

