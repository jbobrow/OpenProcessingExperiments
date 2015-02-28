
PImage kermit, frog, banjo;
PImage b;
float x, y;

void setup() {
  size(700, 700);

  kermit = loadImage("banjo.png");
  frog = loadImage("frog.png");
  banjo = loadImage("kermit.png");
  b = loadImage("pond.png");
}

void draw() {
background(b);
float mx = map(mouseX, 0, width, 0, 250);
  float ma = map(mouseX, 0, width, 900, 10);

  drawShape(kermit, ma, mx);
  drawShape(frog, ma/2, mx+10);
  drawShape(banjo, 50, mx+2);
}

void drawShape(PImage _img, float _max, float _mx) {
  pushMatrix();
  translate(width/2, height/2);
  for (float ang=0;ang<350-_max;ang+=_max) {
    x = _mx * cos(radians(ang));
    y = _mx * sin(radians(ang));
    image(_img, x, y);
  }
  popMatrix();
}


