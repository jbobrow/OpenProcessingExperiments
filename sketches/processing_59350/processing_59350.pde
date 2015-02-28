
int x;
int y;
float ease = 0.05;
int tolerance;
float redFactor;  //reduction factor
int opacity = 125;    //line transparency (0-255)

void setup() {
  size(700, 700);
  smooth();
  noCursor();
  tolerance = 35;
  redFactor = 0.0125;
}

void draw() {
  background(255);
  for (int i = 35; i < (width-25); i += 20) {
    for (int j = 35; j < (height-25); j += 20) {
      stroke(map(i, 0, 500, 0, 255), map(j, 0, 500, 0, 255), 125, opacity);
      lineRotation(i, j);
    }
  }
}

void lineRotation(int xPos, int yPos) {
  strokeWeight(5);
  pushMatrix();
  translate(xPos, yPos);
  float angle = atan2(mouseY-yPos, mouseX-xPos);
  float mouseDist = dist(mouseX, mouseY, xPos, yPos);
  rotate(angle-PI); //Bulge outwards ((angle)means inwards)

  if (dist(mouseX, mouseY, xPos, yPos) < tolerance) { //rotate(angle);
    line(0, 0, mouseDist, 0); //stays normal
  }
  else { 
    line(0, 0, tolerance/(mouseDist*2*redFactor), 0); // bulge outwards
  }
  popMatrix();

  if (mousePressed == true) { //bubbles
    pushMatrix();
    strokeWeight(3);
    translate(xPos, yPos);
    float sizeOf = dist(mouseX, mouseY, xPos, yPos);
    ellipse(0, 0, width/30 - sizeOf/10, height/30 - sizeOf/10);
    popMatrix();
  }
}


