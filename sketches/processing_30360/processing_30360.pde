
import guicomponents.*;

final int WIDTH = 600;
final int HEIGHT = 400;
final int STOP_MODE = 0;
final int ROTATE_MODE = 1;

PImage guipic, colourpic, paperpic;
PFont font24, font18;

Gear c;
Ring r;

float radius, x, y;
boolean hidePeak = false;
long lastTime, time;
float t, speed = 1;
int paperSize, semiPaperSize, lineCol;

float a, da, angVelRatio;
float px0, py0, px1, py1;
float peakAngle = 0, cosPA = 1, sinPA = 0;

int ntRing, ntCog, nextNtRing, nextNtCog, nturns, nextNturns;
boolean hideCogs;

PGraphics paper;

int mode = STOP_MODE;

GButton btnUseCogs, btnStart, btnClear;
GHorzSlider sdrNtCog, sdrNtRing, sdrSpeed;
GOptionGroup optGroup = new GOptionGroup();
GOption[] optColour = new GOption[8];
GCheckbox cbxHide;
GKnob knbPeak;
GLabel lblPeak;

void makeGUIcontrols() {
  btnUseCogs = new GButton(this, "USE ", 540, 170, 50, 20);
  sdrNtRing = new GHorzSlider(this, 404, 44, 192, 10);
  sdrNtRing.setBorder(2);
  sdrNtRing.setLimits(nextNtRing, 150, 200);
  sdrNtCog = new GHorzSlider(this, 404, 94, 192, 10);
  sdrNtCog.setBorder(2);
  sdrNtCog.setLimits(nextNtCog, 30, 140);
  btnStart = new GButton(this, "START ", 404, 350, 60, 20);
  sdrSpeed = new GHorzSlider(this, 470, 350, 126, 20);
  sdrSpeed.setBorder(2);
  sdrSpeed.setLimits(10 * speed, 3, 65);
  for (int i = 0; i < optColour.length; i++) {
    optColour[i] = new GOption(this, "", 410 + 24 * i, 218, 20);
    optGroup.addOption(optColour[i]);
    optColour[i].tagNo = colourpic.get(24*i, 12);
  }
  optColour[1].setSelected(true);
  lineCol = optColour[1].tagNo;
  cbxHide = new GCheckbox(this, "HIDE COGS ", 404, 244, 100);
  btnClear = new GButton(this, "ERASE GRAPH ", 494, 240, 100, 20);
  knbPeak = new GKnob(this, 410, 264, 76, 0, 360);
  knbPeak.setNbrTickSpaces(12);
  knbPeak.setBezelWidth(10);
  knbPeak.setLimits(peakAngle, 0, TWO_PI);
  lblPeak = new GLabel(this, "<<< Peak Position >>> ", 480, 270, 200);
}

void releaseControls(boolean r) {
  btnUseCogs.setEnabled(r);
  sdrNtRing.setEnabled(r);
  sdrNtCog.setEnabled(r);
  btnStart.setEnabled(r);
  for (int i = 0; i < optColour.length; i++)
    optColour[i].setEnabled(r);
  btnClear.setEnabled(r);
  knbPeak.setEnabled(r);
}

void setup() {
  size(600, 400);
  cursor(CROSS);
  paperSize = min(WIDTH, HEIGHT);
  semiPaperSize = paperSize/2;
  G4P.setColorScheme(this, GCScheme.GREY_SCHEME);
  font24 = this.loadFont("digiface-24.vlw");
  font18 = this.loadFont("digiface-18.vlw");
  guipic = loadImage("spiro_a.png");
  colourpic = loadImage("colours.png");
  paperpic = loadImage("paper.jpg");
  ntRing = nextNtRing = 180;
  ntCog = nextNtCog = 120;	

  makeGUIcontrols();
  paper = createGraphics(paperSize, paperSize, JAVA2D);
  paper.beginDraw();
  paper.background(paperpic);
  paper.endDraw();

  // Create Ring and Gear wheel
  c = new Gear(this, 200, 200, ntCog);
  c.setColor(this.getRandomColor(0.01f, 0.41f));
  r = new Ring(this, paperSize, ntRing);
  r.setColor(this.getRandomColor(0.42f, 0.99f));
  // Calculate peak indicator for start position
  calcPeakIndicator();

  // Calculate useful info
  nextNturns = nturns = ntCog / gcd(ntRing, ntCog);
  radius = r.getRadius() - c.getRadius();
  angVelRatio = -r.getRadius() / c.getRadius();
  // Init position for cog wheel
  c.init(semiPaperSize + radius, semiPaperSize, 0);
  c.setPenColor(lineCol);
  time = lastTime = millis();
}

void mouseClicked() {
  if (mode == STOP_MODE) {
    int hn = c.overHole(mouseX, mouseY);
    if ( hn != -1)
      c.setHoleNo(hn);
  }
}

void draw() {
  time = millis();
  t = (time - lastTime)/ 1000.0f;
  lastTime = time;
  drawGUI();
  switch(mode) {
  case ROTATE_MODE:
    da = speed * t;
    a += da;
    x = semiPaperSize + radius * cos(a + peakAngle);
    y = semiPaperSize + radius * sin(a + peakAngle);
    c.moveTo(x, y);
    c.rotateTo(a*angVelRatio);
    c.drawPoint(paper);
    if (a > nturns * TWO_PI) {
      x = semiPaperSize + radius * cosPA;
      y = semiPaperSize + radius * sinPA;
      c.moveTo(x, y);
      c.rotateTo(0);
      mode = STOP_MODE;
      releaseControls(true);
    }
  case STOP_MODE:
    image(paper, 0, 0);
    if (!hideCogs) {
      if (mode == STOP_MODE && knbPeak.isOver(mouseX, mouseY) || knbPeak.hasFocus()) {
        stroke(64, 64);
        strokeWeight(6);
        line(px0, py0, px1, py1);
      }
      image(r.getRingImage(), 0, 0);
      c.draw();
    }
    break;
  }
}

void drawGUI() {
  background(192);
  image(guipic, 402, 2);
  image(colourpic, 404, 210);
  noStroke();
  textFont(font24);
  if (ntCog != nextNtCog)
    fill(256, 0, 0);
  else
    fill(0);
  text("" + nextNtCog, 530, 90);
  if (ntRing != nextNtRing)
    fill(256, 0, 0);
  else
    fill(0);
  text("" + nextNtRing, 490, 40);
  fill(0);
  textFont(font18);
  if (nturns != nextNturns)
    fill(256, 0, 0);
  else
    fill(0);
  text("" + nextNturns, 494, 170);
  if (mode == ROTATE_MODE) {
    float progress = a / (nturns * TWO_PI);
    stroke(0);
    strokeWeight(2);
    fill(255);
    rect(404, 380, 192, 16);
    noStroke();
    fill(64);
    rect(406, 382, progress * 188, 12);
  }
}

void handleCheckboxEvents(GCheckbox checkbox) { 
  hideCogs = checkbox.isSelected();
}

void handleOptionEvents(GOption optSel, GOption optDesel) {
  lineCol = optSel.tagNo;
  c.setPenColor(lineCol);
}

void handleKnobEvents(GKnob knob) {
  peakAngle = round(knob.getValuef() /  r.getToothAng()) * r.getToothAng();
  cosPA = cos(peakAngle);
  sinPA = sin(peakAngle);
  // Calculate peak angle indicator end points
  calcPeakIndicator();
  // Adjust gear
  c.setOffsetAng(-peakAngle);
  x = semiPaperSize + radius * cosPA;
  y = semiPaperSize + radius * sinPA;
  c.moveTo(x, y);
  c.rotateTo(a);
}

void calcPeakIndicator() {
  px0 = semiPaperSize + 10 * cosPA;
  py0 = semiPaperSize + 10 * sinPA;
  px1 = semiPaperSize + (r.getRadius() - 10) * cosPA;
  py1 = semiPaperSize + (r.getRadius() - 10) * sinPA;
}

void handleButtonEvents(GButton button) {
  if (button == btnStart) {
    releaseControls(false);
    x = semiPaperSize + radius * cosPA;
    y = semiPaperSize + radius * sinPA;
    c.init(x, y, peakAngle);
    a = 0;
    time = lastTime = millis();
    mode = ROTATE_MODE;
  }
  else if (button == btnClear) {
    paper.beginDraw();
    paper.background(paperpic);
    paper.endDraw();
  }
  else if (button == btnUseCogs) {
    if (nextNtCog != ntCog) {
      ntCog = nextNtCog;
      c = new Gear(this, 200, 200, ntCog);
      c.setColor(this.getRandomColor(0.01f, 0.41f));
    }
    if (nextNtRing != ntRing) {
      ntRing = nextNtRing;
      r = new Ring(this, paperSize, ntRing);
      r.setColor(this.getRandomColor(0.42f, 0.99f));
    }
    nturns = nextNturns;
    radius = r.getRadius() - c.getRadius();
    x = semiPaperSize + radius * cosPA;
    y = semiPaperSize + radius * sinPA;
    angVelRatio = -r.getRadius() / c.getRadius();
    calcPeakIndicator();
    c.setOffsetAng(-peakAngle);
    c.init(x, y, a);
    c.setPenColor(lineCol);
  }
}

void handleSliderEvents(GSlider slider) {
  if (slider == sdrSpeed)
    speed = 0.1f * slider.getValuef();
  else if (slider == sdrNtRing)
    nextNtRing = slider.getValue();
  else if (slider == sdrNtCog)
    nextNtCog = slider.getValue();
  nextNturns = nextNtCog / gcd(nextNtRing, nextNtCog);
}

// Get 'greatest common divisor'
int gcd(int a, int b) {
  if (a == b)
    return a;
  if (a > b)
    return gcd(a-b, b);
  return gcd(b-a, a);
}

// Get a random colour from the given hue range
int getRandomColor(float startHue, float endHue) {
  float h = startHue + random(1.0f) * (endHue - startHue);
  pushStyle();
  colorMode(HSB, 1.0f, 1.0f, 1.0f);
  int c = color(h, 1.0f, 0.5f);
  colorMode(RGB, 256, 256, 256);
  popStyle();
  return c;
}


