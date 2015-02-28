
import guicomponents.*;

GKnob knbRed, knbGreen, knbBlue;
int r, g, b;
int kx, ky;

void setup() {
  size(500, 200);
  r = g = b = 160;
  kx = 20;
  ky = 20;
  G4P.setMouseOverEnabled(true);
  G4P.cursor(HAND, CROSS);

  knbRed = new GKnob(this, kx, ky, 150, 150, 270);
  knbRed.setRotArcOnly(true);
  knbRed.setLimits(r, 0, 255);
  knbRed.setNbrTickMarks(9);
  knbRed.localColor = GCScheme.getColor(this, GCScheme.RED_SCHEME);

  knbGreen = new GKnob(this, kx + 8, ky, 150, 270, 20);
  knbGreen.setRotArcOnly(true);
  knbGreen.setLimits(g, 0, 255);
  knbGreen.setNbrTickMarks(9);
  knbGreen.localColor = GCScheme.getColor(this, GCScheme.GREEN_SCHEME);

  knbBlue = new GKnob(this, kx + 4, ky + 9, 150, 20, 150);
  knbBlue.setRotArcOnly(true);
  knbBlue.setLimits(b, 0, 255);
  knbBlue.setNbrTickMarks(9);

  stroke(0);
  strokeWeight(3);
  rectMode(CORNERS);
}

void draw() {
  background(220, 220, 255);
  fill(r, g, b);
  rect(kx + 190, 20, width - 40, height - 20);
}

void handleKnobEvents(GKnob knob) {
  if (knob == knbRed) 
    r = knob.getValue();
  else if (knob == knbGreen)
    g = knob.getValue();
  else if (knob == knbBlue)
    b = knob.getValue();
}


