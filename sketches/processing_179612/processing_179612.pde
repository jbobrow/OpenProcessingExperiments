
import processing.pdf.*;
import java.util.Calendar;
boolean savePDF = false;
int numPoints = 12;
float angleOffset = 270;
float centX;
float centY;
float radius1;
float radMult;
float radius2;
float diamRatio = .98;

void setup() {
  size(500, 500);
  smooth();
  background(255);
  centX = width / 2;
  centY = height / 2;
  scg();
}
void draw() {
}


void scg() {
  radius1 = ((Math.min(width, height) * diamRatio ) / 4);
  radius2 = radius1;

  // create an ellipse with no stroke--this will essentially just
  // overwrite
  // the background
  fill(255);
  strokeWeight(0);
  ellipse(centX, centY, radius1 * 4, radius1 * 4);
  // noFill is needed in order for the rest of the shape to be drawn
  // correctly.
  noFill();
  strokeWeight(1);

  float angle = 360 / (float) numPoints;
  for (int i = 0; i < numPoints; i++) {
    float x = centX
      + (radius1 * cos(radians(angle * i + angleOffset)));
    float y = centY
      + (radius1 * sin(radians(angle * i + angleOffset)));
    ellipse(x, y, radius2 * 2, radius2 * 2);
  }
}

public void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      numPoints += 1;
    } else if (keyCode == DOWN) {
      numPoints -= 1;
    } else if (keyCode == LEFT) {
      diamRatio -= .02;
    } else if (keyCode == RIGHT) {
      diamRatio += .02;
    }
    if(numPoints < 0) numPoints = 0;
    if (diamRatio < .05) diamRatio = .05;
    background(255);
    scg();
  }
  //  if (key == '-') {
  //    _innerRadAdj = -.02f;
  //    drawMandala();
  //  }
  //  if (key == '+') {
  //    _innerRadAdj = .02f;
  //    drawMandala();
  //  }
}

public void keyReleased() {
  //  if (key == 'p' || key == 'P') {
  //    _savePDF = true;
  //    beginRecord(PDF, _fileName + "-" + MandalaLibrary.timestamp()
  //      + ".pdf");
  //    drawMandala();
  //    endRecord();
  //  }
  //  if (key == 's' || key == 'S') {
  //    saveFrame(_fileName + "-" + MandalaLibrary.timestamp() + ".png");
  //  }
}




