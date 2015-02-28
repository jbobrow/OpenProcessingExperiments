
//globals
int x, y;
int scale = 3;
ArrayList coordinates = new ArrayList();

void setup() {
  size(500, 500);
  smooth(8);
}

void draw() {
  int red = (int) random(0, 255);
  background(red, 0, 0);
  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 6; j++) {
      pushMatrix();
      translate((width/5*i), height/5*j);
      rotate(1*i);
      drawStamp(0, 0, 3);
      popMatrix();
    }
  }
}

void drawStamp(int x, int y, int scale) {
  fill(0);

  beginShape();
  vertex(x, y-10*scale);
  vertex(x+8*scale, y-8*scale);
  vertex(x+10*scale, y);
  vertex(x+6*scale, y+5*scale);
  vertex(x+4*scale, y+10*scale);
  vertex(x+2*scale, y+13*scale);
  //
  vertex(x-2*scale, y+13*scale);
  vertex(x-4*scale, y+10*scale);
  vertex(x-6*scale, y+5*scale);
  vertex(x-10*scale, y);
  vertex(x-8*scale, y-8*scale);
  vertex(x, y-10*scale);
  endShape(CLOSE);

  beginShape();
  vertex(x+2*scale, y-7*scale);
  vertex(x+1*scale, y-4*scale);
  vertex(x+7*scale, y-15*scale);
  vertex(x+11*scale, y-5*scale);
  vertex(x+2*scale, y+3*scale);
  endShape(CLOSE);

  beginShape();
  vertex(x-2*scale, y-7*scale);
  vertex(x-1*scale, y-4*scale);
  vertex(x-7*scale, y-15*scale);
  vertex(x-11*scale, y-5*scale);
  vertex(x-2*scale, y+3*scale);
  endShape();

  fill(255);

  ellipse(x+6*scale, y, 2*scale, 2*scale);
  ellipse(x-6*scale, y, 2*scale, 2*scale);

  noFill();
}

void mousePressed() {
  scale = (int) random(1, 5);
  x = mouseX;
  y = mouseY;
  PVector clicked = new PVector(x, y, scale);
  coordinates.add(clicked);
}
