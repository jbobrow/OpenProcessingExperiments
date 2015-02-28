
PImage jack, cc, bat, sky;
float x, y;

void setup() {
  size(800, 800);
  smooth();
  jack = loadImage("jack.png");
  cc = loadImage("cc.png");
  bat = loadImage("bat.png");
  sky = loadImage("sky.png");
  imageMode(CENTER);
}

void draw() {
  image(sky, width/2, height/2);
  float mx = map(mouseX, 0, width, 0, 250);
  float ma = map(mouseX, 0, width, 45, 1);
  drawShape(jack, ma, mx);
  drawShape(bat, 30, mx+20);
  drawShape(cc, ma/2, mx+10);
}

void drawShape(PImage _img, float _max, float _mx) {
  pushMatrix();
  translate(width/2, height/2);
  for (float ang=0;ang<360-_max;ang+=_max) {
    x = _mx * cos(radians(ang));
    y = _mx * sin(radians(ang));
    rotate(radians(ang));
    image(_img, x, y);
  }
  popMatrix();
}


