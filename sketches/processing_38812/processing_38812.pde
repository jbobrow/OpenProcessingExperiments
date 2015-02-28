
// HW 7 - Computing for the Arts with Processing
// © Asa Foster 2011

PImage face;

int dia = 100;
float xValue = 0;
float yValue = 0;
float xPercent = 0;
float yPercent = 0;
float xLoc = 400;
float yLoc = 400;


void setup() {
  size(800, 800);
  smooth();
  noStroke();
  imageMode(CENTER);
  face = loadImage("face.png");
}

void draw() {
 background(40);
 mouseInput();
 screenGUI();
 moveObject();
}

void mouseInput() {
  if((mouseX == 0) && (mouseY == 0)) {
    mouseX = 400;
    mouseY = 400;
  }
  xValue = (mouseX - (width/2));
  xPercent = (xValue / 400) * 100;
  yValue = -(mouseY - (height/2));
  yPercent = (yValue / 400) * 100;
}

void screenGUI() {
 fill(255);
 text("X:", 20, 20);
 text(xPercent, 40, 20);
 text("Y:", 20, 40);
 text(yPercent, 40, 40);
 fill(60);

}
 
void moveObject() {
  fill(255);
  ellipse(xLoc, yLoc, dia-5, dia-5);
  image(face, xLoc, yLoc, dia, dia);
  xLoc = xLoc + (xPercent / 5);
  yLoc = yLoc - (yPercent / 5);

  if(xLoc > width + dia/2) {
    xLoc = -dia/2;
  }
  if(xLoc < -dia/2) {
    xLoc = width + dia/2;
  }  
  if(yLoc > height + dia/2) {
    yLoc = -dia/2;
  }
  if(yLoc < -dia/2) {
    yLoc = height + dia/2;
  }

}

void keyPressed() {
  xLoc = width/2;
  yLoc = height/2;
  xValue = 0;
  yValue = 0;
  xPercent = 0;
  yPercent = 0;
  mouseX = 400;
  mouseY = 400;
}

