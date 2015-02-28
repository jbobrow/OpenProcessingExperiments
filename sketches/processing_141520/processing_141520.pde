
int spin = 0;
int fsz= 48;
int offset = 10;
int alph = 125;
int num = 5;
float speed1 = 1;
float speed2 = 1.1;
Xiu[] xius = new Xiu[num];
String phrase = "xiu xiu";
float spoffset = 12;


void setup() {
  size (700, 700);
  colorMode(HSB);
  background(0, 0, 0);
  noStroke();
  textAlign(BASELINE);
  xius[0] = new Xiu(width/4, height/4, 0, fsz);  // 0 +=30
  xius[1] = new Xiu(3*width/4, height/4, 0, fsz);
  xius[2] = new Xiu(width/2, height/2, 0, fsz);
  xius[3] = new Xiu(width/4, 3*height/4, 0, fsz);
  xius[4] = new Xiu(3*width/4, 3*height/4, 0, fsz);
}

void draw() {
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  for (int i = 0; i < num; i++) {
    xius[i].display(spin);
  }
  spinners();
  textAlign(BASELINE);
  spin+=6;
  //saveFrame("frames/####.gif");

}

void spinners() {
  int turn = 1;
  textAlign(CENTER);
  textSize(64);

  if (frameCount % turn == 0) {
    pushMatrix();
    translate(width/2, height/4);
    rotate(radians(spin));
    fill(0, 255, 255);
    text("xiu", 0, 0);
    popMatrix();
  }
  if (frameCount % turn == 0) {
    pushMatrix();
    translate(width/4, height/2);
    rotate(radians(-spin));
    fill(12, 255, 255);
    text ("xiu", 0, 0);
    popMatrix();
  }
  if (frameCount % turn == 0) {
    pushMatrix();
    translate(3*width/4, height/2);
    rotate(radians(-spin));
    fill(24, 255, 255);
    text ("xiu", 0, 0);
    popMatrix();
  }
  if (frameCount % turn == 0) {
    pushMatrix();
    translate(width/2, 3*height/4);
    rotate(radians(spin));
    fill(36, 255, 255);
    text ("xiu", 0, 0);
    popMatrix();
  }
}


class Tumblr {
  float x;
  float y;
  float c;
  int size;
  float speed;

  Tumblr(float _x, float _y, float _c, float _speed, int _size) {
    x = _x;
    y = _y;
    c = _c;
    speed = _speed;
    size = _size;
  }

  void display(int sp) {
    pushMatrix();
    translate(x, y);
    rotate(radians(sp * speed));
    //rotate(radians(sp + speed));
    textSize(size);
    fill(c, 255, 255, alph);
    text(phrase, -96, 0);
    popMatrix();
  }
}

class Xiu {
  Tumblr[] mytumblrs = new Tumblr[4];
  float x;
  float y;
  float c;
  int size;

  Xiu(float _x, float _y, float base_c, int _size) {
    x = _x;
    y = _y;
    c = base_c;
    size = _size;
    mytumblrs[0] = new Tumblr(x+offset, y-offset, c, speed1, _size);
    mytumblrs[1] = new Tumblr(x+offset, y+offset, c+spoffset, -speed1, _size);
    mytumblrs[2] = new Tumblr(x-offset, y-offset, c+2*spoffset, speed2, _size);
    mytumblrs[3] = new Tumblr(x-offset, y+offset, c+3*spoffset, -speed1, _size);
  }

  void display(int sp) {
    for (int i = 0; i < 4; i++) {
      mytumblrs[i].display(sp);
    }
  }
}



