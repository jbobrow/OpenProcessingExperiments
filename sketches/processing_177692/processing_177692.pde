
PShape blattOutline = null;
PShape blattLinien = null;
PShape blattHintergrund = null;

void setup() {

  size(600, 600);
  smooth();
  PShape blatt = loadShape("blatt.svg");
  blattOutline = blatt.getChild("outline");
  blattLinien = blatt.getChild("linien");
  blattHintergrund = blatt.getChild("hintegrund");
}

void draw () {
  background (#ffedbc);

  drawShape(blattHintergrund, width/2-100, 500, 0, 0.5);
  drawShape(blattLinien, width/2, 500, 0, 0.5);
  drawShape(blattOutline, width/2+100, 500, 0, 0.5);
}

void drawShape(PShape vector, float x, float y, float rotation, float scaleing) {
  pushMatrix();
  translate(x, y);
  rotate(rotation+PI);
  scale (scaleing);
  shape(vector, 0, 0);
  popMatrix();
}



