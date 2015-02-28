
boolean overRedBox = false;
boolean overGreenBox = false;
boolean overBlueBox = false;
boolean overYellowBox = false;

void setup() {
  size(640, 480, P3D);
  noStroke();
  colorMode(RGB);
}

void draw() {
  lights();
  background(0);
  // set camera
  camera(0, 300, 100, // eyeX, eyeY, eyeZ
  0.0, 0.0, 0.0, // centerX, centerY, centerZ
  0, 1, 0.0); // upX, upY, upZ

  // RedBox
  if (overRedBox == true) {
    fill(255, 0, 0);
    noStroke();
  } 
  else {
    noFill();
    stroke(255);
  }
  translate(30, 0, 30);
  box(60);

  // GreenBox
  if (overGreenBox == true) {
    fill(0, 255, 0);
    noStroke();
  } 
  else {
    noFill();
    stroke(255);
  }
  translate(-60, 0, 0);
  box(60);

  // BlueBox
  if (overBlueBox == true) {
    fill(0, 0, 255);
    noStroke();
  } 
  else {
    noFill();
    stroke(255);
  }
  translate(0, 0, -60);
  box(60);

  // YellowBox
  if (overYellowBox == true) {
    fill(255, 255, 0);
    noStroke();
  } 
  else {
    noFill();
    stroke(255);
  }
  translate(60, 0, 0);
  box(60);
}

void mousePressed(){ 
  checkBoxes();
}

void checkBoxes() {
  if (mouseX > width*0.5 && mouseX < width*0.75 && mouseY < height*0.5 && mouseY > height*0.25) {
    overRedBox = true;
  } 
  else if (mouseX < width*0.5 && mouseX > width*0.25 && mouseY < height*0.5 && mouseY > height*0.25) {
    overGreenBox = true;
  } 
  else if (mouseX < width*0.5 && mouseX > width*0.25 && mouseY > height*0.5 && mouseY < height*0.75) {
    overBlueBox = true;
  } 
  else if (mouseX > width*0.5 && mouseX < width*0.75 && mouseY > height*0.5 && mouseY < height*0.75) {
    overYellowBox = true;
  } 
  else {
    overRedBox = overGreenBox = overBlueBox = overYellowBox = false;
  }
}


