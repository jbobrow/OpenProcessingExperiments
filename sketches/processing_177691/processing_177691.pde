
PShape blume = null;
PShape blatt = null;

void setup() {

  size(600, 600);
  smooth();
  blume = loadShape("blume.svg");
  blatt = loadShape("blatt.svg");
}

void draw () {
  background (#ffedbc);

  drawShape(blume, width/2, height/2, PI, 0.5);
  drawShape(blatt, width/2, height/2, 0, 0.4);
}

void drawShape(PShape vector, float x, float y, float rotation, float scaleing) {
  pushMatrix();
  translate(x, y);
  rotate(rotation+PI);
  scale (scaleing);
  shape(vector, 0, 0);
  popMatrix();
}



