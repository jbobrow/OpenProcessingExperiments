
// side of square
int side = 40;

// length of diagonal and distance from corner to center
float diag = side*sqrt(2);
float halfDiag = diag/2;

// http://www.colourlovers.com/palette/1473/Ocean_Five
color[] colors = {
  #00A0B0, #6A4A3C, #CC333F, #EB6841, #EDC951
};

void setup() {
  size(370, 370);
  frameRate(6);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  pushMatrix();

  for (int i=0; i<2; i++) {

    for (float x = halfDiag; x < width-diag; x += diag) {
      for (float y = halfDiag; y < height-diag; y += diag) {

        pushMatrix();
        translate(x, y);

        beginShape(TRIANGLE_FAN);

        fill(getRndColor());
        vertex(0, 0);

        fill(getRndColor());
        vertex(0, -halfDiag);

        fill(getRndColor());
        vertex(halfDiag, 0);

        fill(getRndColor());
        vertex(0, halfDiag);

        fill(getRndColor());
        vertex(-halfDiag, 0);

        fill(getRndColor());
        vertex(0, -halfDiag);
        endShape();

        popMatrix();
      }
    }
    translate(halfDiag, halfDiag);
  }
  popMatrix();
}

color getRndColor() {
  return colors[floor(random(colors.length))];
}

