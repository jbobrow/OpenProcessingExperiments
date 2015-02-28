
SketchLine[] lines = new SketchLine[100];
PImage src;
int videoFrame = 0;

void setup() {

  src = loadImage("src.jpg");
  
  size(940, 600);
  src.resize(width, height);
  for (int i = 0; i < lines.length; i++) {
    lines[i] = new SketchLine((int) random(5, 40), random(0.1, 0.4), random(0.5, 0.75));
  }
  background(0);
  noFill();
}

void draw() {
  if (mousePressed) { 
    for (int i = 0; i < lines.length; i++) {
      lines[i].render();
    }
    //saveFrameForVideo();
  }
}

void saveFrameForVideo() {
  String index = nf(videoFrame, 5);
  saveFrame("data/video/" + index + ".tif");
  videoFrame++;
}

void mousePressed() {
  for (int i = 0; i < lines.length; i++) {
    lines[i].reset();
  }
}

void keyPressed() {
  if (key == ' ') {
    background(0);
  }
  if (key == 's') {
    String fileName = "data/output/composition-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + ".png";
    save(fileName);
    println("Saved: " + fileName);
  }
}

class  SketchLine {

  int numberOfPoints;
  PVector[] points, deltas, controlPoints;
  float[] easeFactor, speedFactor;

  SketchLine(int _numberOfPoints, float _easeFactor, float _speedFactor) {
    numberOfPoints = _numberOfPoints;
    points = new PVector[numberOfPoints];
    deltas = new PVector[numberOfPoints];
    controlPoints = new PVector[numberOfPoints];
    easeFactor = new float[numberOfPoints];
    speedFactor = new float[numberOfPoints];
    for (int i = 0; i < numberOfPoints; i++) {
      easeFactor[i] = _easeFactor * (0.07 * (i + 1));
      speedFactor[i] = _speedFactor - (0.02 * i);
    }
  }

  void reset() {
    for (int i=0; i < numberOfPoints; i++) {
      points[i] = new PVector(mouseX, mouseY);
      deltas[i] = new PVector();
      controlPoints[i] = new PVector();
    }
  }

  void render() { 
    for (int i = 0; i < numberOfPoints; i++) {
      deltas[i].x = (i == 0) ? mouseX - points[i].x : points[i-1].x - points[i].x;
      deltas[i].y = (i == 0) ? mouseY - points[i].y : points[i-1].y - points[i].y;
      deltas[i].mult(easeFactor[i]);
      controlPoints[i].add(deltas[i]);
      points[i].add(controlPoints[i]);
      controlPoints[i].mult(speedFactor[i]);
    }
    beginShape();
    for (int i = 0; i < numberOfPoints; i++) {
      strokeWeight(1.5);
      stroke(src.get((int) points[i].x, (int) points[i].y), 30);
      if (random(1) > 0.95) stroke(0, 30);
      curveVertex(points[i].x, points[i].y);
    }
    endShape();
  }
}


