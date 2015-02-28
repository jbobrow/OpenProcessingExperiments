
AnalogClock analogClock;
PImage train1;

void setup() {
  size(500, 500);
  smooth();
  analogClock = new AnalogClock(width/2, height/2);
  //画像ファイル設定
  train1 = loadImage("train1.png");
}

void draw() {
  background(255);
  analogClock.getTime();
  analogClock.display();
}

class AnalogClock extends Clock {
  float x, y;

  AnalogClock(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void getTime() {
    super.getTime();
  }

  void display() {
    //盤
    println(train1.width); //画像の幅をコンソールに表示
    println(train1.height); //画像の高さをコンソールに表示
    image(train1, (width - train1.width) / 2, (height - train1.height) / 2);
    //針の色
    stroke(0);
    //時
    pushMatrix();
    translate(width/2, height/2);
    rotate((h + m/60.0) % 12 * TWO_PI/12);
    strokeWeight(6);
    line(0, 0, 0, -100);
    popMatrix();
    //分
    pushMatrix();
    translate(width/2, height/2);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(3);
    line(0, 0, 0, -120);
    popMatrix();
    //秒
    pushMatrix();
    translate(width/2, height/2);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    line(0, 0, 0, -120);
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


