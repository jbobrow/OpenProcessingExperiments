
float angle=0;
float scalar =150;
float r = random(10);

void fireworks(float x, float y, float w)
{
  pushMatrix();
  r= random(10);
  translate(x, y);
  for (int j=0; j<300; j++)
  {
    rotate(angle += 0.03);
    line(0, w + 15*r, 0, -w -15*r);
  }
  popMatrix();
}

void setup() {
  size(600, 600);
  background(0);
  smooth();
}

void draw() {
  if (mousePressed) {
    stroke(random(256), random(256), random(256), random(100));
    fireworks(mouseX, mouseY, 10);
  }
}


void keyPressed() {
  background(0);
}


