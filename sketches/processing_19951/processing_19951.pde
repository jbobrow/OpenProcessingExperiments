
ColorClock colorClock;
PImage myPanel;


void setup() {
  size(800, 600);
  colorMode(RGB, 256);
  smooth();
  myPanel = loadImage("http://s3.amazonaws.com/data.tumblr.com/tumblr_lfzgkmQRsI1qbmd9do1_1280.png?AWSAccessKeyId=0RYTHV9YYQ4W5Q3HQMG2&Expires=1297740799&Signature=YVLkZbUXMGf7p7O24JfpZZTg590%3D");
  colorClock = new ColorClock(100, -1, 21, 43, 100);
}


void draw() {
  colorClock.getTime();
  colorClock.display();
}


class ColorClock extends Clock {
  float x, ry, gy, by, wide;

  ColorClock(float _x, float _ry, float _gy, float _by, float _wide) {
    x = _x;
    ry = _ry;
    gy = _gy;
    by = _by;
    wide = _wide;
  }

  void getTime() {
    super.getTime();
  }

  void display() {
    int r = int(map(h, 0, 23, 0, 255));
    int g = int(map(m, 0, 59, 0, 255));
    int b = int(map(s, 0, 59, 0, 255));

    int hs = int(map(h, 0, 23, 0, wide));
    int ms = int(map(m, 0, 59, 0, wide));
    int ss = int(map(s, 0, 59, 0, wide));

    //背景
    background(r, g, b);
    image(myPanel, 0, 0);

    //設定
    textSize(10);
    
    pushMatrix();
    translate(637, 102);
    
    //タブ
    triangle(hs, ry, hs +4, ry +4, hs -4, ry +4);
    triangle(ms, gy, ms +4, gy +4, ms -4, gy +4);
    triangle(ss, by, ss +4, by +4, ss -4, by +4);

    //文字
    fill(0);
    text("H", -13, ry);
    text(h, 111, ry -1);
    text("M", -13, gy);
    text(m, 111, gy -1);
    text("S", -13, by);
    text(s, 111, by -1);
    
    popMatrix();
  }
}


class Clock {
  int h, m, s;
  Clock() {
  }

  void getTime() {
    h = hour();
    m = minute();
    s = second();
  }
}
                                                
