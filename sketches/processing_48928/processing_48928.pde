
class Doodle {
  PVector[] pointArray = new PVector[0];
  int numPoints;
  boolean isSmooth;
  PVector secUpperLeftCorner, secLowerRightCorner;

  Doodle(PVector tempSecUpperLeftCorner, PVector tempSecLowerRightCorner, int tempNumPoints, boolean tempSmooth) {
    // Receives a sector's dimensions as two Pvectors
    // and the number of points within the sector for the doodle
    // plus a parameter to determine whether it should be smooth

      isSmooth = tempSmooth;
    numPoints = tempNumPoints + 2; // Add two here so that we always have two points for making a line
    secUpperLeftCorner = tempSecUpperLeftCorner;
    secLowerRightCorner = tempSecLowerRightCorner;

    for (int i = 0; i < numPoints; i++) {
      float thisX = random(secUpperLeftCorner.x, secLowerRightCorner.x);
      float thisY = random(secUpperLeftCorner.y, secLowerRightCorner.y);
      PVector thisPoint = new PVector(thisX, thisY);
      pointArray = (PVector[])append(pointArray, thisPoint);
    }
  }

  void display() {
    noStroke();
    fill(color((int)random(255), (int)random(255), (int)random(255)));
    strokeWeight(1);

    beginShape();
    for (int i = 0; i < pointArray.length; i++) {
      if (isSmooth) {
        curveVertex(pointArray[i].x, pointArray[i].y);
      } 
      else {
        vertex(pointArray[i].x, pointArray[i].y);
      }
    }
    // Close the shape
    if (isSmooth) {
      curveVertex(pointArray[0].x, pointArray[0].y);
    } 
    else {
      vertex(pointArray[0].x, pointArray[0].y);
    }
    endShape();
  }
}


