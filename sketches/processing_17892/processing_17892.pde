
ColorClock colorClock;


void setup() {
  size(600, 450);
  colorMode(RGB, 256);
  //noStroke();
  smooth();
  colorClock = new ColorClock(100, -50, 0, 50, 200);
}


void draw() {
  background(0);
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

    //背景(後)
    background(r, g, b);

    //背景(前)
    noStroke();
    fill(204);
    rect(width/2, height/2, width/6 *5, height/2);

    //設定
    rectMode(CENTER);
    //textAlign(CENTER);
    textSize(18);

    pushMatrix();
    translate(width/3, height/2);

    //カラーパネル左
    fill(255);
    stroke(0);
    rect(-75, -25, 50, 50);
    rect(-75, -25, 25, 25);

    fill(r, g, b);
    rect(-100, -50, 50, 50);

    stroke(255, 0, 0);
    line(-50, -50, -100, 0);

    //カラーパネル中
    stroke(0);    
    //時
    fill(255, 0, 0);    
    rect(x, ry, wide, 10);
    //分
    fill(0, 255, 0);
    rect(x, gy, wide, 10);
    //秒
    fill(0, 0, 255);
    rect(x, by, wide, 10);
    //タブ
    noFill();
    triangle(hs, ry +5, hs +8, ry +15, hs -8, ry +15);
    triangle(ms, gy +5, ms +8, gy +15, ms -8, gy +15);
    triangle(ss, by +5, ss +8, by +15, ss -8, by +15);

    //カラーパネル右    
    fill(255);
    rect(wide +40, ry, 40, 20);
    rect(wide +40, gy, 40, 20);
    rect(wide +40, by, 40, 20);

    //文字
    fill(0);
    text("H", -30, ry +5);
    text(h, wide +25, ry +6);
    text("M", -30, gy +5);
    text(m, wide +25, gy +6);
    text("S", -30, by +5);
    text(s, wide +25, by +6);  

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
                
