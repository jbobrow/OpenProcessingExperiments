
void setup() {
  size(600,600);
  background(255);
  smooth();
  frameRate(12);
}

void draw() {
  beginShape();
  noStroke();
  fill(random(150), random(150), random(150), 45);
  float a = random(600);
  float b = random(300);
  float r = random(300,550);
  float q = random(250,450);
  vertex(a, b);
  bezierVertex(200,100,100,200,450,300);
  bezierVertex(r,q,450,200,a,b);
endShape();
}

void mousePressed() {
  stroke(50);
  exit ();
}

