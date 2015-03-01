
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

  blattOutline.disableStyle();
  blattLinien.disableStyle();
  blattHintergrund.disableStyle();

  noStroke();
  fill(#E5F05C);
  drawShape(blattHintergrund, width/2-100, 350, 0, 0.4);
  fill(#457C25, 120);
  drawShape(blattLinien, width/2, 350, 0, 0.4);
  fill(#C42A5B);
  drawShape(blattOutline, width/2+100, 350, 0, 0.4);

  blattOutline.enableStyle();
  blattLinien.enableStyle();
  blattHintergrund.enableStyle();

  drawShape(blattHintergrund, width/2-100, 500, 0, 0.4);
  drawShape(blattLinien, width/2, 500, 0, 0.4);
  drawShape(blattOutline, width/2+100, 500, 0, 0.4);
}

void drawShape(PShape vector, float x, float y, float rotation, float scaleing) {
  pushMatrix();
  translate(x, y);
  rotate(rotation+PI);
  scale (scaleing);
  shape(vector, 0, 0);
  popMatrix();
}



