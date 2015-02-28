
void setup () {
  size (800,200);
  background (#ffd43d);
  noStroke();
  smooth();
}

void draw() {
  noLoop();
  pot();
  plant();
}

int x = -150;
int y = -100;

void pot () {
  pushMatrix();
  translate(x,y);
  fill(255);
  quad (208,214, 262,214, 256,229, 214,229);
  quad (218,229, 223,254, 249,254, 253,229);
  popMatrix();
}

void plant () {
  pushMatrix();
  translate(x,y);
  stroke(255);
  strokeWeight(3);
  line (221,168,224,213);
  line (235,164,238,213);
  line (255,168,248,213);
  line (240,168,245,213);
  popMatrix();
}


