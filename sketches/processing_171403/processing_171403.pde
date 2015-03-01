
//変数宣言
float det = random(0, 100);
int ct = 0;
int ca = int(random(0, 360));
int cb = int(random(0, 100));
int cc = int(random(50, 100));
int cd = int(random(0, 360));
int ce = int(random(0, 100));
int cf = int(random(50, 100));

//基本設定
size(600, 300);
colorMode(HSB, 360, 100, 100);
smooth(); 

//右側バックグラウンド
background(ca, cb, cd);

//右側グラフ描画
{
  stroke(cd, ce, cf);
  for (int x = 300; x < width; x++)
  {
    float y = noise((x + ct) / det) * height;
    rect(x, 0, x, y);
  }
}

//左側バックグラウンド
noStroke();
fill(ca, 100, 100);
rect(0, 0, 300, 300);

//中央白四角
rectMode(CENTER);
fill(#FFFFFF);
rect(150, 150, 220, 220);

//中央グラデーション丸
{
  int size = 200;
  int f = 150;
  int g = 150;
  fill(cd, 100, 100, 10);
  for (int i=0; i<16; i++)
  {
    ellipse(f, g, size, size);
    size = size - 20;
  }
}

//中央二重丸
stroke(ca, 100, 100);
strokeWeight(15);
ellipse(150, 150, 200, 200);
ellipse(150, 150, 250, 250);

//センター塗りつぶし丸
noStroke();
fill(ca, 100, 100);
ellipse(150, 150, 50, 50);



