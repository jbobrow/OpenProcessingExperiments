
PImage p1, p2, p3, p4;
float x, y;

void setup () {
  size(600, 600);
  smooth();

  p1= loadImage("Picture 2.png");
  p2 = loadImage("cp3.png");
  p3 = loadImage("cp1.png");
  p4 = loadImage("cp6.png");
  imageMode(CENTER);
}


void draw() {
  background(255);
  float px = map(mouseX, 0, width, 0, 245);
  float pa = map(mouseX, 0, width, 45, 1);
  kaleid(p4, pa, px+100);
  kaleid(p1, pa, px+10);
  kaleid(p3, pa, px);
  kaleid(p2, 10, px-100);
}

void kaleid(PImage _img, float _max, float _px) {
  pushMatrix();
  translate(width/2, height/2);
  for (float ang=0;ang<360-_max;ang+=_max) {
    x = _px * cos(radians(ang));
    y = _px * sin(radians(ang));
    rotate(radians(ang));
    image(_img, x, y);
  }
  popMatrix();
}


