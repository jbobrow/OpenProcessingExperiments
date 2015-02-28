
//Dongjae "Krystofer" Kim
//Swirles


int diam = 10;
float centX, centY;

void setup() {
  size(500, 500);
  frameRate(24);
  smooth();
  background(255);
  centX=width/2;
  centY=height/2;
  strokeWeight(70);
  noFill();
}

void draw() {
  if (mouseX<250 && mouseY<250) {
    if (mousePressed) {
      stroke(116, 168, 255, 50);
      ellipse(mouseX, mouseY, diam, diam);
      diam += 10;
    } 
    else {
      diam = 10;
    }
  }
  if (mouseX>250 && mouseY<250) {
    if (mousePressed) {
      stroke(99, 240, 215, 50);
      ellipse(mouseX, mouseY, diam, diam);
      diam += 10;
    } 
    else {
      diam = 10;
    }
  }
    if (mouseX>250 && mouseY>250) {
    if (mousePressed) {
      stroke(242, 107, 39, 50);
      ellipse(mouseX, mouseY, diam, diam);
      diam += 10;
    } 
    else {
      diam = 10;
    }
  }
    if (mouseX<250 && mouseY>250) {
    if (mousePressed) {
      stroke(250, 233, 78, 50);
      ellipse(mouseX, mouseY, diam, diam);
      diam += 10;
    } 
    else {
      diam = 10;
    }
  }
}
