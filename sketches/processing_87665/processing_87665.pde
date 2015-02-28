
float a;
float b;
float c;
float d;
float e;
int i;

void setup() {
  size(640, 480);
  smooth();
  noStroke();
  frameRate(3);
  background(255);
  i = 0;
}

void draw() {
  if (i == 10) {
    background(255);
    i = 0;
  }

  a = random(0, width);
  b = random(mouseX, width);
  c = random(0, height);
  d = random(mouseY, height);

  fill(random(0, 255), random(0, 255), random(0, 255), 40);

  beginShape();
  vertex(a, b);
  vertex(b, c);
  vertex(c, d);
  vertex(d, a);
  endShape();
  
  i++;
}



