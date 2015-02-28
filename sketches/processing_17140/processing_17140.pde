
CircleClock circleClock;


void setup() {
  size(320, 240);
  colorMode(RGB, 256);
  smooth();
  circleClock = new CircleClock(width/2, height/2);
}


void draw() {
  background(0);
  circleClock.getTime();
  circleClock.display();
}


class CircleClock extends Clock {
  float x, y;

  CircleClock(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void getTime() {
    super.getTime();
  }

  void display() {
    //背景の色
    switch(h) {
    case 12:
      background(255, 255, 0);
      break;
    case 13:
      background(204, 255, 0);
      break;
    case 14:
      background(0, 255, 0);
      break;
    case 15:
      background(0, 255, 170);
      break;
    case 16:
      background(0, 255, 255);
      break;
    case 17:
      background(0, 0, 255);
      break;
    case 6:
      background(85, 0, 170);
      break;
    case 7:
      background(170, 0, 170);
      break;
    case 8:
      background(255, 0, 255);
      break;
    case 9:
      background(255, 0, 0);
      break;
    case 10:
      background(255, 85, 0);
      break;
    case 11:
      background(255, 170, 0);
      break;
    default:
      background(0);
      break;
    }    

    //色の設定
    switch(h) {
    case 0:
      fill(255, 255, 0, 80);
      break;
    case 1:
      fill(204, 255, 0, 80);
      break;
    case 2:
      fill(0, 255, 0, 80);
      break;
    case 3:
      fill(0, 255, 170, 80);
      break;
    case 4:
      fill(0, 255, 255, 80);
      break;
    case 5:
      fill(0, 0, 255, 80);
      break;
    case 18:
      fill(85, 0, 170, 80);
      break;
    case 19:
      fill(170, 0, 170, 80);
      break;
    case 20:
      fill(255, 0, 255, 80);
      break;
    case 21:
      fill(255, 0, 0, 80);
      break;
    case 22:
      fill(255, 85, 0, 80);
      break;
    case 23:
      fill(255, 170, 0, 80);
      break;
    default:
      fill(0, 80);
      break;
    }

    //盤
    noStroke();
    for(int i = 0; i < 12; i++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(TWO_PI/12 * i);
      ellipse(0, -80, 40, 40);
      popMatrix();
    }


    //文字の設定
    textAlign(CENTER);

    //時
    pushMatrix();
    translate(width/2, height/2);
    rotate(h * TWO_PI/12);
    textSize(36);
    noStroke();
    //fill(0, 0, 255, 50);
    ellipse(0, - 80, 50, 50);
    //fill(0, 0, 200, 100);
    //text(h, 0, -20);
    popMatrix();

    //分    
    pushMatrix();
    translate(width/2, height/2);
    rotate(floor(m/5) * TWO_PI/12);
    textSize(24);
    noStroke();
    //fill(0, 0, 255, 150);    
    ellipse(0, - 80, 40, 40);
    ellipse(0, - 80, 40, 40);
    text(m, 0, -50);
    popMatrix();

    //秒    
    pushMatrix();
    translate(width/2, height/2);
    rotate(floor(s/5) * TWO_PI/12); //5秒ごと
    //rotate(s/5.0 * TWO_PI/12); //1秒ごと
    textSize(18);
    noStroke();
    //fill(0, 0, 255, 200);
    ellipse(0, - 80, 40, 40);
    ellipse(0, - 80, 40, 40);
    ellipse(0, - 80, 40, 40);
    //text(s, 0, -80);
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
