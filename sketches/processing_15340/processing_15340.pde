
float theta = 0.0f;
int sideLength = 50;

void setup() {
  size(800, 600, P3D);
  smooth();
  stroke(255);
  strokeWeight(1);
}

void draw() {
  background(0);
  theta += 0.01;

  directionalLight(255, 255, 255, -1, 0, 0);

  // loop over the height of the screen
  for (int i = sideLength; i < height + sideLength; i = i
				+ (sideLength * 2)) {
      // loop over the width of the screen
    for (int j = sideLength; j < width; j = j + (sideLength * 2)) {

      // push the matrix
      pushMatrix();
      // translate each forward and sideways
      translate(j,i, 0);
      // rotate
      rotateX(theta);
      rotateY(theta);
      rotateZ(theta);
      // draw a diamond
      drawDiamond(sideLength, sideLength, 8);
      popMatrix();
    }
  }
}

void drawDiamond(float width, float height, int sides) {

  float angleIncrement = TWO_PI / sides;

  // top
  float angle = 0;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(0, 0, 0);
    vertex(width * cos(angle), height, width * sin(angle));
    angle += angleIncrement;
  }
  endShape();

  // bottom
  angle = 0;
  beginShape(TRIANGLE_FAN);
  // Centre point
  vertex(0, height + width, 0);
  for (int i = 0; i < sides + 1; i++) {
    vertex(width * cos(angle), height, width * sin(angle));
    angle += angleIncrement;
  }
  endShape();
}


