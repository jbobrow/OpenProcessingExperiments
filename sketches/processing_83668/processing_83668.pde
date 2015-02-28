
int leaf = 1;  //  葉っぱの数
int col = 0;   //  色
int deep = 0;  //  面の濃さ
final int MAX_POINT = 2;   //  ベジェ曲線コントロールポイントの数
ControlPoint[] c = new ControlPoint[MAX_POINT];  // 　ベジェ曲線コントロールポイント
int timer = 0;  //  タイマー

//  ベジェ曲線用コントロールポイント
class ControlPoint{
  float angle;       //  角度
  float angleSpeed;  //  角度の変化速度  
  float angleSpeed2; //  角度の変化加速度
  float angleOffset; //  角度のオフセット（各葉っぱを描く際のずれ）
  float r;           //  葉っぱの長さ
  float rSpeed;      //  長さの変化速度
  float rSpeed2;     //  長さの変化加速度
  
  ControlPoint(){
    init();
  }
  
  //  各値の初期化
  void init(){
    angle = random(360);
    angleSpeed = random(8) - 4;
    angleSpeed2 = (random(2) - 1) / 50.0;
    r = random(200);
    rSpeed = random(8) - 4;
    rSpeed2 = (random(2) - 1) / 50.0;
  }
  
  //  オフセットの設定
  void setAngle(float offset){
    angleOffset = offset;
  }
  
  //  コントロールポイントXを得る。
  float getX(){
    return cos(radians(angle + angleOffset)) * r + width / 2; 
  }
  
  //  コントロールポイントYを得る。
  float getY(){
    return sin(radians(angle + angleOffset)) * r + height / 2; 
  }
  
  //  コントロールポイントを動かす。
  void act(){
    angle += angleSpeed;
    angleSpeed += angleSpeed2;
    r += rSpeed;
    rSpeed += rSpeed2;
  }
}

void setup(){
  size(600, 600);
  background(0);
  stroke(255);
  colorMode(HSB, 360);
  
  for(int i = 0; i < MAX_POINT; i++){
    c[i] = new ControlPoint();
  }
  initialize();
}



void draw(){
  //  面と線の色を毛低
  fill(col, 360, 360, deep);
  stroke(col, 360, 360);

  float cx = width / 2;    //  キャンパスの中心
  float cy = height / 2;   //  キャンパスの中心
  float angleOffset = 360 / leaf;  //  葉っぱの角度の幅を計算
  
  //  各葉っぱを描画
  for(int i = 0; i <= leaf; i++){
    float angle = i * angleOffset - 90;          //  葉っぱの向き
    float x = cos(radians(angle)) * 250 + cx;    //  葉っぱの先っぽの座標
    float y = sin(radians(angle)) * 250 + cy;    //  葉っぱの先っぽの座標
    c[0].setAngle(angle);  //  コントロールポイントに角度をセットしておく。
    c[1].setAngle(angle);  //  コントロールポイントに角度をセットしておく。
    
    //  ベジェ曲線を利用して葉っぱを描画
    bezier(cx, cy, c[0].getX(), c[0].getY(), c[1].getX(), c[1].getY(), x, y); 
  }
  
  //  コントロールポイントを移動
  for(int i = 0; i < MAX_POINT; i++){
    c[i].act();
  }
  
  //  フェードアウト
  fill(0, 8);
  rect(0, 0, width, height);
  
  //  一定時間経過したら次の花を生成する。
  timer++;
  if(timer >= 200){
    initialize();
  }

}

//  初期化
void initialize(){
  leaf = int(random(17)) + 3;
  col = int(random(360));
  deep = int(random(10));
  deep = deep * deep;
  timer = 0;
  for(int i = 0; i < MAX_POINT; i++){
    c[i].init();
  }  
}

//  マウスクリックでも初期化
void mousePressed(){
  initialize();
  
}
