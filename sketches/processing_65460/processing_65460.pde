
PImage b;
int i = 1;
int counter = 0;
int mX = 0, mY = 0;
int[] colorVals = new int[3];
int diameterIncrement = 3;
int backgroundColor = 0;
boolean stopped = false;

void setup() {
  size(800, 1000);
  smooth();
  background(255);

  fill(0, 102, 153);
  text("click around for 1 minute to start, press any key to stop", 15, 60, 80, 80);
}

void draw() {

  if (mousePressed) {
    mX = mouseX;
    mY = mouseY;
    i = 1;
  }

  if (keyPressed) {
    noLoop();
  }

  if (mX == 0 && mY == 0) {
    return;
  }
  if (counter++ > 40) {
    updateColor(255);
    if (counter++ > 400) {
      counter = 0;
      background(backgroundColor = backgroundColor == 255? 0 : 255);
    }
  }

  if (! overCircle(mX, mY, i)) {
    updateColor(255);
  }

  renderEllipses();
}


void updateColor(int opacity) {

  for (int t=0; t<3; t++) {
    colorVals[t] = int(random(255));
  }

  stroke(colorVals[0], colorVals[1], colorVals[2], opacity);
}

void updateWidth() {
  i += diameterIncrement;
}


void renderEllipses() {
  noFill();
  beginShape();
  if (counter % 7 == 0) {
    updateColor(70);
    strokeWeight(int(random(100)) * 0.0001);
    vertex(mX, mY);
    vertex(pmouseX, pmouseY);
    vertex(pmouseX, mY);
    vertex(mX, pmouseY);
    vertex(mX, mY);
  }
  strokeWeight(int(random(1000)) * 0.001);

  ellipse(mX, mY, i, i);
  endShape();
  updateWidth();

  if ( backgroundColor == 255 ) {
    beginShape();
    if (counter % 4 == 0) {
      updateColor(30);
      strokeWeight(int(random(100)) * 0.0001);
      vertex(mX+10, mY+10);
      vertex(pmouseX+10, pmouseY+10);
      vertex(pmouseX+10, mY+10);
      vertex(mX+10, pmouseY+10);
      vertex(mX+10, mY+10);
    }
    strokeWeight(int(random(1000)) * 0.001);

    ellipse(mX+10, mY+10, i, i);
    endShape();
    updateWidth();
  }
}

boolean overCircle(int x, int y, int diameter) 
{
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } 
  else {
    return false;
  }
}


