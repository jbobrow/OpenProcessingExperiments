
AnalogClock analogClock;
PImage train, name1, name2, name3, name4, name5, name6, name7, name8, name9, name10,
name11, name12, name13, name14, name15, name16, name17, name18, name19, name20,
name21, name22, name23, name24, name25, name26, name27, name28, name29;

void setup() {
  size(500, 500);
  smooth();
  analogClock = new AnalogClock(width/2, height/2);
  //画像ファイル設定
  train = loadImage("train.png");
  name1 = loadImage("1.png");
  name2 = loadImage("2.png");
  name3 = loadImage("3.png");
  name4 = loadImage("4.png");
  name5 = loadImage("5.png");
  name6 = loadImage("6.png");
  name7 = loadImage("7.png");
  name8 = loadImage("8.png");
  name9 = loadImage("9.png");
  name10 = loadImage("10.png");
  name11 = loadImage("11.png");
  name12 = loadImage("12.png");
  name13 = loadImage("13.png");
  name14 = loadImage("14.png");
  name15 = loadImage("15.png");
  name16 = loadImage("16.png");
  name17 = loadImage("17.png");
  name18 = loadImage("18.png");
  name19 = loadImage("19.png");
  name20 = loadImage("20.png");
  name21 = loadImage("21.png");
  name22 = loadImage("22.png");
  name23 = loadImage("23.png");
  name24 = loadImage("24.png");
  name25 = loadImage("25.png");
  name26 = loadImage("26.png");
  name27 = loadImage("27.png");
  name28 = loadImage("28.png");
  name29 = loadImage("29.png");
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
    println(train.width); //画像の幅をコンソールに表示
    println(train.height); //画像の高さをコンソールに表示
    image(train, (width - train.width) / 2, (height - train.height) / 2);

    if(m == 0) image(name1, (width - name1.width) / 2, (height - name1.height) / 2);
    if(m == 2) image(name2, (width - name2.width) / 2, (height - name2.height) / 2);
    if(m == 3) image(name3, (width - name3.width) / 2, (height - name3.height) / 2);
    if(m == 6) image(name4, (width - name4.width) / 2, (height - name4.height) / 2);
    if(m == 9) image(name5, (width - name5.width) / 2, (height - name5.height) / 2);
    if(m == 12) image(name6, (width - name6.width) / 2, (height - name6.height) / 2);
    if(m == 15) image(name7, (width - name7.width) / 2, (height - name7.height) / 2);
    if(m == 17) image(name8, (width - name8.width) / 2, (height - name8.height) / 2);
    if(m == 18) image(name9, (width - name9.width) / 2, (height - name9.height) / 2);
    if(m == 21) image(name10, (width - name10.width) / 2, (height - name10.height) / 2);
    if(m == 23) image(name11, (width - name11.width) / 2, (height - name11.height) / 2);
    if(m == 25) image(name12, (width - name12.width) / 2, (height - name12.height) / 2);
    if(m == 27) image(name13, (width - name13.width) / 2, (height - name13.height) / 2);
    if(m == 30) image(name14, (width - name14.width) / 2, (height - name14.height) / 2);
    if(m == 32) image(name15, (width - name15.width) / 2, (height - name15.height) / 2);
    if(m == 33) image(name16, (width - name16.width) / 2, (height - name16.height) / 2);
    if(m == 36) image(name17, (width - name17.width) / 2, (height - name17.height) / 2);
    if(m == 37) image(name18, (width - name18.width) / 2, (height - name18.height) / 2);
    if(m == 38) image(name19, (width - name19.width) / 2, (height - name19.height) / 2);
    if(m == 40) image(name20, (width - name20.width) / 2, (height - name20.height) / 2);
    if(m == 42) image(name21, (width - name21.width) / 2, (height - name21.height) / 2);
    if(m == 43) image(name22, (width - name22.width) / 2, (height - name22.height) / 2);
    if(m == 45) image(name23, (width - name23.width) / 2, (height - name23.height) / 2);
    if(m == 47) image(name24, (width - name24.width) / 2, (height - name24.height) / 2);
    if(m == 49) image(name25, (width - name25.width) / 2, (height - name25.height) / 2);
    if(m == 51) image(name26, (width - name26.width) / 2, (height - name26.height) / 2);
    if(m == 53) image(name27, (width - name27.width) / 2, (height - name27.height) / 2);
    if(m == 55) image(name28, (width - name28.width) / 2, (height - name28.height) / 2);
    if(m == 57) image(name29, (width - name29.width) / 2, (height - name29.height) / 2);

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




