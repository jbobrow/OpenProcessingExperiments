
float theta;
void setup() {
  size(400, 400, P3D);
}

void draw() {
  background (0);
  theta +=0.01;
  translate (200, 200, 0);
  rotateX(theta);
  // rotateY(theta);
  rotateZ(theta);
  drawCube(50);
   translate (50, 50, 0);
  rotateX(theta);
  rotateY(theta);
  // rotateZ(theta);
  drawCube(50);
     translate (30, 30, 0);
  // rotateX(theta);
  rotateY(theta);
  rotateZ(theta);
  drawCube(50);
}

void drawCube( int t) {
  stroke(0);

  beginShape(QUADS);
  fill(255, random(100, 150), 50);
  vertex(0, 0, 0);
  vertex(0, 0, t);
  vertex(-t, 0, t);
  vertex(-t, 0, 0);

  vertex(-t, -t, 0);
  vertex(0, -t, 0);
  vertex(0, -t, t);
  vertex(-t, -t, t);

  fill(random(100, 150), 50, 255);
  vertex(0, 0, 0);
  vertex(0, -t, 0);
  vertex(0, -t, t);
  vertex(0, 0, t);

  vertex(-t, -t, 0);
  vertex(-t, 0, 0);
  vertex(-t, 0, t);
  vertex(-t, -t, t);

  fill(50, 255, random(100, 150));
  vertex(0, 0, 0);
  vertex(0, -t, 0);
  vertex(-t, -t, 0);
  vertex(-t, 0, 0);

  vertex(0,-t,t);
  vertex(0,0,t);
  vertex(-t, 0, t);
  vertex(-t, -t, t);

  endShape();
}


