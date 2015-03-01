
PShape blume = null;

void setup() {

  size(600, 600);
  smooth();
  blume = loadShape("blume.svg");
  noLoop();
}

void draw () {
  background (#ffedbc);
  float rotation = random (-PI, PI);
  drawShape (blume, width/2, height/2, -rotation, 0.5, false, false);
  drawShape (blume, width/2, height/2, rotation, 0.5, false, true);
}

void drawShape(PShape vector, float x, float y, float rotation, float scaleing, boolean mirrorHorizontal, boolean mirrorVertical) {

  float vectorWidth = vector.width;
  float vectorHeight = vector.height;

  if (mirrorHorizontal == true) {
    vectorHeight = vectorHeight * -1;
  }

  if (mirrorVertical == true) {
    vectorWidth = vectorWidth * -1;
  }

  pushMatrix();
  translate(x, y);
  rotate(rotation+PI);
  scale (scaleing);
  shape(vector, 0, 0, vectorWidth, vectorHeight);
  popMatrix();
}


void mousePressed () {
  redraw();
}


