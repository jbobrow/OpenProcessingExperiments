
// Pyramid construction learned @ Learning Processing
// Example 14-10: Pyramid by Daniel Shiffman
// http://www.learningprocessing.com

class Pyramid {

  // properties
  int t;
  int shiftX, shiftY, shiftZ;
  int rot;

  //constructor
  Pyramid(int t, int shiftX, int shiftY, int shiftZ, int rot) {
    this.t = t;
    this.shiftX = shiftX;
    this.shiftY = shiftY;
    this.shiftZ = shiftZ;
    this.rot = rot;
  }


  void drawPyramid() {
    noStroke();

    //pyramid has 4 sides, each side is a separate triangle
    //each triangle has 3 vertices
    // "t" determines the size of the pyramid

    beginShape(TRIANGLES);

    fill(255, 0, 0, 127);
    vertex(-t + shiftX, -t + shiftY, -t + shiftZ);
    vertex( t + shiftX, -t + shiftY, -t + shiftZ);
    vertex( 0 + shiftX, 0 + shiftY, t + shiftZ);

    fill(255, 0, 0, 127);
    vertex( t + shiftX, -t + shiftY, -t + shiftZ);
    vertex( t + shiftX, t + shiftY, -t + shiftZ);
    vertex( 0 + shiftX, 0 + shiftY, t + shiftZ);

    fill(255, 0, 0, 127);
    vertex( t + shiftX, t + shiftY, -t + shiftZ);
    vertex(-t + shiftX, t + shiftY, -t + shiftZ);
    vertex( 0 + shiftX, 0 + shiftY, t + shiftZ);

    fill(255, 0, 0, 127);
    vertex(-t + shiftX, t + shiftY, -t + shiftZ);
    vertex(-t + shiftX, -t + shiftY, -t + shiftZ);
    vertex( 0 + shiftX, 0 + shiftY, t + shiftZ);

    rotate(PI*rot);
    endShape();
  }
}


