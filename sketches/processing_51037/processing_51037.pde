
int veinX = 0;
int veinY = 50;
int veinNewX = 15;
int veinNewY = 45;
int veinVar = 0;
float pupilX = 0;
float pupilY = 0;
float lightX = 0;
float lightY = 0;

void setup() {
  size(640, 480);
  smooth();
  background(255);
  ellipseMode(CENTER);
}
void draw() {
  background(255);
  pupilX = map(mouseX, 0, width, -25, 25);
  pupilY = map(mouseY, 0, height, -20, 20);
  lightX = map(mouseX, 0, width, 0, 2);
  lightY = map(mouseY, 0, height, 0, 2);
  pushMatrix();
  translate(210, 240);
  outline();
  iris();
  pupil();
  eyelid();
  eyebrow();
  popMatrix();
  pushMatrix();
  translate(430, 240);
  outline();
  iris();
  pupil();
  eyelid();
  eyebrow();
  popMatrix();
}

void outline() {
  fill(255);
  stroke(0);
  ellipse(0, 0, 100, 100);
}
void iris() {
  stroke(0);
  fill(#71A544);
  ellipse(pupilX, pupilY, 50, 50);
}
void pupil() {
  fill(0);
  ellipse(pupilX, pupilY, 25, 25);
  fill(255);
  noStroke();
  ellipse(pupilX + 5 - lightX, pupilY - 7 - lightY, 3, 7);
}
void eyelid() {
  fill(255);
  noStroke();
  beginShape();
  vertex(-55, -100);
  vertex(-55, 0);
  bezierVertex(-50, -40, 50, -40, 55, 0);
  vertex(55, -100);
  endShape();
  beginShape();
  vertex(-55, 100);
  vertex(-55, 0);
  bezierVertex(-50, 40, 50, 40, 55, 0);
  vertex(55, 100);
  endShape();
  stroke(0);
  noFill();
  ellipse(0, 0, 110, 60);
}
void eyebrow() {
  curve(-100, 0, -50, -40, 50, -40, 100, 0);
  for (int i = 0; i <= 50; i++) {
    float t = i / 50.0;
    float x = curvePoint(-100, -50, 50, 100, t);
    float y = curvePoint(0, -40, -40, 0, t);
    float tx = curveTangent(-100, -50, 50, 100, t);
    float ty = curveTangent(0, -40, -40, 0, t);
    float a = atan2(ty, tx);
    a -= PI/2.0;
    line(x, y, cos(a)*8 + x, sin(a)*8 + y);
  }
}

