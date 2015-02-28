
int numNumbers = 10;
PImage[] images = new PImage[numNumbers];

void setup() {
  size(320, 480);
  background(255);
  frameRate(1);
  // 画像の読み込み
  for (int i = 0; i < numNumbers; i++) {
      images[i] = loadImage(i + ".png");
  }
}

void draw() {
  background(255);
  
  int h = hour(); // 時
  int h10 = int(h / 10); // 時の10の位
  int h1 = h % 10; // 時の1の位
  image(images[h10], 75, 60); // 時の10の位を表示
  image(images[h1], 175, 60); // 時の1の位を表示
  
  int m = minute(); // 分
  int m10 = int(m / 10); // 分の10の位
  int m1 = m % 10; // 分の1の位
  image(images[m10], 75, 180); // 分の10の位を表示
  image(images[m1], 175, 180); // 分の1の位を表示
  
  int s = second(); // 秒
  int s10 = int(s / 10); // 秒の10の位
  int s1 = s % 10; // 秒の1の位
  image(images[s10], 75, 300); // 秒の10の位を表示
  image(images[s1], 175, 300); // 秒の1の位を表示
  //println(s10 + " " + s1 + " | " + s);
}

