
class Flower {
  float x;
  float y;
  float flg;
  float speed;
  float roundness; //花のまるっこさ 0.9 ~ 1.2 あたりが良いかも
  float size; //大きさ
  int val; //花びらの枚数
  float goal; //最終的なサイズ
  float c; //色
  float t;

  Flower(float tmpX, float tmpY, float tmpFlg, float tmpSpeed, float tmpRound, int tmpVal, float tmpGoal, float tmpC) {
    x = tmpX;
    y = tmpY;
    flg = tmpFlg;
    speed = tmpSpeed;
    roundness = tmpRound;
    val = tmpVal;
    goal = tmpGoal;
    c = tmpC;
    size = goal;
    t = 0;
  }

  void move() {
    if (flg > 0) {
      x += speed;
      if (x > width + goal * 100) {
        flg *= -1;
      }
    }
    else {
      x -= speed;
      if (x < - goal * 100) {
        flg *= -1;
      }
    }

    t += 0.05;

    if (x < -goal*100 || x > width + goal*100) {
      y = random(height);

      speed = random(1, 5);
      roundness = random(0.89, 1.24); //花のまるっこさ 0.9 ~ 1.2 あたりが良いかも
      val = (int)random(6, 8.9); //花びらの枚数
      goal = random(0.2, 0.5); //最終的なサイズ
      c = random(360); //色
    }
  }

  void display() {
    peacock(x, y);
  }

  void peacock(float x, float y) {
    for (int i = 6;i>=3;i-=2) {
      noStroke();
      fill(360, 50);
      drop(x, y, i);
      //fill(222,83,86,50);
      fill(c, 50, 100, 50);
      drop(x, y, i-1);
    }
  }

  void drop(float x, float y, int p) {
    for (int i = 0 ; i < val; i++) {
      pushMatrix();
      translate(x, y);
      if (flg > 0) {
        rotate(t*(speed-0.5));
      }
      else {
        rotate(-t*(speed-0.5));
      }
      rotate(radians((360/ val) * i));

      for (int j = 10; j > 0;j--) {
        ellipse(0, j*p*roundness*size, (j*p+3)*size, (j*p+3)*size);
      }
      popMatrix();
    }
  }
}


