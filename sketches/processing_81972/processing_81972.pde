
// 【参考】
// サイクロイド - Wikipedia
// http://ja.wikipedia.org/wiki/サイクロイド
float r = 50;
float phi = 0;
float x, y;

void setup() {
  size(500, 100);
}

void draw() {
  phi += 0.01;
  x = r*(phi - sin(phi));
  x *= .5; // 横幅のスケールを圧縮した方が良いかな？
  y = r*(1 - cos(phi));
  y = height - y; // Y軸のプラスの方向を上に変換する
  point(x, y);
}
