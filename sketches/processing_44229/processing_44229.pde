


PImage m1, m2, m3;
float x, y;

void setup () {
  size(600, 600);

  m1= loadImage("murakami1.jpg");
  m3 = loadImage("murakami3.jpg");
  m2 = loadImage("murakami2.png");
  imageMode(CENTER);
}


void draw() {
  background(205,227,240);
  float mx = map(mouseX, 0, width, 0, 245);
  float ma = map(mouseX, 0, width, 45, 1);
  kal(m2, ma, mx+10);
  kal(m1, 10, mx);
  kal(m3, ma, mx-100);
}

void kal(PImage _img, float _max, float _mx) {
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


