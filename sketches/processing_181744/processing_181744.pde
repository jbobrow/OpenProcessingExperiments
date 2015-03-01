
// Processing課題2
// 完成したら、次の手順で提出
// (1) 保存する
// (2) Tools→Applet Export and Signerを実行
// (3) ファイルエクスプローラで、"applet"フォルダー名を自分の学籍番号（M01xxxxx）に変更
// (4) 発表資料・プログラム説明書（Kadai_2.pptx）をフォルダーM01xxxxxの中に入れる
// (5) そのフォルダーをzip圧縮し、ファイルM01xxxxx.zipをASSITで提出
//
// MOSHI JOUKI NO NIHONGO GA YOMENAI BAAI HA "File" MENYU KARA "Preferences" WO JIKKOU SHI, 
// "Editor and Console font" NO SHITEI WO "MS GOSHIKKU" (KATAKANA) NI SHITE "Ok" BOTAN WO OSU 
//
void drawName(int w, int h) {
  //■次の一行は必ず自分の学籍番号・氏名に変更してください
  text("M0114098 小川峻矢", w, h);
}
//// 以下、変更してください

void draw() {
  background(255, 255, 255);
  noFill();
  stroke(0);
  strokeWeight(1);
  //■次の一行は、xxxxxのところを自分の学籍番号（下5ケタ）に変更してください  
  drawM0114098();
  //■次の一行は、最終的には 必 ず コメントアウト（または削除）してください
  //drawRuler(width, height);//目盛を描画する（参考用）。目盛が邪魔ならコメントアウト（Ctrl+/）してよい。
  
  drawNameOutlined();//この行を間違えて削除・変更しないように
}
////////■以降、自由に追加・変更してください。
////////■自動的、またはインタラクションにより動く作品を作ること

int X = 0;



void drawM0114098() {//■この行は、xxxxxのところを自分の学籍番号（下5ケタ）に変更してください。
  drawbike();
  drawhito();
X+= 10;
if(X > 1000){
  X = -350;
}

}




void drawbike() { 
  
  
  if(key == 'a') {
  X+=   30;
}

if(key == 's') {
  X+=   10;
}

if(key == 'd') {
  X+=   -10;
}

if(key == 'f') {
  X+=   -20;
}

if(key == 'g') {
  X+=   80;
}


  strokeWeight(5);
  line(100 + X, 400, 200 + X, 400);
  line(100 + X, 400, 100 + X, 410);
  line(10 + X, 410, 100 + X, 410);
  line(10 + X, 410, 90 + X, 470);
  line(90 + X, 470, 250 + X, 470);
  line(250 + X, 470, 270 + X, 440);
  line(270 + X, 440, 330 + X, 470);
  line(330 + X, 470, 240 + X, 330);
  line(200 + X, 400, 180 + X, 440);
  line(180 + X, 440, 230 + X, 440);
  line(230 + X, 440, 230 + X, 330);
  line(215 + X, 330, 270 + X, 330);//sita
  line(215 + X, 330, 215 + X, 290);//hidari
  line(215 + X, 290, 255 + X, 305);//上
  line(255 + X, 305, 270 + X, 330);
  
  ellipse(40 + X, 480, 60, 60);
  ellipse(280 + X, 480, 60, 60);
  
  

  line(57 + X, 450, 30 + X, 480);
  line(62 + X, 455, 35 + X, 485);
  line(30 + X, 480, 35 + X, 485);
  triangle(23 + X, 420, 35 + X, 430, 0 + X, 460);
  
  strokeWeight(15);
  line(102 + X, 395, 195 + X, 395);
  
  line(0, 510, 1000, 510);
 
  
  
}
void drawhito() {
  
  strokeWeight(10);
  line(15 + X, 395, 85 + X, 395); 
  line(50 + X, 395, 50 + X, 407);
   line(150 + X, 280, 150 + X, 380);
  line(150 + X, 380, 200 + X, 370);
  line(200 + X, 370, 210 + X, 440);
  line(150 + X, 300, 230 + X, 320);
  
  fill(0, 0, 0);
  ellipse(150 + X, 250, 60, 60);
  

 
  
}
void mousePressed() {
}
void mouseReleased() {
}
void mouseDragged() {
}
void mouseMoved() {
}
void keyReleased() {
}
////////■追加・変更は以上の行まで。これ以下は変更しない

void setup() {
  size(1000, 600);
  smooth();
  noFill();
  textFont(createFont("HGPｺﾞｼｯｸM", 40));
  textSize(40);
  textAlign(RIGHT, BOTTOM);
}
void drawRuler(int xMax, int yMax) {//目盛を描画する。左上（0, 0)、右下(xMax, yMax)の範囲
  drawLattice(xMax, yMax, 10, 240);//とても薄いグレーで10画素間隔格子を描画
  drawLattice(xMax, yMax, 50, 210);//やや薄いグレーで50画素間隔格子を描画
  drawLattice(xMax, yMax, 100, 160);//比較的濃いグレーで100画素間隔格子を描画
}
//縦横の格子状に線分を描く
//(0, 0)と(xMax, yMax)の間の範囲に間隔interval画素でstrokeColorの色の縦横線を描く
void drawLattice(int xMax, int yMax, int interval, int strokeColor) {
  stroke(strokeColor);
  for (int x = 0; x < xMax; x += interval) {
    line(x, 0, x, yMax - 1);
  }
  for (int y = 0; y < yMax; y += interval) {
    line(0, y, xMax - 1, y);
  }
}
void drawNameOutlined() {
  fill(255);
  drawName(width - 2, height - 2);
  drawName(width - 0, height - 2);
  drawName(width - 2, height - 0);
  drawName(width - 0, height - 0);
  fill(0);
  drawName(width - 1, height - 1);
}


