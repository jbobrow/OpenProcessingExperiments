
int x, y;
int eSize;

void setup() {
  size(500, 500);//画面サイズ
  background(255);//背景色
  noStroke();
  smooth();//アンチエイリアスをかける
  fill(0);
}

void draw() {
  rect(x, y, eSize, eSize);
}

void mouseDragged() {
  rect(mouseX, mouseY, 40, 40, 4);//ドラッグで四角形を描画
}
void keyPressed() {
  switch(key) {
  case '0':
    fill(255, 255, 255);//消しゴム
    break;
  case '1':
    fill(255, 255, random(80));//黄系
    break;
  case '2':
    fill(255, random(70), random(50));//赤系
    break;
  case '3':
    fill(random(80), random(40), 255);//青系
    break;
  case '4':
    fill(255, 255, 0, 50);//うすい黄
    break;
  case '5':
    fill(255, 0, 0, 50);//うすい赤
    break;
  case '6':
    fill(0, 0, 255, 50);//うすい青
    break;
  case '7':
    fill(95, 252, 35, 50);//うすい緑
    break;
    case '8':
    fill(255, 132, 5, 50);//うすいオレンジ
    break;
   case '9':
    fill(221, 5, 250, 50);//うすい紫
    break;
  }
}

