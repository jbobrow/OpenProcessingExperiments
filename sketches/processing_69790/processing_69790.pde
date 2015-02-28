
//created by luis gil
//http://www.legil.org

int x;
int y;
float ease = 0.05;
int tolerance;
float redFactor;  //reduction factor
int opacity = 150;    //line transparency (0-255)
int sizeStroke = 10;    //line stroke size

void setup() {
  size(900, 450);
  smooth();
  noCursor();
  tolerance = 50;
  redFactor = 0.02;
}

void draw() {
  background(255);
  for (int i = 50; i < (width-25); i += 25) {
    for (int j = 50; j < (height-25); j += 25) {
      stroke(map(i, 0, 500, 0, 255), map(j, 0, 500, 0, 255), 125, opacity);
      lineRot(i, j);
    }
  }
}

//void mousePressed() {
 // save("desktop.jpg");
//}

void lineRot(int xPos, int yPos) {
  strokeWeight(sizeStroke);
  pushMatrix();
  translate(xPos, yPos);
  float angle = atan2(mouseY-yPos, mouseX-xPos);
  float mouseDist = dist(mouseX, mouseY, xPos, yPos);
  //line below is test
  rotate(angle-PI);
  if (dist(mouseX, mouseY, xPos, yPos) < tolerance) {
    //rotate(angle);
    line(0, 0, mouseDist, 0);
  } 
  else {
    //rotate(angle-PI);
    line(0, 0, tolerance/(mouseDist*redFactor), 0);
  }
  popMatrix();
}

