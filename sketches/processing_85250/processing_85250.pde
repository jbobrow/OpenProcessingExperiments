
class Flower {
  float x;
  float y;
  float roundness; 
  float size; //大きさ
  int val;
  float goal; //最終的なサイズ
  float c; //色

  Flower(float tmpX, float tmpY) {
    x = tmpX;
    y = tmpY;

    //花のまるっこさ 0.9 ~ 1.2 あたりが良いかも
    //数字が小さい方がまるい
    roundness = 0.9;//random(0.89,1.24); 
    //花びらの枚数
    val = 6; //(int)random(6,8.9); 
    //最終的なサイズ
    goal = 0.5;//random(0.1,0.5);
    //色相 
    c = 0;
    //可変サイズ
    size = goal;
  }

  void display() {
    peacock(x, y);
  }

  void peacock(float x, float y) {
    for (int i = 6;i>=3;i-=2) {
      noStroke();
      fill(c, 50, 100);
      drop(x, y, i);
      fill(360);
      drop(x, y, i-1);
    }
  }

  void drop(float x, float y, int p) {
    for (int i = 0 ; i < val; i++) {
      pushMatrix();
      translate(x, y);
      rotate(radians((360/ val) * i));

      for (int j = 10; j > 0;j--) {
        ellipse(0, j*p*roundness*size, (j*p+3)*size, (j*p+3)*size);
      }
      popMatrix();
    }
  }
}


