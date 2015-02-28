
Bingo bi;//オブジェクトを宣言

int bingo[][] = new int[5][5];

void setup() {
  bi = new Bingo(50, 50);//オブジェクトを生成（構築）
  size(300, 400);
  colorMode(HSB, 100);
  background(100);
  textAlign(CENTER);

  smooth();
  //frameRate(1);
}

void draw() {
  fill(0);
  textSize(20);
  bi.getTime();
  bi.display();
  //下部
  fill(100);
  noStroke();
  rect(0, 260, 300, 400); //背景
  int s = second();
  int m = minute();
  int h = hour();
  String t = h + ":" + nf(m, 2) + ":" + nf(s, 2);
  fill(0);
  textSize(40);
  text (t, 150, 350);//時計
}      


//Bingoクラスを定義
class Bingo extends Clock {
  //属性を定義
  int x, y; // x座標, y座標

  //コンストラクタを定義
  Bingo(int _x, int _y) {
    x = _x;
    y = _y;
  }

  void getTime() {
    super.getTime();
  }

  //表示するメソッドを定義
  void display() {
    //キーを押すとビンゴの数字が表示される
    if (keyPressed == true) {
      //背景
      fill(100);
      noStroke();
      rect(25, 25, 240, 240);
      //数字
      //配列にランダムな数字を入れる
      for(int j = 0; j < 5 ; j++) {
        for(int i = 0; i < 5 ; i++) {
          bingo[j][i]=int(random(59));
        }
      }
      //上で入れた数字を５×５で表示
      for(int i = 0; i < 5; i++) {
        for(int j = 0; j < 5; j++) {
          fill(2);
          text (bingo[i][j], bi.x+i*bi.x, bi.y+j*bi.y);
        }
      }
    }

    //マウスをクリックすると時間と同じ数字が塗りつぶされる
    if (mousePressed == true) {
      fill(0);
      for(int i = 0; i < 5 ; i++) {
        for(int j = 0; j < 5 ; j++) {
          if (bingo[i][j] == h || bingo[i][j] == m || bingo[i][j] == s) {
            ellipse(bi.x+i*bi.x,  bi.y-8+j*bi.y, 30, 30);
          }
        }
      }
    }

    //println(bingo[j][i]);
    //println(h + ":" + m + ":" + s);
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

