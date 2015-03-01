
float _angnoise;// noise関数で角度を出す
float _radiusnoise;// noise関数で半径
float _xnoise;// x座標をnoise
float _ynoise;// y座標をnoise
float _angle = -PI/2;// 角度
float _radius;// 半径
float _strokeCol = 254;// 線の色
int _strokeChange = -1;// 線の色をフレーム毎に変える　白と黒をいったりきたり

void setup(){
  colorMode(HSB,100);
  size(500,500);
  smooth();
  frameRate(30);
  background(0,0,0);
  noFill();
  // グローバル変数を0~10でランダムの数字を代入
  _angnoise = random(10);
  _radiusnoise = random(10);
  _xnoise = random(10);
  _ynoise = random(10);
}

void draw(){

  //半径が200~340の間をゆらいでいる
  _radiusnoise += 0.005;
  _radius = (noise(_radiusnoise)*550)+1;
  
  //角度が0~360の間をゆらいでいる
  _angnoise += 0.005;
  _angle += (noise(_angnoise) * 6) - 3;
  println(_angle);
  
  // 0をきったら360が代入され、360を超えたら0にもどされる
  // 0〜360の間をいったりきたりしてる
  if(_angle >360){
    _angle -= 360;
  }
  if(_angle<0){
    _angle += 360;
  }
  
  // 時計の中心座標がゆらいでいる
  _xnoise += 0.01; 
  _ynoise += 0.01;
  float centerx = width/2 + (noise(_xnoise)*100)-50;
  float centery = height/2 + (noise(_ynoise)*100)-50;
  
  // 開始点と終了点の座標
  float rad = radians(_angle);
  float x1 = centerx + (_radius * cos(rad));
  float y1 = centery + (_radius * sin(rad));
  
  float opprad = rad + PI;
  float x2 = centerx + (_radius * cos(opprad));
  float y2 = centery + (_radius * sin(opprad));
  
  // 線の色を白と黒でいったりきたり
  // _strokeCol += _strokeChange;
  // if(_strokeCol > 254){
  //   _strokeChange = -1;
  // }
  // if(_strokeCol<0){
  //   _strokeChange = 1;
  // }
  // stroke(_strokeCol,60);
  stroke(random(180),100,100,20);
  strokeWeight(1);// 線の太さ
  line(x1,y1,x2,y2);// 線の命令
}
