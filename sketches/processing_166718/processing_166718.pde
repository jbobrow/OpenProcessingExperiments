
float angle;
float jitter;

float r;
float g;
float b;

void setup() {
  size(640, 360, P3D);
  strokeWeight(3);
}

void draw() {
  r = (mouseX/2)+75;
  g = (mouseY/3)+41;
  b =(mouseY+mouseX)/2;
  background(r,g,b);
  bigtri();
  smalltri();
}

void bigtri() {
  pushMatrix();
  translate(width/2, height/2, 0);
  r = mouseX;
  g = mouseY;
  b =(r+g)/2;
  stroke(r/3,g/3,b/3);
  if (second() % 2 == 0) {
    jitter = random(-0.1, 0.1);
  }
  angle = angle + jitter;
  float c = cos(angle);
  rotateY(c);
  rotateX(PI/2);
  
  fill(0);

  beginShape();
  vertex( -100, -100, -100);
  vertex( 100, -100, -100);
  vertex(   0,    0,  100);

  vertex( 100, -100, -100);
  vertex( 100,  100, -100);
  vertex(   0,    0,  100);

  vertex( 100, 100, -100);
  vertex(-100, 100, -100);
  vertex(   0,   0,  100);

  vertex(-100,  100, -100);
  vertex(-100, -100, -100);
  vertex(   0,    0,  100);
  endShape();
  popMatrix();
}

void smalltri(){
  pushMatrix();
  translate(width/2, 240, 0);
  if (second() % 2 == 0) {
    jitter = random(-0.2, 0.2);
  }
  angle = angle + jitter;
  float d = cos(angle);
  rotateY(d*2);
  rotateX(PI/2);
  fill(0);
  
  beginShape();
  vertex( -25, -25, -25);
  vertex( 25, -25, -25);
  vertex(   0,    0,  25);

  vertex( 25, -25, -25);
  vertex( 25,  25, -25);
  vertex(   0,    0,  25);

  vertex( 25, 25, -25);
  vertex(-25, 25, -25);
  vertex(   0,   0,  25);

  vertex(-25,  25, -25);
  vertex(-25, -25, -25);
  vertex(   0,    0,  25);
  endShape();
  popMatrix();
}


