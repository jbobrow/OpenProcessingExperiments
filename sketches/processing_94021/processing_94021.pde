
wave w[] = new wave[100];

void setup() {
  size(1000, 750);
  smooth();

  for (int i = 0; i < w.length; i++) {
    w[i] = new wave(i);
  }
} 

void draw() {
  background(20);

  for (int i = 0; i < w.length; i++) {
    w[i].looking();
  }
}

class wave {

  float r;      //半徑
  int rr;        //半徑擴大判斷 
  int num;           //編號
  float n;        //號碼牌
  float speed;      //波速
  float x;          //x座標
  float y;          //y座標
  float c;          //線條顏色
  float cc;         //線條顏色遞減速率
  int m;            //首次點擊判斷開關
  float e = 3;          //號碼牌速率參數

  wave(int i) {
    num = i;
    n = 0;
  }

  void looking() {
    fill(255, 0);
    strokeWeight(3);
    stroke(255, 209, 249, 255 - c);
    ellipse(x, y, r, r);

    if (mousePressed) {        //點滑鼠啟動
      if (m == 0) {           
        rr = 1;
        n += (e - n%e);
        m = 1;
      }
      else {
        rr = 1;
        n++;
      }
    }
    else {
      m = 0;
    }

    if (rr == 1 && n/e == num && speed == 0 ) {    
      x = mouseX;
      y = mouseY;
      speed = 5;
      cc = 3.5;
    }

    if (c > 255) {         //還原
      r = 0;
      speed = 0;
      rr = 0;
      cc = 0;
      c = 0;
    }

    if (n/e >= w.length - 1) {     //號碼牌歸零
      n = 0;
    } 

    c+=cc;
    r+=speed;
  }
}


