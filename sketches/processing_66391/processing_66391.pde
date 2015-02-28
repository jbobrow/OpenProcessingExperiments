
float rotx = PI/4;
float roty = PI/4;

void setup() {
  size(500, 500, P3D);
  background(255);
  colorMode(HSB);
  PFont font;
  font = loadFont("ArialMT-12.vlw");
  textFont(font);
  fill(0);
  String s = "Click to clear the canvas.";
  text(s, 15, 20, 740, 70);
}

void draw() {
  noStroke();
  translate(width/2.0, height/2.0, -100);
  rotateX(rotx);
  rotateY(roty);
  scale(150);
  // Front
  beginShape(QUADS);
  fill(255);

  vertex(-1, -1, 1);
  vertex( 1, -1, 1);
  vertex( 1, 1, 1);
  vertex(-1, 1, 1);
  endShape();
  // Back
  beginShape(QUADS);
  fill(255, 255, 0);
  vertex( 1, -1, -1);
  vertex(-1, -1, -1);
  vertex(-1, 1, -1);
  vertex( 1, 1, -1);
  endShape();
  // Bottom
  beginShape(QUADS);
  fill(255, 0, 255);
  vertex(-1, 1, 1);
  vertex( 1, 1, 1);
  vertex( 1, 1, -1);
  vertex(-1, 1, -1);
  endShape();
  // Top
  beginShape(QUADS);
  fill(0, 255, 0);
  vertex(-1, -1, -1);
  vertex( 1, -1, -1);
  vertex( 1, -1, 1);
  vertex(-1, -1, 1);
  endShape();
  // Right
  beginShape(QUADS);
  fill(0, 255, 255);
  vertex( 1, -1, 1);
  vertex( 1, -1, -1);
  vertex( 1, 1, -1);
  vertex( 1, 1, 1);
  endShape();
  // Left
  beginShape(QUADS);
  fill(0, 0, 255);
  vertex(-1, -1, -1);
  vertex(-1, -1, 1);
  vertex(-1, 1, 1);
  vertex(-1, 1, -1);
  endShape();
  if (mousePressed) {
      background(255);
    }
  }
void mouseMoved() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}


