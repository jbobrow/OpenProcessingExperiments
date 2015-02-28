
float angle = 0.0;
float anDir = 0.5;
color c;
boolean begin = false;

void setup() {
  background(0);
  size(400,400);
  smooth();
  strokeWeight(4);
  noCursor();
  colorMode(RGB,2,2,2,256);
  c = color(5);
}

void draw() {
  if (mouseX!=0.0 || mouseY!=0.0) {begin=true;}
  stroke(c, 90);
  translate(mouseX, mouseY);
  rotate(angle);
  if (begin==true) {line(-40, 0, 60, 0);}
  angle += anDir;
}

void mouseClicked() {
  anDir = -anDir;
  int r = int(random(9));
  int g = int(random(9));
  int b = int(random(3));
  c = color(r,g,b);
}


