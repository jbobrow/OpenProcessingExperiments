
CircleClock circleClock;


void setup() {
  size(400, 300);
  colorMode(RGB, 256);
  smooth();
  circleClock = new CircleClock(width/4 + 40, height/2, width/5 * 4 - 5, height/5, 40);
}


void draw() {
  circleClock.getTime();
  circleClock.display();
}


class CircleClock extends Clock {
  float x, y, xx, yy, d;

  CircleClock(float _x, float _y, float _xx, float _yy, float _d) {
    x = _x;
    y = _y;
    xx = _xx;
    yy = _yy;
    d = _d;
  }

  void getTime() {
    super.getTime();
  }

  void display() {
    //文字の設定
    textAlign(CENTER);
    fill(255);
    
    //背景の色
    switch(h) {
    case 1:
      background(208, 90, 110);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("010", 0, 0);
      translate(0, 70);
      textSize(25);
      text("今", 0, 0);
      translate(0, 40);
      text("様", 0, 0);
      translate(0, 60);
      textSize(12);
      text("IMAYOH", 0, 0);
      popMatrix();
      break;
    case 2:
      background(177, 150, 147);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("020", 0, 0);
      translate(0, 70);
      textSize(25);
      text("桜", 0, 0);
      translate(0, 40);
      text("鼠", 0, 0);
      translate(0, 60);
      textSize(12);
      text("SAKURANEZUMI", 0, 0);
      popMatrix();
      break;
    case 3:
      background(85, 66, 54);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("030", 0, 0);
      translate(0, 70);
      textSize(25);
      text("黒", 0, 0);
      translate(0, 40);
      text("鳶", 0, 0);
      translate(0, 60);
      textSize(12);
      text("KUROTOBI", 0, 0);
      popMatrix();
      break;
    case 4:
      background(133, 72, 54);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("040", 0, 0);
      translate(0, 70);
      textSize(25);
      text("檜", 0, 0);
      translate(0, 40);
      text("皮", 0, 0);
      translate(0, 60);
      textSize(12);
      text("HIWADA", 0, 0);
      popMatrix();
      break;
    case 5:
      background(114, 73, 56);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("050", 0, 0);
      translate(0, 55);
      textSize(25);
      text("百", 0, 0);
      translate(0, 35);
      text("塩", 0, 0);
      translate(0, 35);
      text("茶", 0, 0);
      translate(0, 45);
      textSize(12);
      text("MOMOSHIOCHA", 0, 0);
      popMatrix();
      break;
    case 6:
      background(240, 169, 134);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("060", 0, 0);
      translate(0, 90);
      textSize(25);
      text("宍", 0, 0);
      translate(0, 75);
      textSize(12);
      text("SHISHI", 0, 0);
      popMatrix();
      break;
    case 7:
      background(225, 166, 121);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("070", 0, 0);
      translate(0, 55);
      textSize(25);
      text("赤", 0, 0);
      translate(0, 35);
      text("白", 0, 0);
      translate(0, 35);
      text("橡", 0, 0);
      translate(0, 45);
      textSize(12);
      text("AKASHIROTSURUBAMI", 0, 0);
      popMatrix();
      break;
    case 8:
      background(236, 184, 138);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("080", 0, 0);
      translate(0, 70);
      textSize(30);
      text("薄", 0, 0);
      translate(0, 40);
      text("柿", 0, 0);
      translate(0, 60);
      textSize(12);
      text("USUGAKI", 0, 0);
      popMatrix();
      break;
    case 9:
      background(130, 102, 58);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("090", 0, 0);
      translate(0, 55);
      textSize(25);
      text("銀", 0, 0);
      translate(0, 35);
      text("煤", 0, 0);
      translate(0, 35);
      text("竹", 0, 0);
      translate(0, 45);
      textSize(12);
      text("GINSUSUTAKE", 0, 0);
      popMatrix();
      break;
    case 10:
      background(220, 184, 121);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("110", 0, 0);
      translate(0, 70);
      textSize(25);
      text("白", 0, 0);
      translate(0, 40);
      text("橡", 0, 0);
      translate(0, 60);
      textSize(12);
      text("SHOROTSURUBAMI", 0, 0);
      popMatrix();
      break;
    case 11:
      background(239, 187, 36);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("110", 0, 0);
      translate(0, 70);
      textSize(25);
      text("鬱", 0, 0);
      translate(0, 40);
      text("金", 0, 0);
      translate(0, 60);
      textSize(12);
      text("UKON", 0, 0);
      popMatrix();
      break;
    case 12:
      background(98, 89, 44);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("120", 0, 0);
      translate(0, 55);
      textSize(25);
      text("海", 0, 0);
      translate(0, 35);
      text("松", 0, 0);
      translate(0, 35);
      text("茶", 0, 0);
      translate(0, 45);
      textSize(12);
      text("MIRUCHA", 0, 0);
      popMatrix();
      break;
    case 13:
      background(147, 150, 80);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("130", 0, 0);
      translate(0, 70);
      textSize(25);
      text("柳", 0, 0);
      translate(0, 40);
      text("茶", 0, 0);
      translate(0, 60);
      textSize(12);
      text("YANAGICHA", 0, 0);
      popMatrix();
      break;
    case 14:
      background(181, 202, 160);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("150", 0, 0);
      translate(0, 70);
      textSize(25);
      text("裏", 0, 0);
      translate(0, 40);
      text("柳", 0, 0);
      translate(0, 60);
      textSize(12);
      text("URAYANAGI", 0, 0);
      popMatrix();
      break;
    case 15:
      background(93, 172, 129);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("150", 0, 0);
      translate(0, 70);
      textSize(25);
      text("若", 0, 0);
      translate(0, 40);
      text("竹", 0, 0);
      translate(0, 60);
      textSize(12);
      text("WAKATAKE", 0, 0);
      popMatrix();
      break;
    case 16:
      background(9, 97, 72);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("160", 0, 0);
      translate(0, 55);
      textSize(22);
      text("ビ", 0, 0);
      translate(0, 25);
      text("ロ", 0, 0);
      translate(0, 25);
      text("ウ", 0, 0);
      translate(0, 25);
      text("ド", 0, 0);
      translate(0, 45);
      textSize(12);
      text("VELUDO", 0, 0);
      popMatrix();
      break;
    case 17:
      background(48, 90, 86);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("170", 0, 0);
      translate(0, 55);
      textSize(22);
      text("高", 0, 0);
      translate(0, 25);
      text("麗", 0, 0);
      translate(0, 25);
      text("納", 0, 0);
      translate(0, 25);
      text("戸", 0, 0);
      translate(0, 45);
      textSize(12);
      text("KORAINANDO", 0, 0);
      popMatrix();
      break;
    case 18:
      background(0, 137, 167);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("180", 0, 0);
      translate(0, 70);
      textSize(25);
      text("新", 0, 0);
      translate(0, 40);
      text("橋", 0, 0);
      translate(0, 60);
      textSize(12);
      text("SHINBASHI", 0, 0);
      popMatrix();
      break;
    case 19:
      background(0, 98, 132);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("190", 0, 0);
      translate(0, 90);
      textSize(25);
      text("縹", 0, 0);
      translate(0, 75);
      textSize(12);
      text("HANADA", 0, 0);
      popMatrix();
      break;
    case 20:
      background(110, 117, 164);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("200", 0, 0);
      translate(0, 70);
      textSize(25);
      text("藤", 0, 0);
      translate(0, 40);
      text("鼠", 0, 0);
      translate(0, 60);
      textSize(12);
      text("FUJINEZUMI", 0, 0);
      popMatrix();
      break;
    case 21:
      background(143, 119, 181);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("210", 0, 0);
      translate(0, 70);
      textSize(25);
      text("紫", 0, 0);
      translate(0, 40);
      text("苑", 0, 0);
      translate(0, 60);
      textSize(12);
      text("SHION", 0, 0);
      popMatrix();
      break;
    case 22:
      background(87, 76, 87);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("220", 0, 0);
      translate(0, 55);
      textSize(25);
      text("藤", 0, 0);
      translate(0, 35);
      text("煤", 0, 0);
      translate(0, 35);
      text("竹", 0, 0);
      translate(0, 45);
      textSize(12);
      text("FUJISUSUTAKE", 0, 0);
      popMatrix();
      break;
    case 23:
      background(86, 46, 55);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("230", 0, 0);
      translate(0, 70);
      textSize(25);
      text("似", 0, 0);
      translate(0, 40);
      text("紫", 0, 0);
      translate(0, 60);
      textSize(12);
      text("NISEMURASAKI", 0, 0);
      popMatrix();
      break;
    case 0:
      background(112, 124, 116);
      pushMatrix();
      translate(xx, yy);
      textSize(12);
      text("240", 0, 0);
      translate(0, 55);
      textSize(25);
      text("利", 0, 0);
      translate(0, 35);
      text("休", 0, 0);
      translate(0, 35);
      text("鼠", 0, 0);
      translate(0, 45);
      textSize(12);
      text("RIKYUNEZUMI", 0, 0);
      popMatrix();
      break;
    }
    
    //色の設定
    fill(255, 80);
    
    //盤
    noStroke();
    for(int i = 0; i < 12; i++) {
      pushMatrix();
      translate(x, y);
      rotate(TWO_PI/12 * i);
      ellipse(0, -80, d, d);
      popMatrix();
    }

    //時
    pushMatrix();
    translate(x, y);
    rotate(h * TWO_PI/12);
    noStroke();
    ellipse(0, - 80, d + 10, d + 10);
    popMatrix();

    //分    
    pushMatrix();
    translate(x, y);
    rotate(floor(m/5) * TWO_PI/12);
    textSize(24);
    noStroke();   
    for(int i = 0; i < 2; i++) {
      ellipse(0, - 80, d, d);
    }
    text(m, 0, -50);
    popMatrix();

    //秒    
    pushMatrix();
    translate(x, y);
    rotate(floor(s/5) * TWO_PI/12); //5秒ごと
    //rotate(s/5.0 * TWO_PI/12); //1秒ごと
    noStroke();
    for(int i = 0; i < 4; i++) {
      ellipse(0, - 80, d, d);
    }
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
