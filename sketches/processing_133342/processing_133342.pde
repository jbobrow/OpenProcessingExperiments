
//press 'q' and 'w' to make circles smaller or larger
//press 'e' to clear canvas
//press 'z' to take a screenshot

void setup() {
  size(600, 600);
  background(255);
  //noFill();
}

int mystroke = 1;
int angle;
int cSize =10;

//screenshots:
void keyPressed() {
  if (key == 'z' || key == 'Z') {
    saveFrame("filename-####.pdf");
  }
}

void draw() {

  strokeWeight(mystroke);

  if (keyPressed) {  
    if (key == 'w') {
      cSize+= 1;
    } 
    if (key == 'q' && cSize > 0) {
      cSize-= 1;
    }
    if (key == 'e') {
      background(255);
    }
  }

  if (mousePressed) {
    stroke(0);
    ellipse(mouseX, mouseY, cSize, cSize);

  }

  if (mousePressed) {
    stroke(255, 0, 0);
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(radians(angle));
    angle+=5;
    ellipse(+25, +25, cSize, cSize);
    popMatrix();

    stroke(0, 0, 255);
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(radians(angle));
    angle+=5;
    ellipse(-25, -25, cSize, cSize);
    popMatrix();
  }
}

