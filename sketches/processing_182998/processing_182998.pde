

int xpos, ypos;
int xhradi, yhradi;
int xstefna, ystefna;

void setup() {
  size(400, 300);
  frameRate(11);
  xpos = 111;
  ypos = 111;
  xhradi = 3;
  yhradi = 3;
  xstefna = 1;
  ystefna = 1;
}

void draw() { 
  andlit(xpos, ypos);
  xpos = xpos + xhradi * xstefna;
  ypos = ypos + yhradi * ystefna;

  if (xpos>width-22 || xpos < 22 ) xstefna = xstefna * -1;
  if (ypos>height-33 || ypos < 33 ) ystefna = ystefna * -1;

  xhradi = mouseX/10;
  yhradi = mouseY/10;
}

void andlit(int x, int y) {
  fill(random(255), random(255), random(255));
  ellipse(x, y, 55, 66);
  fill(random(255));
  ellipse(x+10, y-10, 8, 8);
  fill(random(255));
  ellipse(x-10, y-10, 8, 8);
  fill(255);
}

