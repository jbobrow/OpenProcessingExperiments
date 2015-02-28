
// Ho-Gyun Choi
// hogyunc
// Introduction to Digital Media 1
// Homework 1b / Section B


// README:
// INSTRUCTIONS: Create digital art using mouse and keyboard
// Available keys:
// ---------------
// '1' - Turn on/off line tool   / '2' - Turn on/off Ellipse tool
// '3' - Turn on/off Rect tool   / '4' - Turn on/off Splatter tool
// 'r' - Increase Red value  / 'g' - Increase Green value
// 'b' - Increase Blue value / 'c' - Clear the screen
// 's' - Save image as PNG

// Global Variables
int globalRed = 15;
int globalGreen = 60;
int globalBlue = 10;
boolean lineDrawOn = false;
int lineDrawMouseX = width/2;
int lineDrawMouseY = height/2;

boolean rectDrawOn = false;
int rectDrawMouseX = width/2;
int rectDrawMouseY = height/2;

boolean ellipseDrawOn = false;
int ellipseDrawMouseX = width/2;
int ellipseDrawMouseY = height/2;

boolean pointsDrawOn = false;



// Init
void setup() {
  background(0);
  size(1200, 600);
}



// Run
void draw() {
  smooth();
  draw_RGB_bar();
  strokeWeight(random(15));
  stroke(globalRed, globalGreen, globalBlue);

  // Line tool 
  if (lineDrawOn == true) {
    line(lineDrawMouseX, lineDrawMouseY, mouseX, mouseY);
  }

  // Rect tool
  if (rectDrawOn == true) {
    rect(rectDrawMouseX, rectDrawMouseY, mouseX-rectDrawMouseX, mouseY - rectDrawMouseY);
  }

  // Ellipse tool
  if (ellipseDrawOn == true) {
    ellipse(ellipseDrawMouseX, ellipseDrawMouseY, mouseX-ellipseDrawMouseX, mouseY - ellipseDrawMouseY);
  }

  // Splatter tool
  if (pointsDrawOn == true) {
    stroke(globalRed, globalGreen, globalBlue);
    point(random(width), random(height));
  }
}



// Left corner RGB color pallete bar
void draw_RGB_bar() {
  strokeWeight(7);
  stroke(globalRed, 0, 0);
  line(50, height-50, 50, height-globalRed);

  stroke(0, globalGreen, 0);
  line(65, height-50, 65, height-globalGreen);

  stroke(0, 0, globalBlue);
  line(80, height-50, 80, height-globalBlue);

  noStroke();
  fill(globalRed, globalGreen, globalBlue);
  rect(95, height-65, 40, 40);

  if (lineDrawOn) {
    fill(globalRed, globalGreen, globalBlue);
    rect(25, 15, 10, 5);
  }
  else {
    fill(0);
    rect(25, 15, 10, 5);
    fill(globalRed, globalGreen, globalBlue);
  }  


  if (ellipseDrawOn) {
    fill(globalRed, globalGreen, globalBlue);
    ellipse(60, 15, 10, 10);
  }
  else {
    fill(0);
    ellipse(60, 15, 11, 11);
    fill(globalRed, globalGreen, globalBlue);
  }

  if (rectDrawOn) {
    fill(globalRed, globalGreen, globalBlue);
    rect(80, 10, 10, 10);
  }
  else {
    fill(0);
    rect(80, 10, 10, 10);
    fill(globalRed, globalGreen, globalBlue);
  }
  
    if (pointsDrawOn) {
    fill(globalRed, globalGreen, globalBlue);
    ellipse(100, 10, 10, 10);
  }
  else {
    fill(0);
    ellipse(100, 10, 11, 11);
    fill(globalRed, globalGreen, globalBlue);
  }
  
}


// All key events 
void keyPressed() {
  // Clear screen

  if (key == '4') {
    pointsDrawOn = !pointsDrawOn;
  }

  if (key == '3') {
    rectDrawMouseX = mouseX;
    rectDrawMouseY = mouseY;
    rectDrawOn = !rectDrawOn;
  }

  if (key == '2') {
    ellipseDrawMouseX = mouseX;
    ellipseDrawMouseY = mouseY;
    ellipseDrawOn = !ellipseDrawOn;
  }
  if (key == '1') {
    lineDrawMouseX = mouseX;
    lineDrawMouseY = mouseY;
    lineDrawOn = !lineDrawOn;
  }
  if (key == 'c') {
    noStroke();
    fill(0);
    rect(0, 0, width, height);
  }
  if (key == 'r') {
    if (globalRed > 255) {
      globalRed = 0;
    }
    else {
      globalRed += 10;
    }
  }
  if (key == 'g') {
    if (globalGreen >255) {
      globalGreen = 0;
    }
    else {
      globalGreen += 10;
    }
  }
  if (key == 'b') {
    if (globalBlue > 255) {
      globalBlue = 0;
    }
    else {
      globalBlue += 10;
    }
  }

  if (key == 's') {
    save("SAVE_FILE_HGC.png");
  }
}


