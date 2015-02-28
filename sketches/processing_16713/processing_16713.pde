
InemuriClock inemuriClock;

void setup() {
  size(480, 360);
  noStroke();
  smooth();
  frameRate(30);
  inemuriClock = new InemuriClock(width, -height * 10, 0.2);
}

void draw() {
  inemuriClock.getTime();
  inemuriClock.display();
  inemuriClock.move();
}

class InemuriClock extends Clock {
  float x, y, speed;
    
  InemuriClock(float _x, float _y, float _speed) {
    x = _x;
    y = _y;   
    speed = _speed;
  }
    
  void getTime() {
    super.getTime();
  }
  
  void display() {
    //時計（右上）
    background(255);
    fill(0);
    textSize(30);
    String t = h + "じ" + m10 + "0" + "ぷん" + "くらい";
    text (t, width - 270, height - 20);
    
    //瞼
    fill(0);
    rect(0, y, width, height * 9);
    
    //時計（左上）
    fill(44);
    textSize(10);
    text (t, 10, 20);
    
    //瞼
    fill(255);
    textSize(20);
    text("twitterによる「ねむい」のリアルタイムな検索結果が流れ始める " +
         "account1: ねむいおはざいます　" +
         "account2: ねむいし寒いからとりあえず布団にはいろ　" +
         "account3: すでにねむいなう。。おやすみ。。z　" +
         "account4: めっちゃ寝てた。三時間くらい爆睡してた、でもまだ、ねむい・・・んあー　" +
         "account5: うおおおおーねむい！　ねたはずなのに！　" +
         "account6: 帰りました。そしてねむいよ。　" +
         "account7: ビデオみようと思ったら、ネットの調子が悪いからやーめた。もうねむい　" +
         "account8: ふう、ねむいや、サイモーン！　・・・",
         x + 900 * 2, height/2);
    x = x - 0.5;
    if(x < - 900 * 8) x = width;
  }
  
  void move() {
    y = y + speed;
    if(y > 0) y = -height * 10;
  }
}

class Clock {
  int h, m, s, m10;
  Clock() {
  }
  
  void getTime() {
    h = hour();
    m = minute();
    m10 = int(m / 10); // 分の10の位
    s = second();
  }
}
                                                                
