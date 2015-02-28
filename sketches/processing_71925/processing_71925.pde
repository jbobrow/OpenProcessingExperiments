
//Eliana Weiner
//Introduction to Digital Media Fall 2012 - Assignment 01b
//Section A
//9.11.12

float randomdiameter=0; //Global Variable - float
float strokeGray=0; //Global Variable - float

float ellipsediameter=50;
float strokealpha=255;

void setup() {
  size(1200, 600);
  //background(255,115,0);
  noStroke();
  colorMode(RGB, 210);
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      stroke(i*6, j, 0);
      point(i, j*3);
    }
  }
}

void draw() {
  
  noStroke();
  fill(40,11,88,10);      //Set to purple transparency  
  rect(0,0,width,height);
  
  smooth(); //anti-aliasing 
  stroke(strokeGray);
  strokeWeight(3.5);
  fill(255, 98, 135); //set inside the triangles's color to pink

  randomdiameter = random(20, 180);
  if (randomdiameter<180) { //stops at 180, 
    randomdiameter++;
  }
  else {
    randomdiameter=0;
  }
  triangle(mouseX, mouseY, randomdiameter, randomdiameter, mouseY, mouseX);

  smooth();  //anti-aliasing
  stroke(strokealpha);
  strokeWeight(2);
  //fill(255, 174, 98); //inside color

  ellipsediameter = random (75, 220);
  if (ellipsediameter<220) {  //stops at 220,
    ellipsediameter++;
  }
  else {
    ellipsediameter=50;
  }
  ellipseMode(CORNER);  // Set ellipseMode is CORNER
  fill(0);  // Set fill to black
  ellipse(mouseX, mouseY, ellipsediameter, ellipsediameter);  // Draw yellow ellipse using CORNER mode

  ellipseMode(CORNERS);  // Set ellipseMode to CORNERS
  fill(255,174,98);  // Set fill to orange
  ellipse(mouseX, mouseY, ellipsediameter, ellipsediameter);  // Draw gray ellipse using CORNERS mode
}


void mouseClicked() {

  if (strokeGray==0) { //Conditional if stroke is black change it to white
    strokeGray=150;    //If strokeGray is set to black, set it to white
  }
  else {      //Or else, set stroke from white to black-do this if conditional isnt met
    strokeGray=0;
  }

  if (strokealpha==255) {  //Conditional if stroke is white change it to black
    strokealpha=0;
  }
  else {          //Or else, set stroke from black to white - do this if conditional isnt met
    strokealpha=255;
  }
}
